package org.threefour.homelearn.payment.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.threefour.homelearn.enrollment.service.EnrollmentService;
import org.threefour.homelearn.payment.domain.Payment;
import org.threefour.homelearn.payment.domain.PaymentRequest;
import org.threefour.homelearn.payment.service.PaymentService;

import java.util.List;

@Controller
@RequestMapping("/payment")
public class PaymentController {
  private static Logger log = LoggerFactory.getLogger(PaymentController.class);

  @Autowired
  private PaymentService paymentService;
  private EnrollmentService enrollmentService;

  public PaymentController(PaymentService paymentService) {
    this.paymentService = paymentService;
  }

  @GetMapping("/paymentForm.do")
  public String pay() {
    return "/payment";
  }

  //결제 검증
  @PostMapping("/complete")
  public ResponseEntity<Payment> completePayment(@RequestBody PaymentRequest paymentRequest) {
    try {
            return ResponseEntity.ok(paymentService.verifyPayment(paymentRequest));
        } catch (Exception e) {
            log.info("Payment verification failed: " + e.getMessage());
            return null;
        }
    }

    //결제 히스토리
    @GetMapping("/paymentsByOrderer_id/{orderer_id}")
    public ModelAndView paymentsByOrderer_id(
            @PathVariable("orderer_id") Long orderer_id,
            @RequestParam(value = "page", defaultValue = "0") int page,
            @RequestParam(value = "size", defaultValue = "3") int size){

      return ResponseEntity.ok(paymentService.verifyPayment(paymentRequest));
    } catch (Exception e) {
      log.info("Payment verification failed: " + e.getMessage());
      return null;
    }
  }

  //결제 취소
  //결제 취소
  @PostMapping("/cancel.do")
  public String cancelPayment(@RequestParam Long ordererId, @RequestParam Long courseId, @RequestParam String impUid, @RequestParam int price) {
    try {
      return ResponseEntity.ok("Payment cancelled successfully");
    } catch (Exception e) {
      return null;
    }
  }


  //결제 히스토리
  //결제 히스토리
  @GetMapping("/paymentsByOrderer_id/{orderer_id}")
  public ModelAndView paymentsByOrderer_id(
          @PathVariable("orderer_id") Long orderer_id,
          @RequestParam(value = "page", defaultValue = "0") int page,
          @RequestParam(value = "size", defaultValue = "3") int size){




    int offset = page*size;
    List<Payment> payments = paymentService.getPaymentsByOrderer_id(orderer_id, offset, size);
    int totalPayments = paymentService.getTotalPaymentsByOrderer_id(orderer_id);
    int totalPages = (int)Math.ceil((double)totalPayments/size);


    //ModelAndView 생성
    ModelAndView modelAndView = new ModelAndView("/paymentHistory");
    modelAndView.addObject("payments", payments);
    modelAndView.addObject("currentPage", page);
    modelAndView.addObject("totalPages", totalPages);
    modelAndView.addObject("totalItems", totalPayments);
    return modelAndView;
  }

  //주문당 결제 히스토리
  @PostMapping("/paymentsByImpUid")
  public ModelAndView paymentsByImpUid(@RequestParam("imp_uid") String imp_uid){
    List<Payment> payments = paymentService.getPaymentByImpUid(imp_uid);

    //ModelAndView 생성
    ModelAndView modelAndView = new ModelAndView("/paymentHistoryByImpUid");
    modelAndView.addObject("payments", payments);
    return modelAndView;
  }
}