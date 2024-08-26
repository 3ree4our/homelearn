package org.threefour.homelearn.member.service;

import org.springframework.web.multipart.MultipartFile;
import org.threefour.homelearn.member.dto.EnrolledCourceListDTO;
import org.threefour.homelearn.member.dto.MemberRequestDTO;
import org.threefour.homelearn.member.dto.PaymentsResponseListDTO;

import java.util.List;

public interface MemberService {
  int addMember(MemberRequestDTO dto, MultipartFile multipartFile);

  int updateMemberByMemberid(MemberRequestDTO dto, MultipartFile multipartFile);

  int deleteMemberByMemberId(Long memberId);

  // courses랑 합치기
  List<EnrolledCourceListDTO> findCoursesWithPagin(Long memberId, int startPage);

  List<PaymentsResponseListDTO> findPamentsWithPaging(Long memberId, int cp);

  // courses랑 합치기
  int coursesCountByMemberId(Long memberId);

  int paymentsCountByMemberId(Long memberId);
}
