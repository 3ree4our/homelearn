package org.threefour.homelearn.order.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.threefour.homelearn.cart.service.CartService;
import org.threefour.homelearn.course.domain.Course;
import org.threefour.homelearn.course.service.CourseService;
import org.threefour.homelearn.enrollment.domain.EnrolledCourse;
import org.threefour.homelearn.enrollment.service.EnrollmentService;
import org.threefour.homelearn.order.domain.CourseOrderRequest;
import org.threefour.homelearn.order.domain.GetOrderResponse;
import org.threefour.homelearn.order.domain.Order;
import org.threefour.homelearn.order.domain.PaidOrderRequest;
import org.threefour.homelearn.order.mapper.OrderMapper;
import org.threefour.homelearn.payment.domain.Payment;
import org.threefour.homelearn.payment.service.PaymentService;

import java.util.ArrayList;
import java.util.List;

import static org.springframework.transaction.annotation.Isolation.READ_COMMITTED;
import static org.springframework.transaction.annotation.Isolation.READ_UNCOMMITTED;

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
    @Transactional(isolation = READ_COMMITTED, readOnly = true, timeout = 10)
    public GetOrderResponse get(String impUid) {
        Order order = orderMapper.findByImpUid(impUid);
        if (order == null) {

        }
        List<Payment> payments = paymentService.getPaymentByImpUid(impUid);
        List<EnrolledCourse> enrolledCourses = enrollmentService.get(impUid);
        List<Course> courses = new ArrayList<>();
        for (EnrolledCourse enrolledCourse : enrolledCourses) {
            courses.add(courseService.courseDetail(enrolledCourse.getCourseId()));
        }

        return GetOrderResponse.from(order, payments, courses);
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
}
