package org.threefour.homelearn.order.service;

import org.threefour.homelearn.cart.domain.PagingCount;
import org.threefour.homelearn.order.domain.GetOrderResponse;
import org.threefour.homelearn.order.domain.GetOrdersResponse;
import org.threefour.homelearn.order.domain.PaidOrderRequest;

public interface OrderService {
    GetOrdersResponse get(Long ordererId, Integer size, Integer pageNumber);

    GetOrderResponse get(String impUid);

    void createOrder(PaidOrderRequest paidOrderRequest);

    PagingCount getPagingCounts(Long ordererId, Integer size);
}
