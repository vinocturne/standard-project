package org.standard.project.review;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.standard.project.order.OrderHistoryVO;
import org.standard.project.product.ProductParentVO;

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
	@Override
	public void writeReview(ReviewVO vo) {
		reviewDAO.writeReview(vo);
	}
	@Override
	public ReviewVO selectOneReview(String r_Seq) {
		return reviewDAO.selectOneReview(r_Seq);
	}

	@Override
	public void modifyReviewReply(ReviewVO vo) {
		reviewDAO.modifyReviewReply(vo);
		
	}
	
	@Override
	public void DelReviewReply(String r_Seq) {
		reviewDAO.DelReviewReply(r_Seq);
		
	}

}
