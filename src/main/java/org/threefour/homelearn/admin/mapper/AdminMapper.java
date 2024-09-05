package org.threefour.homelearn.admin.mapper;

import org.threefour.homelearn.admin.domain.*;

import java.util.List;

public interface AdminMapper {
  List<MemberAdmin> memberList();
  List<MemberAdmin> memberListByRole(String role);
  List<CoursesAdmin> courseList();
  List<CourseMemberAdmin> courseMemberList(long courseId);
  void updateMember(MemberAdmin member);
  int deleteCourse(long courseId);
  void refundMember(long memberId, long courseId);
  CourseMemberAdmin getCourseMember(long courseId, long memberId);

  /* Dash-Board */
  int todaySubscriber();
  int totalSubscriber();
  List<CntWeekAdmin> subscripbersPerWeek();
  List<RateSubjectAdmin> rateSubjectList();
  List<RankingSubjectAdmin> rankingSubjectList();
  List<NumberOfCoursesBySubject> numberOfCoursesBySubject();
}