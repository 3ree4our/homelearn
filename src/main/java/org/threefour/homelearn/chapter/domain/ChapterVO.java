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
public class ChapterVO {
	private long courseId;
	private String url;
	private String name;
	private String chapterName;
	private String runningTime;
	private int length;
}
