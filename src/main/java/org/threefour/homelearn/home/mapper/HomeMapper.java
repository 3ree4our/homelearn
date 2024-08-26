package org.threefour.homelearn.home.mapper;

import java.util.List;
import org.threefour.homelearn.course.domain.Course;
import org.threefour.homelearn.home.domain.HomeSearchVO;

public interface HomeMapper {

  public List<Course> getCourseBySearch(HomeSearchVO homeSearchVO);
  public List<String> getCourseNameBySearch(HomeSearchVO homeSearchVO);
}
