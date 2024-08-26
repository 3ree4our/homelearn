package org.threefour.homelearn.payment.mapper;

import org.threefour.homelearn.payment.domain.Payment;

public interface PaymentMapper {

    void insertPayment(Payment payment);

    Payment selectPaymentByImpUid(String imp_uid);
}