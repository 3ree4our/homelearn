package org.threefour.homelearn.review.mapper;

import java.util.List;
import org.threefour.homelearn.review.domain.Review;

public interface ReviewMapper {

   void writeReview(Review review);
   List<Review> getList(long course_id);
}
