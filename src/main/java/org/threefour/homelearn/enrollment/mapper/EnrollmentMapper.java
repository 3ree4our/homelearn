package org.threefour.homelearn.enrollment.mapper;

import org.threefour.homelearn.enrollment.domain.EnrolledCourse;

import java.util.List;

public interface EnrollmentMapper {
    List<EnrolledCourse> findByImpUid(String impUid);

    void save(EnrolledCourse enrolledCourse);
}
