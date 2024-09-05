package org.threefour.homelearn.cart.domain;

import java.sql.Timestamp;
import java.util.List;

public class Cart {
    private Long studentId;
    private List<CartCourse> cartCourses;
    private Timestamp createdAt;
    private Timestamp modifiedAt;

    Long getStudentId() {
        return studentId;
    }

    List<CartCourse> getCartCourses() {
        return cartCourses;
    }

    Timestamp getCreatedAt() {
        return createdAt;
    }

    Timestamp getModifiedAt() {
        return modifiedAt;
    }
}
