package org.threefour.homelearn.order.domain;

import lombok.Getter;

@Getter
public class CourseOrderRequest {
    private Long cartCourseId;
    private Long courseId;
    private String courseName;
}
