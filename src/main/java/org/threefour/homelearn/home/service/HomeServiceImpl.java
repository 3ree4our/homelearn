package org.threefour.homelearn.home.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.threefour.homelearn.course.domain.Course;
import org.threefour.homelearn.home.mapper.HomeMapper;
import org.threefour.homelearn.home.domain.HomeSearchVO;

@Service
public class HomeServiceImpl implements HomeService {

  @Autowired
  private HomeMapper homeMapper;

  @Override
  public List<Course> getCourseBySearch(HomeSearchVO homeSearchVO) {
    return homeMapper.getCourseBySearch(homeSearchVO);
  }

  @Override
  public List<String> getCourseNameBySearch(HomeSearchVO homeSearchVO) {
    return homeMapper.getCourseNameBySearch(homeSearchVO);
  }
}
