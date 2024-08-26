package org.threefour.homelearn.course.mapper;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.threefour.homelearn.course.domain.Course;
import org.threefour.homelearn.course.domain.CourseVO;
import org.threefour.homelearn.course.domain.Pager;

public interface CourseMapper {

	public long courseWrite(CourseVO courseVo);
	
	public List<Course> list(Pager pager);
	public int total();
	public List<Course> searchList(String name);
	public List<Course> subjectList(int subject);
	public int deleteCourse(long id);
	public Course courseDetail(long id);
	public long courseLastId();
	public String getSubjectName(long subject_id);
	public List<Course> getList();
}
