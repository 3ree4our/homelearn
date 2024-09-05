package org.threefour.homelearn.member.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.threefour.homelearn.course.domain.Course;
import org.threefour.homelearn.enrollment.domain.EnrolledCourse;
import org.threefour.homelearn.file.FileUtil;
import org.threefour.homelearn.file.dto.AttachFile;
import org.threefour.homelearn.file.mapper.FileMapper;
import org.threefour.homelearn.member.dto.*;
import org.threefour.homelearn.member.mapper.MemberMapper;
import org.threefour.homelearn.member.mapper.MemberRoleMapper;
import org.threefour.homelearn.member.mapper.RoleMapper;

import java.io.File;
import java.util.Collections;
import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
@Slf4j
public class MemberServiceImpl implements MemberService {

  private final MemberMapper memberMapper;
  private final RoleMapper roleMapper;
  private final MemberRoleMapper memberRoleMapper;
  private final PasswordEncoder passwordEncoder;
  private final FileMapper fileMapper;
  private final FileUtil fileUtil = new FileUtil();


  @Override
  public int addMember(MemberRequestDTO dto, MultipartFile multipartFile) {

    // Member 추가
    dto.setPassword(passwordEncoder.encode(dto.getPassword()));
    memberMapper.insertMember(dto);

    // MemberRole 추가
    MemberRole memberRole = new MemberRole();

    // Role 추가
    Role role = new Role();
    if (dto.getRole().startsWith("TEACHER")) {
      role = new Role();
      role.setRole("ROLE_TEACHER");
      roleMapper.insertRole(role);

      memberRole.setMemberId(dto.getId());
      memberRole.setRoleId(role.getId());
      memberRoleMapper.insertMemberRole(memberRole);
    }

    role.setRole("ROLE_MEMBER");
    roleMapper.insertRole(role);

    memberRole.setMemberId(dto.getId());
    memberRole.setRoleId(role.getId());
    int result = memberRoleMapper.insertMemberRole(memberRole);

    if (result > 0) {
      AttachFile attachFiles = fileUtil.fileSave(multipartFile, dto.getId());
      if (attachFiles != null)
        fileMapper.insertFile(attachFiles);
    }

    return result;
  }

  @Override
  public int updateMemberByMemberid(MemberRequestDTO dto, MultipartFile multipartFile) {

    String password = dto.getPassword();
    if (password != null)
      dto.setPassword(passwordEncoder.encode(dto.getPassword()));

    int result = memberMapper.updateMemberByMemberId(dto);

    AttachFile attachFile = fileMapper.getProfileImageByMemberId(dto.getId());

    // 업데이트시 기본 -> 이미지변경
    if (attachFile == null) {
      AttachFile updateAttachFile = fileUtil.fileSave(multipartFile, dto.getId());
      if (updateAttachFile != null)
        fileMapper.insertFile(updateAttachFile);
      return 0;
    }

    // 수정
    File f = new File(attachFile.getFilePath() + File.separator + attachFile.getSaveName());
    if (f.exists()) {
      AttachFile updateAttachFile = fileUtil.fileSave(multipartFile, dto.getId());
      if (updateAttachFile != null) {
        fileMapper.insertFile(updateAttachFile);
        fileMapper.deleteFile(attachFile.getSaveName());
        f.delete();
      }
    }
    return result;
  }

  @Override
  public int deleteMemberByMemberId(Long memberId) {
    return memberMapper.deleteMemberByMemberId(memberId);
  }

  @Override
  public List<EnrolledCourceListDTO> findCoursesWithPagin(Long memberId, int cp) {
    // * 1 여기 수정 필수
    int startNum = (cp - 1) * 1;
    List<EnrolledCourceListDTO> list = memberMapper.selectCoursesWithPaging(memberId, startNum);

    return list;
  }


  @Override
  public List<PaymentsResponseListDTO> findPamentsWithPaging(Long memberId, int cp) {
    int startNum = (cp - 1) * 1;
    List<PaymentsResponseListDTO> list = memberMapper.selectPaymentsWithPaging(memberId, startNum);
    return list;
  }


  @Override
  public int coursesCountByMemberId(Long memberId) {
    int count = memberMapper.coursesCountByMemberId(memberId);
    return count;
  }

  @Override
  public int paymentsCountByMemberId(Long memberId) {
    int count = memberMapper.paymentsCountByMemberId(memberId);
    return count;
  }

  @Override
  public EnrolledCourse getEnrolledCourseByMemberIdAndCourseId(Long memberId, Long courseId) {
    EnrolledCourse enrolledCourse = memberMapper.selectEnrolledCourseByMemberIdAndCourseId(memberId, courseId);
    return enrolledCourse;
  }

  @Override
  public int registerTeacherByMemberId(Long memberId) {
    return memberMapper.updateMemberRoleByMemberId(memberId);
  }

  @Override
  public List<Course> findCoursesByTeacherId(Long memberId) {
    return memberMapper.selectCoursesByTeacherId(memberId);
  }
}
