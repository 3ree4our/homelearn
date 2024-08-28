package org.threefour.homelearn.payment.service;

import org.threefour.homelearn.payment.domain.Payment;
import org.threefour.homelearn.payment.domain.PaymentRequest;


import java.util.List;

public interface PaymentService {
  //void cancelPaymentOnPortOne(String impUid, int cancel_amount, String accessToken);

  Payment verifyPayment(PaymentRequest paymentRequest) throws Exception;
  void cancelPayment(long ordererId, long CourseId, String impUid, int price) throws Exception;
  void savePayment(Payment payment);
  List<Payment> getPaymentByImpUid(String imp_uid);

  List<Payment> getPaymentsByOrderer_id(long orderer_id, int offset, int limit);
  int getTotalPaymentsByOrderer_id(long orderer_id);
}
