package org.threefour.homelearn.member.service;

import lombok.RequiredArgsConstructor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.threefour.homelearn.member.dto.MemberRequestDTO;
import org.threefour.homelearn.member.dto.MemberResponseDTO;
import org.threefour.homelearn.member.mapper.MemberMapper;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class EmailService {

  private final JavaMailSender mailSender;
  private final MemberMapper memberMapper;
  private final PasswordEncoder passwordEncoder;
  private static int authenticationNumber;

  public static void createNumber() {
    authenticationNumber = (int) (Math.random() * 90000) + 100000;
  }

  public MimeMessage createEmail(String email) {
    createNumber();
    MimeMessage message = mailSender.createMimeMessage();

    try {
      InternetAddress senderEmail = new InternetAddress("leesuwan89@gmail.com");
      StringBuilder sb = new StringBuilder();
      message.setFrom(senderEmail);
      message.setRecipients(MimeMessage.RecipientType.TO, email);
      message.setSubject("이메일 인증");

      sb.append("<!DOCTYPE html>");
      sb.append("<html lang=\"en\">");
      sb.append("<head>");
      sb.append("    <meta charset=\"UTF-8\">");
      sb.append("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
      sb.append("    <title>회원가입 인증 이메일</title>");
      sb.append("</head>");
      sb.append("<body style=\"font-family: 'Poppins', Arial, sans-serif;\">");
      sb.append("    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">");
      sb.append("        <tr>");
      sb.append("            <td align=\"center\" style=\"padding: 20px;\">");
      sb.append("                <table class=\"content\" width=\"600\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse: collapse; border: 1px solid #cccccc;\">");
      sb.append("                    <!-- Header -->");
      sb.append("                    <tr>");
      sb.append("                        <td class=\"header\" style=\"background-color: #345C72; padding: 40px; text-align: center; color: white; font-size: 24px;\">");
      sb.append("                            회원가입 인증 이메일");
      sb.append("                        </td>");
      sb.append("                    </tr>");
      sb.append("                    <!-- Body -->");
      sb.append("                    <tr>");
      sb.append("                        <td class=\"body\" style=\"padding: 40px; text-align: left; font-size: 16px; line-height: 1.6;\">");
      sb.append("                            안녕하세요!<br>");
      sb.append("                            회원가입을 계속하시려면 아래 버튼을 클릭해주세요.");
      sb.append("                        </td>");
      sb.append("                    </tr>");
      sb.append("                    <!-- Call to action Button -->");
      sb.append("                    <tr>");
      sb.append("                        <td style=\"padding: 0px 40px 0px 40px; text-align: center;\">");
      sb.append("                            <!-- CTA Button -->");
      sb.append("                            <table cellspacing=\"0\" cellpadding=\"0\" style=\"margin: auto;\">");
      sb.append("                                <tr>");
      sb.append("                                    <td align=\"center\" style=\"background-color: #345C72; padding: 10px 20px; border-radius: 5px;\">");
      sb.append("                                        <a href=\"http://localhost:8080/members/signup?code=" + authenticationNumber + "&email=" + email + "\" style=\"color: #ffffff; text-decoration: none; font-weight: bold;\">계속하기</a>");
      sb.append("                                    </td>");
      sb.append("                                </tr>");
      sb.append("                            </table>");
      sb.append("                        </td>");
      sb.append("                    </tr>");
      sb.append("                </table>");
      sb.append("            </td>");
      sb.append("        </tr>");
      sb.append("    </table>");
      sb.append("</body>");
      sb.append("</html>");


      message.setText(sb.toString(), "UTF-8", "html");
    } catch (MessagingException e) {
      e.printStackTrace();
    }

    return message;
  }


  public MimeMessage resetPassword(String email) {
    MimeMessage message = mailSender.createMimeMessage();
    String uuid = UUID.randomUUID().toString().substring(0, 12);

    MemberResponseDTO member = memberMapper.findByUsername(email);

    MemberRequestDTO dto = MemberRequestDTO.builder()
            .id(member.getId())
            .email(email)
            .password(passwordEncoder.encode(uuid))
            .nickname(member.getNickname())
            .build();

    memberMapper.updateMemberByMemberId(dto);

    try {
      InternetAddress senderEmail = new InternetAddress("leesuwan89@gmail.com");
      StringBuilder sb = new StringBuilder();
      message.setFrom(senderEmail);
      message.setRecipients(MimeMessage.RecipientType.TO, email);
      message.setSubject("비밀번호 재설정");

      sb.append("<!DOCTYPE html>");
      sb.append("<html lang=\"en\">");
      sb.append("<head>");
      sb.append("    <meta charset=\"UTF-8\">");
      sb.append("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
      sb.append("    <title>비밀번호 재설정</title>");
      sb.append("</head>");
      sb.append("<body style=\"font-family: 'Poppins', Arial, sans-serif;\">");
      sb.append("    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">");
      sb.append("        <tr>");
      sb.append("            <td align=\"center\" style=\"padding: 20px;\">");
      sb.append("                <table class=\"content\" width=\"600\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse: collapse; border: 1px solid #cccccc;\">");
      sb.append("                    <!-- Header -->");
      sb.append("                    <tr>");
      sb.append("                        <td class=\"header\" style=\"background-color: #345C72; padding: 40px; text-align: center; color: white; font-size: 24px;\">");
      sb.append("                            비밀번호 재설정 이메일");
      sb.append("                        </td>");
      sb.append("                    </tr>");
      sb.append("                    <!-- Body -->");
      sb.append("                    <tr>");
      sb.append("                        <td class=\"body\" style=\"padding: 40px; text-align: left; font-size: 16px; line-height: 1.6;\">");
      sb.append("                            안녕하세요!<br>");
      sb.append("                            " + uuid + "로 재설정 되었습니다. 다시 로그인 해주세요.");
      sb.append("                        </td>");
      sb.append("                    </tr>");
      sb.append("                    <!-- Call to action Button -->");
      sb.append("                </table>");
      sb.append("            </td>");
      sb.append("        </tr>");
      sb.append("    </table>");
      sb.append("</body>");
      sb.append("</html>");


      message.setText(sb.toString(), "UTF-8", "html");
    } catch (MessagingException e) {
      e.printStackTrace();
    }

    return message;
  }


  public void sendEmail(String email) {
    MimeMessage message = createEmail(email);
    mailSender.send(message);
  }

  public void sendNewPassword(String email) {
    MimeMessage message = resetPassword(email);
    mailSender.send(message);
  }

}
