package org.threefour.homelearn.order.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.threefour.homelearn.cart.service.CartService;
import org.threefour.homelearn.order.domain.Order;
import org.threefour.homelearn.order.domain.PaidOrderRequest;
import org.threefour.homelearn.order.mapper.OrderMapper;
import org.threefour.homelearn.payment.domain.Payment;
import org.threefour.homelearn.payment.service.PaymentService;

import static org.springframework.transaction.annotation.Isolation.READ_UNCOMMITTED;

@Service
@RequiredArgsConstructor
@Transactional(isolation = READ_UNCOMMITTED, timeout = 10)
public class OrderServiceImpl implements OrderService {
  private final PaymentService paymentService;
  private final CartService cartService;
  private final OrderMapper orderMapper;

  @Override
  public void createOrder(PaidOrderRequest paidOrderRequest) {
    orderMapper.save(Order.from(paidOrderRequest));
    paymentService.savePayment(createPayment(paidOrderRequest));
    cartService.deleteCourses(paidOrderRequest.getOrdererId(), paidOrderRequest.getCourseOrderRequests());
  }

  private Payment createPayment(PaidOrderRequest paidOrderRequest) {
    Payment payment = new Payment();
    //payment.setOrderer_id(paidOrderRequest.getOrdererId());
    payment.setImp_uid(paidOrderRequest.getImpUid());
    payment.setPaid_amount(paidOrderRequest.getPaidAmount());
    //payment.setRemained_amount(paidOrderRequest.getPaidAmount());

    return payment;
  }
}
