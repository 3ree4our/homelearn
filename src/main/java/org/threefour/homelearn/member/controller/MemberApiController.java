package org.threefour.homelearn.member.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.threefour.homelearn.member.dto.EnrolledCourceListDTO;
import org.threefour.homelearn.member.dto.PaymentsResponseListDTO;
import org.threefour.homelearn.member.service.MemberService;
import org.threefour.homelearn.paging.Paging;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class MemberApiController {

  private final MemberService memberService;

  @GetMapping("/courses/{memberid}/{cp}/v1")
  public ResponseEntity<Paging> getCoursesWithPaging(@PathVariable("memberid") Long memberId, @PathVariable("cp") int cp) {
    List<EnrolledCourceListDTO> list = memberService.findCoursesWithPagin(memberId, cp);
    int count = memberService.coursesCountByMemberId(memberId);
    Paging paging = new Paging(count, cp, list);

    return ResponseEntity.ok(paging);
  }

  @GetMapping("/payments/{memberid}/{cp}/v1")
  public ResponseEntity<Paging> getPamentswithPaging(@PathVariable("memberid") Long memberId, @PathVariable("cp") int cp) {
    List<PaymentsResponseListDTO> list = memberService.findPamentsWithPaging(memberId, cp);
    int count = memberService.paymentsCountByMemberId(memberId);
    Paging paging = new Paging(count, cp, list);

    return ResponseEntity.ok(paging);
  }

}
