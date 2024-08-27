package org.threefour.homelearn.review.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.threefour.homelearn.review.domain.Review;
import org.threefour.homelearn.review.mapper.ReviewMapper;

import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService {

  @Autowired
  private ReviewMapper reviewMapper;

  @Override
  public void writeReview(Review review) {
    reviewMapper.writeReview(review);
  }

  @Override
  public List<Review> getList(long course_id) {
    return reviewMapper.getList(course_id);
  }
}
