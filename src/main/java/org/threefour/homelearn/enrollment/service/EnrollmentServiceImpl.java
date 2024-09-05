package org.threefour.homelearn.enrollment.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.threefour.homelearn.enrollment.domain.EnrolledCourse;
import org.threefour.homelearn.enrollment.exception.EnrolledCourseNotFoundException;
import org.threefour.homelearn.enrollment.mapper.EnrollmentMapper;
import org.threefour.homelearn.exception.GlobalExceptionHandler;
import org.threefour.homelearn.order.domain.CourseOrderRequest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.springframework.transaction.annotation.Isolation.READ_COMMITTED;
import static org.springframework.transaction.annotation.Isolation.READ_UNCOMMITTED;
import static org.threefour.homelearn.enrollment.exception.ExceptionMessage.ENROLLED_COURSE_NOT_FOUND_EXCEPTION_MESSAGE;

@Service
@RequiredArgsConstructor
@Transactional(isolation = READ_UNCOMMITTED, timeout = 10)
public class EnrollmentServiceImpl implements EnrollmentService {
    private final EnrollmentMapper enrollmentMapper;

    private static final String IMP_UID_PARAMETER_NAME = "impUid";
    private static final String COURSE_ID_PARAMETER_NAME = "courseId";

    @Override
    @Transactional(isolation = READ_COMMITTED, readOnly = true, timeout = 10)
    public List<EnrolledCourse> get(String impUid) {
        List<EnrolledCourse> enrolledCourses = enrollmentMapper.findByImpUid(impUid);
        if (enrolledCourses == null || enrolledCourses.isEmpty()) {
            GlobalExceptionHandler.throwRuntimeException(
                    new EnrolledCourseNotFoundException(
                            String.format(ENROLLED_COURSE_NOT_FOUND_EXCEPTION_MESSAGE, impUid)
                    )
            );
        }

        return enrolledCourses;
    }

    @Override
    public void enrollCourses(String impUid, Long studentId, List<CourseOrderRequest> courseOrderRequests) {
        for (CourseOrderRequest courseOrderRequest : courseOrderRequests) {
            enrollmentMapper.save(EnrolledCourse.from(impUid, studentId, courseOrderRequest));
        }
    }

    @Override
    public void cancelEnrolledCourse(Long courseId, String impUid) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put(IMP_UID_PARAMETER_NAME, impUid);
        parameters.put(COURSE_ID_PARAMETER_NAME, courseId);
        enrollmentMapper.cancel(parameters);
    }
}
