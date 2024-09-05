package org.threefour.homelearn.payment.mapper;

import org.apache.ibatis.annotations.Param;
import org.threefour.homelearn.payment.domain.Payment;

import java.util.ArrayList;
import java.util.List;

public interface PaymentMapper {

    void insertPayment(Payment payment);

    List<Payment> selectPaymentByImpUid(String imp_uid);

    //페이징
    List<Payment> selectPaymentsByOrderer_id(@Param("orderer_id") long orderer_id, @Param("offset") int offset, @Param("limit") int limit);

    int countPaymentsByOrderer_id(@Param("orderer_id") long orderer_id);
}