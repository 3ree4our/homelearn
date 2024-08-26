package org.threefour.homelearn.payment.domain;

import lombok.*;

import java.sql.Timestamp;
import java.util.Date;


@Getter
@Setter
@NoArgsConstructor
@ToString
public class Payment {
  private long id;
  private long orderer_id;
  private String imp_uid;
  private int paid_amount;
  private int refunded_amount;
  private int remained_amount;
  private Timestamp created_at;
  private String errorMessage;
}
