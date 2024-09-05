package org.threefour.homelearn.order.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;
import org.threefour.homelearn.cart.domain.PagingCount;
import org.threefour.homelearn.order.domain.GetOrderResponse;
import org.threefour.homelearn.order.domain.GetOrdersResponse;
import org.threefour.homelearn.order.domain.PaidOrderRequest;
import org.threefour.homelearn.order.service.OrderService;

import static org.springframework.http.HttpStatus.NO_CONTENT;
import static org.threefour.homelearn.cart.RequestConstant.*;
import static org.threefour.homelearn.order.RequestConstant.*;

@Controller
@RequiredArgsConstructor
public class OrderController {
    private final OrderService orderService;

    @GetMapping("/orders.do")
    public ModelAndView getOrders(Long ordererId, Integer size, Integer pageNumber) {
        if (size == null) {
            size = 3;
        }
        if (pageNumber == null) {
            pageNumber = 1;
        }

        GetOrdersResponse getOrdersResponse = orderService.get(ordererId, size, pageNumber);
        PagingCount PagingCount = orderService.getPagingCounts(ordererId, size);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject(ORDERS_PARAMETER_NAME, getOrdersResponse);
        modelAndView.addObject(PAGING_COUNTS_PARAMETER_NAME, PagingCount);
        modelAndView.addObject(SIZE_PARAMETER_NAME, size);
        modelAndView.addObject(PAGE_NUMBER_PARAMETER_NAME, pageNumber);
        modelAndView.setViewName(ORDERS_PARAMETER_NAME);

        return modelAndView;
    }

    @GetMapping("/order.do")
    public ModelAndView getOrder(String impUid) {
        GetOrderResponse getOrderResponse = orderService.get(impUid);

        return new ModelAndView(ORDER_VIEW_NAME, ORDER_PARAMETER_NAME, getOrderResponse);
    }

    @PostMapping("/submit-order.do")
    public ResponseEntity<Void> createOrder(@RequestBody PaidOrderRequest paidOrderRequest) {
        orderService.createOrder(paidOrderRequest);
        return ResponseEntity.status(NO_CONTENT).build();
    }
}
