package org.threefour.homelearn.course.domain;

import java.sql.Date;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Course {

	private long id;
	private long subject_id;
	private long teacher_id;
	private long image_id;
	private String name;
	private String description;
	private int price;
	private int period;
	private String ffname;
	private String fname;
	private String ofname;
	private String fsize;
	private Date createdAt;
	private Date modifiedAt;
}
