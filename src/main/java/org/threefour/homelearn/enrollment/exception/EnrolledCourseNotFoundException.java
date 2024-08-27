package org.threefour.homelearn.enrollment.exception;

import org.threefour.homelearn.exception.EntityNotFoundException;

public class EnrolledCourseNotFoundException extends EntityNotFoundException {
    public EnrolledCourseNotFoundException(String message) {
        super(message);
    }
}