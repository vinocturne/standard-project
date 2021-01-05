package org.standard.project.review;

import java.util.ArrayList;
import java.util.List;

public interface ReviewService {
	List<ReviewVO> getReviewListForSeller(int brandId);
	ArrayList<ReviewVO> listProductReview(String pp_Id);
}
