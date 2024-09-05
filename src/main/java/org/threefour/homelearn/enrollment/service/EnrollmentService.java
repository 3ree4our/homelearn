package org.threefour.homelearn.enrollment.service;

import org.threefour.homelearn.enrollment.domain.EnrolledCourse;
import org.threefour.homelearn.order.domain.CourseOrderRequest;

import java.util.List;

public interface EnrollmentService {
    List<EnrolledCourse> get(String impUid);

    void enrollCourses(String impUid, Long studentId, List<CourseOrderRequest> courseOrderRequests);

    void cancelEnrolledCourse(Long courseId, String impUid);
}
