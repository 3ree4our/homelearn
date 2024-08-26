package org.threefour.homelearn.course.domain;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class CourseVO {
  private long id;
  private long subjectId;
  private long teacherId;
  private String name;
  private String description;
  private int period;
  private int price;
  private String ffname;
  private String fname;
  private String ofname;
  private long fsize;

}
