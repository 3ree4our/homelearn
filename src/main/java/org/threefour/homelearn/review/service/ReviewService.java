package org.threefour.homelearn.review.service;

import java.util.List;
import org.threefour.homelearn.review.domain.Review;

public interface ReviewService {
   void writeReview(Review review);
  List<Review> getList(long course_id);

}
