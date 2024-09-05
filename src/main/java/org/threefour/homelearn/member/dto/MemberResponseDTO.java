package org.threefour.homelearn.member.dto;

import lombok.*;
import org.threefour.homelearn.file.dto.AttachFile;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@NoArgsConstructor
@Getter
@Setter
@Builder
@AllArgsConstructor
@ToString
public class MemberResponseDTO {

  private Long id;
  private String email;
  private String password;
  private String nickname;
  private List<Role> roles = new ArrayList<>();
  private String createdAt;
  private String modifiedAt;
  private AttachFile attachFile;

  public void setRoles(Role role) {
    this.roles.add(role);
  }
}
