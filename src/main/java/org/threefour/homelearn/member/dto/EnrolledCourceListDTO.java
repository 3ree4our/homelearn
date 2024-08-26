package org.threefour.homelearn.member.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class EnrolledCourceListDTO {
  private long courseId;
  private long memberId;
  private String courseName;
  private String courseFfname;
  private String courseFname;
  private String courseOfname;
  private String enrollIsStarted;
}
