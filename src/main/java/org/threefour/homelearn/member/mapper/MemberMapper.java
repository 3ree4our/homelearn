package org.threefour.homelearn.member.mapper;

import org.apache.ibatis.annotations.Param;
import org.threefour.homelearn.course.domain.Course;
import org.threefour.homelearn.enrollment.domain.EnrolledCourse;
import org.threefour.homelearn.member.dto.EnrolledCourceListDTO;
import org.threefour.homelearn.member.dto.MemberRequestDTO;
import org.threefour.homelearn.member.dto.MemberResponseDTO;
import org.threefour.homelearn.member.dto.PaymentsResponseListDTO;
import org.threefour.homelearn.payment.domain.Payment;

import java.util.List;

public interface MemberMapper {
  int insertMember(MemberRequestDTO dto);

  MemberResponseDTO findByUsername(String username);

  int updateMemberByMemberId(MemberRequestDTO dto);

  // 나중에 courses랑 합치기
  List<EnrolledCourceListDTO> selectCoursesWithPaging(@Param("memberId") Long memberId, @Param("startNum") int startNum);

  // 나중에 courses랑 합치기
  int coursesCountByMemberId(Long memberId);

  int deleteMemberByMemberId(Long memberId);

  List<PaymentsResponseListDTO> selectPaymentsWithPaging(@Param("memberId") Long memberId, @Param("startNum") int startNum);

  int paymentsCountByMemberId(Long memberId);

  EnrolledCourse selectEnrolledCourseByMemberIdAndCourseId(@Param("memberId") Long memberId, @Param("courseId") Long courseId);

  List<MemberResponseDTO> selectReview(long course_id);

  int updateMemberRoleByMemberId(Long memberId);

  List<Course> selectCoursesByTeacherId(Long memberId);
}
