package org.threefour.homelearn.member.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberRole {
  private Long memberId;
  private Long roleId;
}
