package org.threefour.homelearn.admin.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class RankingSubjectAdmin {
  private int cnt;
  private String courseName;
  private String teacherName;
}
