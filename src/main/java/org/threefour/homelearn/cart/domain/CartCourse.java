package org.threefour.homelearn.cart.domain;

import org.threefour.homelearn.course.domain.Course;

import java.sql.Timestamp;

public class CartCourse {
    private Long id;
    private Course course;
    private Timestamp createdAt;
    private Timestamp modifiedAt;

    Long getId() {
        return id;
    }

    Course getCourse() {
        return course;
    }

    Timestamp getCreatedAt() {
        return createdAt;
    }

    Timestamp getModifiedAt() {
        return modifiedAt;
    }
}
