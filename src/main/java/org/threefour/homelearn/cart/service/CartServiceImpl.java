package org.threefour.homelearn.cart.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.threefour.homelearn.cart.domain.GetCartResponse;
import org.threefour.homelearn.cart.mapper.CartMapper;
import org.threefour.homelearn.course.service.CourseService;
import org.threefour.homelearn.order.domain.CourseOrderRequest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.springframework.transaction.annotation.Isolation.READ_COMMITTED;
import static org.springframework.transaction.annotation.Isolation.READ_UNCOMMITTED;

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
    @Transactional(isolation = READ_COMMITTED, readOnly = true, timeout = 20)
    public GetCartResponse get(Long studentId) {
        return GetCartResponse.from(studentId, cartMapper.findByStudentId(studentId), courseService);
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
