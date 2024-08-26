package org.threefour.homelearn.member.dto;

import lombok.*;

import java.sql.Timestamp;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Builder
@ToString
public class PaymentsResponseListDTO {
  private int payedAmount;
  private int refundedAmount;
  private String courseName;
  private Timestamp createdAt;
}
