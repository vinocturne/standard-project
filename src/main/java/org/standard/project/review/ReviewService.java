package org.standard.project.review;

import java.util.ArrayList;
import java.util.List;

import org.standard.project.order.OrderHistoryVO;
import org.standard.project.product.ProductParentVO;

public interface ReviewService {
	List<ReviewVO> getReviewListForSeller(int brandId);
	ArrayList<ReviewVO> listProductReview(String pp_Id);
	void writeReview(ReviewVO vo);
	OrderHistoryVO cusOrder(OrderHistoryVO vo);
}
