package org.threefour.homelearn.review.service;

import org.threefour.homelearn.review.domain.Review;

import java.util.List;

public interface ReviewService {
  void writeReview(Review review);

  List<Review> getList(long course_id);

}
