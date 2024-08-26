package org.threefour.homelearn.order.service;

import org.threefour.homelearn.order.domain.PaidOrderRequest;

public interface OrderService {
    void createOrder(PaidOrderRequest paidOrderRequest);
}
