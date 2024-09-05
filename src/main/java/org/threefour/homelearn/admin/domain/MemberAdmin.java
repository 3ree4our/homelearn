package org.threefour.homelearn.admin.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MemberAdmin {
  private long id;
  private String email;
  private String nickname;
  private Date createdAt;
  private Date modifiedAt;
  private String role;
  private String deleteYn;
}