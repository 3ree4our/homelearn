package org.threefour.homelearn.enrollment.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.threefour.homelearn.enrollment.domain.EnrolledCourse;
import org.threefour.homelearn.enrollment.mapper.EnrollmentMapper;
import org.threefour.homelearn.order.domain.CourseOrderRequest;

import java.util.List;

@Service
@RequiredArgsConstructor
public class EnrollmentServiceImpl implements EnrollmentService {
    private final EnrollmentMapper enrollmentMapper;

    @Override
    public List<EnrolledCourse> get(String impUid) {
        return enrollmentMapper.findByImpUid(impUid);
    }

    @Override
    public void enrollCourses(String impUid, Long studentId, List<CourseOrderRequest> courseOrderRequests) {
        for (CourseOrderRequest courseOrderRequest : courseOrderRequests) {
            enrollmentMapper.save(EnrolledCourse.from(impUid, studentId, courseOrderRequest));
        }
    }
}
