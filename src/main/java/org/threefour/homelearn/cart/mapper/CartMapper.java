package org.threefour.homelearn.cart.mapper;

import org.threefour.homelearn.cart.domain.Cart;

import java.util.Map;

public interface CartMapper {
    Cart findByStudentId(Long studentId);

    void createCart(Long studentId);

    void insert(Map<String, Long> parameters);

    void delete(Map<String, Long> parameters);
}
