package org.threefour.homelearn.payment.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@NoArgsConstructor
@ToString
public class Payment {

  private String imp_uid;
  private String merchant_uid;
  private String member_id;
  private String order_id;
  private int paid_amount;
  private int refunded_amount;
  //private Date created_at;
  //private  String status;
}
