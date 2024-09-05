package org.threefour.homelearn.cart.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.threefour.homelearn.cart.domain.Cart;
import org.threefour.homelearn.cart.domain.GetCartResponse;
import org.threefour.homelearn.cart.exception.CartNotFoundException;
import org.threefour.homelearn.cart.mapper.CartMapper;
import org.threefour.homelearn.course.service.CourseService;
import org.threefour.homelearn.order.domain.CourseOrderRequest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.springframework.transaction.annotation.Isolation.READ_UNCOMMITTED;
import static org.springframework.transaction.annotation.Isolation.REPEATABLE_READ;
import static org.threefour.homelearn.cart.exception.ExceptionMessage.CART_NOT_FOUND_EXCEPTION_MESSAGE;

@Service
@RequiredArgsConstructor
@Transactional(isolation = READ_UNCOMMITTED, timeout = 10)
public class CartServiceImpl implements CartService {
    private final CartMapper cartMapper;
    private final CourseService courseService;

    private static final String STUDENT_ID_PARAMETER_NAME = "studentId";
    private static final String COURSE_ID_PARAMETER_NAME = "courseId";
    private static final String CART_COURSE_ID_PARAMETER_NAME = "cartCourseId";

    @Override
    @Transactional(isolation = REPEATABLE_READ, readOnly = true, timeout = 20)
    public GetCartResponse get(Long studentId) {
        Cart cart = null;
        try {
            cart = getCart(studentId);
        } catch (CartNotFoundException cnfe) {
            createCart(studentId);
        }

        return GetCartResponse.from(studentId, cart, courseService);
    }

    private Cart getCart(Long studentId) throws CartNotFoundException {
        Cart cart = cartMapper.findByStudentId(studentId);
        if (cart == null) {
            throw new CartNotFoundException(String.format(CART_NOT_FOUND_EXCEPTION_MESSAGE, studentId));
        }

        return cart;
    }

    @Override
    public void createCart(Long studentId) {
        cartMapper.createCart(studentId);
    }

    @Override
    public void addCourse(Long studentId, Long courseId) {
        Map<String, Long> parameters = new HashMap<>();
        parameters.put(STUDENT_ID_PARAMETER_NAME, studentId);
        parameters.put(COURSE_ID_PARAMETER_NAME, courseId);

        cartMapper.insert(parameters);
    }

    @Override
    public void deleteCourses(Long studentId, List<CourseOrderRequest> courseOrderRequests) {
        for (CourseOrderRequest courseOrderRequest : courseOrderRequests) {
            deleteCourse(studentId, courseOrderRequest.getCartCourseId());
        }
    }

    @Override
    public void deleteCourse(Long studentId, Long cartCourseId) {
        Map<String, Long> parameters = new HashMap<>();
        parameters.put(STUDENT_ID_PARAMETER_NAME, studentId);
        parameters.put(CART_COURSE_ID_PARAMETER_NAME, cartCourseId);

        cartMapper.delete(parameters);
    }
}
