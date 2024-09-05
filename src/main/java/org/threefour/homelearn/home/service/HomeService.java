package org.threefour.homelearn.home.service;

import java.util.List;
import org.threefour.homelearn.course.domain.Course;
import org.threefour.homelearn.home.domain.HomeSearchVO;

public interface HomeService {
  public List<Course> getCourseBySearch(HomeSearchVO homeSearchVO);
  public List<String> getCourseNameBySearch(HomeSearchVO homeSearchVO);

}
