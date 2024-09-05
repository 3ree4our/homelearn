package org.threefour.homelearn.member.dto;

import lombok.*;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MemberRequestDTO {
  private Long id;

  @NotBlank(message = "이메일은 필수 입력 값입니다.")
  @Pattern(regexp = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$", message = "이메일 형식이 올바르지 않습니다.")
  private String email;

  @NotBlank
  @Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$", message = "8글자 이상, 영문, 숫자, 특수문자(@$!%*#?&) 사용해주세요")
  private String password;

  @NotBlank(message = "닉네임을 입력해주세요.")
  @Pattern(regexp = "^[ㄱ-ㅎ가-힣a-z0-9-_]{2,10}$", message = "닉네임은 특수문자를 제외한 2~10자리여야 합니다.")
  private String nickname;

  private String role;

}
