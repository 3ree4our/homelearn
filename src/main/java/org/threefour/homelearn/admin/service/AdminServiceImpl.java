package org.threefour.homelearn.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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
  @Transactional
  public boolean deleteCourse(long courseId) {
    List<CourseMemberAdmin> members = adminMapper.courseMemberList(courseId);
    for (CourseMemberAdmin member : members) {
      if ("수강전".equals(member.getStarted()) && member.getRefunded() == 0) {
        return false;
      }
    }
    return adminMapper.deleteCourse(courseId) > 0;
  }

  @Override
  @Transactional
  public boolean refundMember(long memberId, long courseId) {
    CourseMemberAdmin member = adminMapper.getCourseMember(memberId, courseId);
    if (member != null && "수강전".equals(member.getStarted())) {
      return adminMapper.refundMember(memberId, courseId) > 0;
    }
    return false;
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
}