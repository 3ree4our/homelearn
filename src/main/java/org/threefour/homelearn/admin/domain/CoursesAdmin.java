package org.threefour.homelearn.admin.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CoursesAdmin {
  private long id;
  private long teacherId;
  private String courseName;
  private BigDecimal price;
  private long period;
  private Date createdAt;
  private Date modifiedAt;
  private String teacherName;
}