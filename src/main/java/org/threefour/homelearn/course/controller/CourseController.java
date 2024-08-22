package org.threefour.homelearn.course.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.threefour.homelearn.chapter.domain.Chapter;
import org.threefour.homelearn.chapter.service.ChapterService;
import org.threefour.homelearn.course.domain.Course;
import org.threefour.homelearn.course.domain.CourseVO;
import org.threefour.homelearn.course.domain.Pager;
import org.threefour.homelearn.course.service.CourseService;

@Controller
public class CourseController {

	@Autowired
	private CourseService courseService;
	@Autowired
	private ChapterService chapterService;
	
	@GetMapping("/courseForm.do")
	public String courseForm() {
		return "courseRegister";
	}
	
	@GetMapping("/courseDetail.do")
	public ModelAndView courseDetail(String courseId) {
		ModelAndView view = new ModelAndView();

		long courseid =0L;
		if(courseId !=null || courseId != "") {
			courseid = Long.parseLong(courseId);
		}
		
		List<Chapter> chapter = chapterService.getChapter2(courseid);
		List<String> chapterNames1 = chapterService.getChapterName(courseid);
		

		List<Chapter> getChapter = new ArrayList<Chapter>();
		List<String> chapterNames2 = new ArrayList<String>();
		int chapterSize = chapter.size()/4;
		int chapterNamesSize = chapterNames1.size()/4;
		
		for(int i=0; i<chapterSize;i++) {
			getChapter.add(chapter.get(i));
			//getChapter.add(chapterService.getChapter(chapter.get(i)));
			// 추후 예정 chapterName = chapterService.getChapterName(chapter.get(i));
		}
		for(int i=0; i<chapterNamesSize;i++) {
			chapterNames2.add(chapterNames1.get(i));

		}
		Course course = null;
		if(courseId !=null || courseId != "") {
			long id = Long.parseLong(courseId);
			course = courseService.courseDetail(id);
		}


		view.setViewName("course-details");
		view.addObject("course",course);
		view.addObject("chapterName",chapterNames2);
		view.addObject("chapter",getChapter);

		return view;
	}
	
	@GetMapping("/coursesList.do")
	public ModelAndView coursesList(Pager pager) {
		ModelAndView view = new ModelAndView();
			
		 if(pager.getPageNum() == 0) {
				
			
			int total = courseService.total();
			int totalPage = courseService.totalPage(3);
			Pager p = courseService.startPage(1,3);
			

			pager.setStartPage(p.getStartPage());
	 		pager.setEndPage(p.getEndPage());
			pager.setBlockSize(3);
			pager.setPageNum(1);
			pager.setTotalBoard(total);
			pager.setTotalPage(totalPage);
			pager.setPageSize(3);
			List<Course> list = courseService.list(pager);
			for(Course course: list) {
				int of = course.getFname().lastIndexOf("/") +1;
				String sub = course.getFname().substring(of,course.getFname().length());
				System.out.println("sub::  "+ sub );
				course.setFfname(sub);
			}
			pager.setList(list);

			view.setViewName("courses");
			view.addObject("pager",pager);
			return view;
		}
			else {
				int total = courseService.total();
				int totalPage = courseService.totalPage(pager.getPageSize());
				Pager p = courseService.startPage(pager.getPageNum(), pager.getPageSize());
				p.setPageSize(pager.getPageSize());
				List<Course> list = courseService.list(p);
				for(Course course: list) {
					int of = course.getFname().lastIndexOf("/") +1;
					String sub = course.getFname().substring(of,course.getFname().length());
					System.out.println("sub::  "+ sub );
					course.setFfname(sub);
				}

				pager.setList(list);
				view.setViewName("courses");
				view.addObject("pager",pager);

				return view;
		}
	}
	
	@PostMapping("/courseWrite.do")
	public String courseWrite(CourseVO courseVO, MultipartFile file,String cate) {
		String ofname =file.getOriginalFilename();
		long fsize = file.getSize();
		String fname = courseService.saveAtStore(file);
		if(cate.equals("korean")) {
			courseVO.setSubjectId(1);
		}else if(cate.equals("english")) {
			courseVO.setSubjectId(2);
		}else {
			courseVO.setSubjectId(3);
		}
		int of = fname.lastIndexOf("/") +1;
		String sub = fname.substring(of,fname.length());
		courseVO.setFfname(sub);
		courseVO.setFsize(fsize);
		courseVO.setFname(fname);
		courseVO.setOfname(ofname);
		courseService.courseWrite(courseVO);	
		long id = courseService.courseLastId();
		return "redirect:chapterForm.do?courseId="+id;
	}
	
	@PostMapping("/courseSearch.do")
	public ModelAndView courseSearch(String name ,String pageNum,String pageSize ) {
		
		ModelAndView view = new ModelAndView();
	
		List<Course> list = courseService.searchList(name);
		view.setViewName("courses");
		Pager pager  = new Pager();
		int pageNum2 = Integer.parseInt(pageNum);
		int pageSize2 = Integer.parseInt(pageSize);
		pager.setPageNum(pageNum2);
		pager.setPageSize(pageSize2);
		pager.setList(list);
		view.addObject("pager",pager);
		return view;
	}
	
	@GetMapping("/searchCate.do")
	public ModelAndView searchCate(String cate) {
		ModelAndView view = new ModelAndView();

		int total = courseService.total();
		int totalPage = courseService.totalPage(3);
		Pager pager = courseService.startPage(1,3);
		List<Course> list = courseService.subjectList(cate);
		pager.setStartPage(pager.getStartPage());
 		pager.setEndPage(pager.getEndPage());
		pager.setBlockSize(3);
		pager.setPageNum(1);
		pager.setTotalBoard(total);
		pager.setTotalPage(totalPage);
		pager.setPageSize(3);
		pager.setList(list);
		view.setViewName("courses");
		view.addObject("pager",pager);

		return view;
	}
}
