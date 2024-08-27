package org.threefour.homelearn.review.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Review {

  private long id ;
  private long course_id;
  private long student_id;
  private String content;
  private int score;
  private String member_nickName;
  private LocalDateTime created_at;
  private LocalDateTime modified_at;
}
