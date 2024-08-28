package org.threefour.homelearn.enrollment.mapper;

import org.threefour.homelearn.enrollment.domain.EnrolledCourse;

import java.util.List;
import java.util.Map;

public interface EnrollmentMapper {
    List<EnrolledCourse> findByImpUid(String impUid);

    void save(EnrolledCourse enrolledCourse);

    void cancel(Map<String, Object> parameters);
}
