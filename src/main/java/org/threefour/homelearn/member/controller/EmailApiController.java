package org.threefour.homelearn.member.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.threefour.homelearn.member.service.EmailService;

@RestController
@RequiredArgsConstructor
public class EmailApiController {

  private final EmailService emailService;

  @PostMapping("/email")
  public ResponseEntity<Void> emailSend(String email) {
    emailService.sendEmail(email);

    return ResponseEntity.ok().build();
  }

  @PostMapping("/password")
  public ResponseEntity<Void> getEmail(String email) {
    System.out.println("비밀번호 찾기 email" + email);
    emailService.sendNewPassword(email);

    return ResponseEntity.ok().build();
  }
}
