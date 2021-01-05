package org.standard.project.review;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("ReviewService")
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDAO reviewDAO;
	@Override
	public List<ReviewVO> getReviewListForSeller(int brandId) {
		return reviewDAO.getReviewListForSeller(brandId);
	}
	
	@Override
	public ArrayList<ReviewVO> listProductReview(String pp_Id) {
		return reviewDAO.listProductReview(pp_Id);
	}

}
