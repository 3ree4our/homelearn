package org.threefour.homelearn.order.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;
import org.threefour.homelearn.order.domain.GetOrderResponse;
import org.threefour.homelearn.order.domain.PaidOrderRequest;
import org.threefour.homelearn.order.service.OrderService;

import javax.servlet.http.HttpSession;

import static org.springframework.http.HttpStatus.NO_CONTENT;
import static org.threefour.homelearn.cart.RequestConstant.*;

@Controller
@RequiredArgsConstructor
public class OrderController {
  private final OrderService orderService;

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

  @PostMapping("/cancel-order.do")
  public ResponseEntity<Void> createOrder(@RequestBody PaidOrderRequest paidOrderRequest, HttpSession session) {
    orderService.createOrder(paidOrderRequest);
    // todo 수정 요망
    session.setAttribute("임시로", paidOrderRequest.getCourseOrderRequests());

    return ResponseEntity.status(NO_CONTENT).build();
  }
}
