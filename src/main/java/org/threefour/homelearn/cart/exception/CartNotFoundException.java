package org.threefour.homelearn.cart.exception;

import org.threefour.homelearn.exception.EntityNotFoundException;

public class CartNotFoundException extends EntityNotFoundException {
    public CartNotFoundException(String message) {
        super(message);
    }
}