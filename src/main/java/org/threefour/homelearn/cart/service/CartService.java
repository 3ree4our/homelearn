package org.threefour.homelearn.cart.service;

import org.threefour.homelearn.cart.domain.GetCartResponse;
import org.threefour.homelearn.order.domain.CourseOrderRequest;

import java.util.List;

public interface CartService {
    GetCartResponse get(Long studentId);

    void createCart(Long studentId);

    void addCourse(Long studentId, Long courseId);

    void deleteCourses(Long studentId, List<CourseOrderRequest> courseOrderRequests);

    void deleteCourse(Long studentId, Long cartCourseId);
}
