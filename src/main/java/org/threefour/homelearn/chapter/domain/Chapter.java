package org.threefour.homelearn.chapter.domain;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Chapter {

	private long id;
	private long course_id;
	private String url;
	private String name;
	private String chapter_name;
	private String running_time;
	private int length;
	private LocalDateTime created_at;
	private LocalDateTime Modified_at;

}
