package org.threefour.homelearn.admin.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class NumberOfCoursesBySubject {
  private String name;
  private int cnt;
}
