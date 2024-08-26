package org.threefour.homelearn.payment.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
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

    //결제 취소
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

    //결제 히스토리
    @PostMapping("/paymentsByOrderer_id")
    public ModelAndView paymentsByOrderer_id(
            @RequestParam("orderer_id") long orderer_id,
            @RequestParam(value = "page", defaultValue = "0") int page,
            @RequestParam(value = "size", defaultValue = "10") int size){


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
