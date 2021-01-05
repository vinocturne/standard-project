package org.standard.project.review;

import java.util.ArrayList;
import java.util.List;

public interface ReviewService {
	List<ReviewVO> getReviewListForSeller(ReviewVO vo);
	ArrayList<ReviewVO> listProductReview(String pp_Id);
}
