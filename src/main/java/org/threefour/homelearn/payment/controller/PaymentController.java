package org.threefour.homelearn.payment.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.threefour.homelearn.payment.domain.Payment;
import org.threefour.homelearn.payment.domain.PaymentRequest;
import org.threefour.homelearn.payment.service.PaymentService;

@Controller
@RequestMapping("/payment")
public class PaymentController {
  private static Logger log = LoggerFactory.getLogger(PaymentController.class);

  @Autowired
  private PaymentService paymentService;

  @GetMapping("/paymentForm.do")
  public String pay() {
    return "payment/payment";
  }

  @PostMapping("/complete")
  public ResponseEntity<Payment> completePayment(@RequestBody PaymentRequest paymentRequest) {
    try {
      //String imp_uid = paymentRequest.getImp_uid();
      //String merchant_uid = paymentRequest.getMerchant_uid();
      //int amount = paymentRequest.getAmount();

      ////주문 정보 조회
      //Order order = orderService.findById(paymentRequest.getMerchant_uid());
      //if (order == null) {
      //    return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Order not found");
      //}

      // 결제 검증

      //System.out.println("yahoo!"); 여기까진 옴


      return ResponseEntity.ok(paymentService.verifyPayment(paymentRequest));
    } catch (Exception e) {
      log.info("Payment verification failed: " + e.getMessage());
      return null;
      //return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Payment verification failed: " + e.getMessage());
    }
  }

  @PostMapping("/cancel")
  public ResponseEntity<?> cancelPayment(@RequestBody PaymentRequest paymentRequest) {
    try {
      // 주문 정보 조회
      //Order order = orderService.findById(paymentRequest.getMerchant_uid());
      //if (order == null) {
      //    return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Order not found");
      //}
      //System.out.println(paymentRequest);
      // 결제 취소
      paymentService.cancelPayment(paymentRequest);


      return ResponseEntity.ok("Payment cancelled successfully");
    } catch (Exception e) {
      return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Payment cancellation failed: " + e.getMessage());
    }
  }
}
