package org.threefour.homelearn.payment.mapper;

import org.threefour.homelearn.payment.domain.Payment;

import java.util.ArrayList;

public interface PaymentMapper {

    void insertPayment(Payment payment);

    Payment selectPaymentByImpUid(String imp_uid);

    ArrayList<Payment> selectPaymentByOrderer_id(String orderer_id);
}