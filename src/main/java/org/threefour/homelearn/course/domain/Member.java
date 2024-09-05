package org.threefour.homelearn.course.domain;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Member {

	private long id;
	private String email;
	private String password;
	private String nickName;
	private LocalDateTime createdAt;
	private LocalDateTime modifiedAt;
	
}
