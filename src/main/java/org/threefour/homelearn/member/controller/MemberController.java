package org.threefour.homelearn.member.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.threefour.homelearn.member.dto.MemberRequestDTO;
import org.threefour.homelearn.member.service.MemberService;
import org.threefour.homelearn.paging.Paging;
import org.threefour.homelearn.paging.PagingRequestDTO;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/members")
@RequiredArgsConstructor
@Slf4j
public class MemberController {

  private final MemberService memberService;

  /*@GetMapping("/signup")
  public String moveToSignup(String code, @ModelAttribute("email") String email) {
    if (code.isEmpty() || email.isEmpty()) {
      return "redirect:/members/signup";
    }
    return "jsp/signup";
  }*/
  @GetMapping("/signup")
  public String moveToSignup() {
    return "jsp/signup";
  }

  @PostMapping("/signup")
  public String signup(@Validated @ModelAttribute("memberRequestDTO") MemberRequestDTO dto, BindingResult errors, @RequestPart("profileImage") MultipartFile multipartFile) throws ServletException, IOException {
    if (errors.hasErrors()) {
      errors.getAllErrors().forEach(error -> System.out.println(error.getDefaultMessage()));
      return "jsp/signup"; // redirect 대신 뷰 이름을 반환
    }

    if (dto.getRole() == null) dto.setRole("ROLE_MEMBER");
    try {
      memberService.addMember(dto, multipartFile);
    } catch (DataIntegrityViolationException scv) {
      errors.rejectValue("email", "error.memberRequestDTO", "아이디 중복입니다.");
      return "jsp/signup";
    }

    return "redirect:/members/login";
  }

  @GetMapping("/login")
  public String moveToSignin() {
    return "jsp/login";
  }

  @GetMapping("/mypage/{nickname}")
  public String moveToMypage(@PathVariable String nickname) {
    return "jsp/mypage";
  }

  @RequestMapping(value = "/{memberid}", method = {RequestMethod.PUT, RequestMethod.PATCH, RequestMethod.POST})
  public String updateMember(@PathVariable("memberid") Long memberId, MemberRequestDTO dto, @RequestPart("profileImage") MultipartFile multipartFile) throws ServletException, IOException {
    String password = dto.getPassword().equals("undefined") ? null : dto.getPassword();
    dto.setId(memberId);
    dto.setPassword(password);

    memberService.updateMemberByMemberid(dto, multipartFile);
    return "redirect:/members/mypage/" + memberId;
  }

  @DeleteMapping("/{memberid}")
  @ResponseBody
  public ResponseEntity<Void> deleteMember(@PathVariable("memberid") Long memberId, HttpServletResponse response) {
    int result = memberService.deleteMemberByMemberId(memberId);
    if (result > 0) {
      Cookie cookie = new Cookie("refreshToken", null);
      cookie.setPath("/");
      cookie.setMaxAge(0);
      cookie.setHttpOnly(true);
      response.addCookie(cookie);
      return ResponseEntity.ok().build();
    }
    return ResponseEntity.badRequest().build();
  }

  @GetMapping("/cookies")
  public void cookies(HttpServletRequest request, HttpServletResponse response) throws IOException {
    Cookie[] cookies = request.getCookies();
    for (Cookie cookie : cookies) {
      if (cookie.getName().startsWith("access")) {
        response.setHeader("accessToken", cookie.getValue());
        cookie.setMaxAge(0);
        cookie.setPath("/");
        cookie.setHttpOnly(true);
        response.addCookie(cookie);
      }
    }
  }

}
