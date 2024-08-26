package org.threefour.homelearn.order.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.threefour.homelearn.order.domain.PaidOrderRequest;
import org.threefour.homelearn.order.service.OrderService;

import static org.springframework.http.HttpStatus.NO_CONTENT;

@Controller
@RequiredArgsConstructor
public class OrderController {
    private final OrderService orderService;

    @PostMapping("/submit-order.do")
    public ResponseEntity<Void> createOrder(@RequestBody PaidOrderRequest paidOrderRequest) {
        orderService.createOrder(paidOrderRequest);

        return ResponseEntity.status(NO_CONTENT).build();
    }
}
