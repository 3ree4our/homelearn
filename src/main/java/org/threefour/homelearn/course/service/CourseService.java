package org.threefour.homelearn.course.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.threefour.homelearn.course.domain.Course;
import org.threefour.homelearn.course.domain.CourseVO;
import org.threefour.homelearn.course.domain.Pager;

public interface CourseService {
	public long courseWrite(CourseVO courseVo);

	public List<Course> list(Pager pager);
	public int total();
	public int totalPage(int pageNum);
	Pager startPage(int pageNum, int pageSize);
	public void writeFile(MultipartFile file, String saveFileName);
	public String saveAtStore(MultipartFile file);
	public List<Course> searchList(String name);
	public List<Course> subjectList(String subject);
	public int deleteCourse(long id);
	public Course courseDetail(long id);
	public long courseLastId();
	public String getSubjectName(long subject_id);
	public List<Course> getList();

}
