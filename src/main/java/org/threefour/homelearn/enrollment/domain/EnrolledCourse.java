package org.threefour.homelearn.enrollment.domain;

import lombok.Builder;
import lombok.Getter;
import org.threefour.homelearn.order.domain.CourseOrderRequest;

import java.sql.Timestamp;

@Getter
public class EnrolledCourse {
    private Long id;
    private Long courseId;
    private String impUid;
    private Long studentId;
    private boolean isRefunded;
    private boolean isStarted;
    private Timestamp createdAt;
    private Timestamp modifiedAt;

    @Builder
    private EnrolledCourse(
            Long id, Long courseId, String impUid, Long studentId, boolean isRefunded,
            boolean isStarted, Timestamp createdAt, Timestamp modifiedAt
    ) {
        this.id = id;
        this.courseId = courseId;
        this.impUid = impUid;
        this.studentId = studentId;
        this.isRefunded = isRefunded;
        this.isStarted = isStarted;
        this.createdAt = createdAt;
        this.modifiedAt = modifiedAt;
    }

    public static EnrolledCourse from(String impUid, Long studentId, CourseOrderRequest courseOrderRequest) {
        return EnrolledCourse.builder()
                .courseId(courseOrderRequest.getCourseId())
                .impUid(impUid)
                .studentId(studentId)
                .isRefunded(false)
                .isStarted(false)
                .build();
    }
}
