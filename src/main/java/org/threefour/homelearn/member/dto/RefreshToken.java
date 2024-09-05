package org.threefour.homelearn.member.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;

@Getter
@Setter
@ToString
public class RefreshToken {
  private long id;

  private String username;
  private String refreshToken;
  private Timestamp expiration;
}