package org.threefour.homelearn.payment.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PaymentRequest {
  private String imp_uid;
  private String merchant_uid;
  private String name; //결제건의 제품명
  private int amount;
  private String buyer_id;
}
