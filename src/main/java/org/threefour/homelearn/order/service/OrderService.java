package org.threefour.homelearn.order.service;

import org.threefour.homelearn.order.domain.GetOrderResponse;
import org.threefour.homelearn.order.domain.PaidOrderRequest;

public interface OrderService {
    GetOrderResponse get(String impUid);

    void createOrder(PaidOrderRequest paidOrderRequest);
}
