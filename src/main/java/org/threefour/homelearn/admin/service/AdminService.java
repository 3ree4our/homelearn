package org.threefour.homelearn.admin.service;

import org.threefour.homelearn.admin.domain.*;

import java.util.List;

public interface AdminService {
  List<MemberAdmin> memberList();
  List<MemberAdmin> memberListByRole(String role);
  List<CoursesAdmin> courseList();
  List<CourseMemberAdmin> courseMemberList(long courseId);
  boolean updateMember(MemberAdmin member);
  boolean deleteCourse(long courseId);
  void refundMember(long memberId, long courseId);

  /* Dash-Board */
  int todaySubscriber();
  int totalSubscriber();
  List<CntWeekAdmin> subscripbersPerWeek();
  List<RateSubjectAdmin> rateSubjectList();
  List<RankingSubjectAdmin> rankingSubjectList();
  List<NumberOfCoursesBySubject> numberOfCoursesBySubject();
}