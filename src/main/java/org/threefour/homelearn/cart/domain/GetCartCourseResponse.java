package org.threefour.homelearn.cart.domain;

import lombok.Builder;
import lombok.Getter;
import org.threefour.homelearn.course.domain.Course;

import java.sql.Timestamp;

@Getter
public class GetCartCourseResponse {
    private Long id;
    private Course course;
    private String subjectName;
    private Timestamp createdAt;
    private Timestamp modifiedAt;

    @Builder
    private GetCartCourseResponse(
            Long id, Course course, String subjectName, Timestamp createdAt, Timestamp modifiedAt
    ) {
        this.id = id;
        this.course = course;
        this.subjectName = subjectName;
        this.createdAt = createdAt;
        this.modifiedAt = modifiedAt;
    }

    public static GetCartCourseResponse from(CartCourse cartCourse, String subjectName) {
        return GetCartCourseResponse.builder()
                .id(cartCourse.getId())
                .course(cartCourse.getCourse())
                .subjectName(subjectName)
                .createdAt(cartCourse.getCreatedAt())
                .modifiedAt(cartCourse.getModifiedAt())
                .build();
    }
}
