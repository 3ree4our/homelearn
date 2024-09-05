package org.threefour.homelearn.course.domain;

import java.time.LocalDateTime;

import org.springframework.cglib.core.Local;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Subject {
	private long id;
	private String name;
	private LocalDateTime createAt;
	private LocalDateTime modifiedAt;
}
