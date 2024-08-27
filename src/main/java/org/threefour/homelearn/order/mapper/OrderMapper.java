package org.threefour.homelearn.order.mapper;

import org.threefour.homelearn.order.domain.Order;

import java.util.List;
import java.util.Map;

public interface OrderMapper {
    List<Order> findByOrdererId(Map<String, Object> parameters);

    Order findByImpUid(String impUid);

    void save(Order order);

    int getSize(Long ordererId);
}
