package org.threefour.homelearn.order.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.threefour.homelearn.cart.domain.PagingCount;
import org.threefour.homelearn.cart.service.CartService;
import org.threefour.homelearn.course.domain.Course;
import org.threefour.homelearn.course.service.CourseService;
import org.threefour.homelearn.enrollment.domain.EnrolledCourse;
import org.threefour.homelearn.enrollment.service.EnrollmentService;
import org.threefour.homelearn.exception.GlobalExceptionHandler;
import org.threefour.homelearn.order.domain.*;
import org.threefour.homelearn.order.exception.OrderNotFoundException;
import org.threefour.homelearn.order.mapper.OrderMapper;
import org.threefour.homelearn.payment.domain.Payment;
import org.threefour.homelearn.payment.service.PaymentService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.springframework.transaction.annotation.Isolation.READ_COMMITTED;
import static org.springframework.transaction.annotation.Isolation.READ_UNCOMMITTED;
import static org.threefour.homelearn.order.exception.ExceptionMessage.ORDER_ID_NOT_FOUND_EXCEPTION_MESSAGE;

@Service
@RequiredArgsConstructor
@Transactional(isolation = READ_UNCOMMITTED, timeout = 10)
public class OrderServiceImpl implements OrderService {
    private final PaymentService paymentService;
    private final CartService cartService;
    private final EnrollmentService enrollmentService;
    private final CourseService courseService;
    private final OrderMapper orderMapper;

    @Override
    public GetOrdersResponse get(Long ordererId, Integer size, Integer pageNumber) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("ordererId", ordererId);
        parameters.put("size", size);
        parameters.put("pageSequence", (pageNumber - 1) * size);

        return GetOrdersResponse.from(orderMapper.findByOrdererId(parameters), paymentService);
    }

    @Override
    @Transactional(isolation = READ_COMMITTED, readOnly = true, timeout = 10)
    public GetOrderResponse get(String impUid) {
        Order order = orderMapper.findByImpUid(impUid);
        if (order == null) {
            GlobalExceptionHandler.throwRuntimeException(
                    new OrderNotFoundException(String.format(ORDER_ID_NOT_FOUND_EXCEPTION_MESSAGE, impUid))
            );
        }
        List<Payment> payments = paymentService.getPaymentByImpUid(impUid);
        List<EnrolledCourse> enrolledCourses = enrollmentService.get(impUid);
        List<Course> courses = new ArrayList<>();
        for (EnrolledCourse enrolledCourse : enrolledCourses) {
            courses.add(courseService.courseDetail(enrolledCourse.getCourseId()));
        }

        return GetOrderResponse.from(order, payments, courses, enrolledCourses);
    }

    @Override
    public void createOrder(PaidOrderRequest paidOrderRequest) {
        orderMapper.save(Order.from(paidOrderRequest));
        paymentService.savePayment(createPayment(paidOrderRequest));

        List<CourseOrderRequest> courseOrderRequests = paidOrderRequest.getCourseOrderRequests();
        enrollmentService.enrollCourses(
                paidOrderRequest.getImpUid(), paidOrderRequest.getOrdererId(), courseOrderRequests
        );
        cartService.deleteCourses(paidOrderRequest.getOrdererId(), courseOrderRequests);
    }

    private Payment createPayment(PaidOrderRequest paidOrderRequest) {
        Payment payment = new Payment();
        payment.setOrderer_id(paidOrderRequest.getOrdererId());
        payment.setImp_uid(paidOrderRequest.getImpUid());
        payment.setPaid_amount(paidOrderRequest.getPaidAmount());
        payment.setRemained_amount(paidOrderRequest.getPaidAmount());

        return payment;
    }

    @Override
    public PagingCount getPagingCounts(Long ordererId, Integer size) {
        int totalCount = orderMapper.getSize(ordererId);
        int pageCount = totalCount / size + (totalCount % size == 0 ? 0 : 1);

        return PagingCount.from(totalCount, pageCount);
    }
}
