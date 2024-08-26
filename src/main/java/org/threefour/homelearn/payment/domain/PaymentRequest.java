package org.threefour.homelearn.payment.domain;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PaymentRequest {
  private String imp_uid;
  private String merchant_uid;
  private int paid_amount; //실제 결제 금액
  private int order_amount; //주문한 금액
  private int cancel_amount; //환불할 금액
  private String name; //결제건의 제품명
}
