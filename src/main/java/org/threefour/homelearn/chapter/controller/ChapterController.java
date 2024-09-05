package org.threefour.homelearn.chapter.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.threefour.homelearn.chapter.domain.Chapter;
import org.threefour.homelearn.chapter.service.ChapterService;
import org.threefour.homelearn.course.domain.Course;
import org.threefour.homelearn.course.domain.Pager;
import org.threefour.homelearn.course.service.CourseService;

@Controller
public class ChapterController {

	@Autowired
	private ChapterService chapterService;
	@Autowired
	private CourseService courseService;
	
	@GetMapping("/chapterForm.do")
	public ModelAndView courseForm(String courseId) {
		ModelAndView view = new ModelAndView();
		long id =0L;
		if(courseId != null || courseId != "") {
			id = Long.parseLong(courseId);
		}
		Course course = courseService.courseDetail(id);
		view.addObject("course", course);
		view.setViewName("chapter");
		
		return view;
	}
	
	@PostMapping("/chapterWrite.do")
	public String courseSearch(Chapter chapter, String course_id) {
		long courseid =0L;

		if(course_id !=null || course_id != "") {
			courseid = Long.parseLong(course_id);
		}
		System.out.println("asdsadsadad챕터네임 "+ chapter.getChapter_name());




		String chapterUrl = chapter.getUrl();
		String chapterName = chapter.getChapter_name();
		String runningTime = chapter.getRunning_time();
		String name = chapter.getName();

		String[] names = name.split(",");
		String[] urls = chapterUrl.split(",");
		String[] chapterNames = chapterName.split(",");
		String[] runningTimes = runningTime.split(",");

		for(int i=0;i<names.length;i++) {
			chapter.setName(names[i]);
			chapter.setChapter_name(chapterNames[i]);
			chapter.setRunning_time(runningTimes[i]);;
			chapter.setUrl(urls[i]);
			chapterService.insert(chapter);
		}

		for(int i=0;i<urls.length;i++) {
			chapter.setChapter_name(chapterNames[i]);
			chapter.setRunning_time(runningTimes[i]);;
			chapter.setUrl(urls[i]);
			chapterService.insert(chapter);
		}
		for(int i=0;i<chapterNames.length;i++) {
			System.out.println("chapterNames["+i+"]"+ chapterNames[i]);
			chapter.setRunning_time(runningTimes[i]);
			chapter.setChapter_name(chapterNames[i]);
			chapterService.insert(chapter);
		}
		for(int i=0;i<runningTimes.length;i++) {
			chapter.setRunning_time(runningTimes[i]);
			chapterService.insert(chapter);
		}
		int length = names.length;
		chapter.setLength(length);

		return "redirect:coursesList.do?pageNum=1&pageSize=3&blockSize=3";
	}

}
