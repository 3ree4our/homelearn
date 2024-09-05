package org.threefour.homelearn.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.threefour.homelearn.admin.domain.*;
import org.threefour.homelearn.admin.mapper.AdminMapper;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
  private AdminMapper adminMapper;

  @Autowired
  AdminServiceImpl(AdminMapper adminMapper){
    this.adminMapper = adminMapper;
  }

  @Override
  public List<MemberAdmin> memberList(){
    return adminMapper.memberList();
  }

  @Override
  public List<MemberAdmin> memberListByRole(String role){
    return adminMapper.memberListByRole(role);
  }

  @Override
  public List<CoursesAdmin> courseList(){ return adminMapper.courseList(); }

  @Override
  public List<CourseMemberAdmin> courseMemberList(long courseId){ return adminMapper.courseMemberList(courseId); }

  @Override
  public boolean updateMember(MemberAdmin member) { try {
    adminMapper.updateMember(member);
    return true;
  } catch (Exception e) {
    e.printStackTrace();
    return false;
  } }

  @Override
  public boolean deleteCourse(long courseId) {
    return adminMapper.deleteCourse(courseId) > 0;
  }

  @Override
  public void refundMember(long memberId, long courseId) {
      adminMapper.refundMember(memberId, courseId);
  }

  /*Dash-Board*/
  @Override
  public int todaySubscriber(){ return adminMapper.todaySubscriber(); }

  @Override
  public int totalSubscriber(){ return adminMapper.totalSubscriber(); }

  @Override
  public List<CntWeekAdmin> subscripbersPerWeek(){ return adminMapper.subscripbersPerWeek(); }

  @Override
  public List<RateSubjectAdmin> rateSubjectList(){ return adminMapper.rateSubjectList(); }

  @Override
  public List<RankingSubjectAdmin> rankingSubjectList(){ return adminMapper.rankingSubjectList(); }

  @Override
  public List<NumberOfCoursesBySubject> numberOfCoursesBySubject() {
    return adminMapper.numberOfCoursesBySubject();
  }
}