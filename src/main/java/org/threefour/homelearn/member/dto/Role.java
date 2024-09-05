package org.threefour.homelearn.member.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;

@Getter
@Setter
@ToString
public class Role {
  private Long id;
  private String role;
  private Timestamp createdAt;
  private Timestamp updatedAt;
}
