package org.threefour.homelearn.order.domain;

import lombok.Builder;

import java.sql.Timestamp;

public class Order {
    private String impUid;
    private Long ordererId;
    private String merchantUid;
    private Timestamp createdAt;
    private Timestamp modifiedAt;

    @Builder
    private Order(String impUid, Long ordererId, String merchantUid, Timestamp createdAt, Timestamp modifiedAt) {
        this.impUid = impUid;
        this.ordererId = ordererId;
        this.merchantUid = merchantUid;
        this.createdAt = createdAt;
        this.modifiedAt = modifiedAt;
    }

    public static Order from(PaidOrderRequest paidOrderRequest) {
        return Order.builder()
                .impUid(paidOrderRequest.getImpUid())
                .ordererId(paidOrderRequest.getOrdererId())
                .merchantUid(paidOrderRequest.getMerchantUid())
                .build();
    }
}
