package org.threefour.homelearn.course.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import org.threefour.homelearn.course.domain.Course;
import org.threefour.homelearn.course.domain.CourseVO;
import org.threefour.homelearn.course.domain.Pager;
import org.threefour.homelearn.course.fileset.Path;
import org.threefour.homelearn.course.mapper.CourseMapper;

@Service
public class CourseServiceImpl implements CourseService {

	@Autowired
	private CourseMapper courseMapper;
	
	@Override
	public long courseWrite(CourseVO courseVo) {
		long result = courseMapper.courseWrite(courseVo);

		return result;
	}

	@Override
	public List<Course> list(Pager pager) {
		return courseMapper.list(pager);
	}

	@Override
	public int total() {
		return courseMapper.total();
	}

	@Override
	public int totalPage(int pageNum) {
		int total = courseMapper.total();
		int totalPage =  (total / pageNum) +1;
		
		return totalPage;
	}

	@Override
	public Pager startPage(int pageNum, int pageSize) {
		int total = courseMapper.total();
		int totalPage =  (total / pageSize) +1;
		int startPage=(pageNum -1) * pageSize;  
		int endPage= (((pageNum-1)/pageSize)+1)*pageSize;
		if(endPage > totalPage) {
			endPage =totalPage;
		}
 		Pager p = new Pager();
 		p.setStartPage(startPage);
 		System.out.println("�������� startPage: "+ startPage);
 		p.setEndPage(endPage);
 		System.out.println("�������� endPage: "+ endPage);
		return p;
	}

	@Override
	public void writeFile(MultipartFile file, String saveFileName) {
		File dir = new File(Path.FILE_STORE);
		if(!dir.exists()) dir.mkdir();
		FileOutputStream fos = null;
		try {
			byte[]data = file.getBytes();
			fos = new FileOutputStream(Path.FILE_STORE+saveFileName);
			fos.write(data);
			fos.flush();
		}catch(IOException ie) {
		}
		finally {
			try {
				fos.close();
			}catch(Exception e) {}
		}		
	}

	@Override
	public String saveAtStore(MultipartFile file) {
		String ofname = file.getOriginalFilename();
		int idx = ofname.indexOf(".");
		String header = ofname.substring(0, idx);
		String ext = ofname.substring(idx);
		long ms = System.currentTimeMillis();
		
		StringBuilder sb= new StringBuilder();
		sb.append(header);
		sb.append("_");
		sb.append(ms);
		sb.append(ext);
		String savedFileName = sb.toString();
		System.out.println("saved: " + savedFileName);
		writeFile(file,savedFileName);
		
		return Path.FILE_STORE+ savedFileName;
	}

	@Override
	public List<Course> searchList(String name) {
		
		return courseMapper.searchList(name);
	}

	@Override
	public List<Course> subjectList(String subject) {
		List<Course> list = null;
		System.out.println("subject:: " + subject);
		if(subject.equals("korean")) {
			list = courseMapper.subjectList(1);
		}else if(subject.equals("english")) {
			list= courseMapper.subjectList(2);
		}else {
			list= courseMapper.subjectList(3);
		}
		return list;
	}

	@Override
	public int deleteCourse(long id) {
		return courseMapper.deleteCourse(id);
	}

	@Override
	public Course courseDetail(long id) {
		return courseMapper.courseDetail(id);
	}

	@Override
	public long courseLastId() {
		return courseMapper.courseLastId();
	}

	@Override
	public String getSubjectName(long subject_id) {
		return courseMapper.getSubjectName(subject_id);
	}

	@Override
	public List<Course> getList() {
		return courseMapper.getList();
	}


}
