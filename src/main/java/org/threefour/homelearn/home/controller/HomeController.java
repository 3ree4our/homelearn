package org.threefour.homelearn.home.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.threefour.homelearn.course.domain.Course;
import org.threefour.homelearn.course.domain.Pager;
import org.threefour.homelearn.course.service.CourseService;
import org.threefour.homelearn.home.domain.HomeSearchVO;
import org.threefour.homelearn.home.service.HomeService;

@Controller
@RequestMapping("/")
public class HomeController {

  @Autowired
  private HomeService homeService;
  @Autowired
  private CourseService courseService;

  @GetMapping
  public ModelAndView home01() {
    ModelAndView view = new ModelAndView();
    List<Course> course = courseService.getList();
    view.addObject("course", course);
    view.setViewName("/jsp/home-01");

    return view;
  }
  @PostMapping("homeSearch")
  public String homeSearch(HomeSearchVO homeSearchVO) {

    System.out.println("keyword search: " +homeSearchVO.getKeyword() + " " + homeSearchVO.getSearch()  +" ");
    ModelAndView view = new ModelAndView();
    List<Course> searchCourse= homeService.getCourseBySearch(homeSearchVO);
    for(Course course : searchCourse) {
      System.out.println("corese 받은리스트: " + course.getName());
      System.out.println("corese 받은리스트: "+ course.getId());
    }
//    List<Course> list = courseService.searchList(name);
//    view.setViewName("courses");
//    Pager pager = new Pager();
//    int pageNum2 = Integer.parseInt(pageNum);
//    int pageSize2 = Integer.parseInt(pageSize);
//    pager.setPageNum(pageNum2);
//    pager.setPageSize(pageSize2);
//    pager.setList(list);
//    view.addObject("pager", pager);
//    return view;

    return "/jsp/home-01";
  }
  @PostMapping("autocomplete")
  public @ResponseBody List<String> autocomplete(HomeSearchVO homeSearchVO) {
    System.out.println("isisisisautocompletei autocomplete: " +homeSearchVO.getKeyword() + " " + homeSearchVO.getSearch());
    List<String> searchResult = homeService.getCourseNameBySearch(homeSearchVO);
    return searchResult;
    }



  @GetMapping("/home-02")
  public String home02() {
    return "/jsp/home-02";
  }

  @GetMapping("/home-03")
  public String home03() {
    return "/jsp/home-03";
  }

}