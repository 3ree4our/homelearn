package org.threefour.homelearn.review.mapper;

import org.threefour.homelearn.review.domain.Review;

import java.util.List;

public interface ReviewMapper {

  void writeReview(Review review);

  List<Review> getList(long course_id);
}
