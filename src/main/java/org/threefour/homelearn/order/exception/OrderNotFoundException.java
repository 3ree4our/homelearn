package org.threefour.homelearn.order.exception;

import org.threefour.homelearn.exception.EntityNotFoundException;

public class OrderNotFoundException extends EntityNotFoundException {
    public OrderNotFoundException(String message) {
        super(message);
    }
}