package org.standard.project.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("ReviewService")
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDAO reviewDAO;
	@Override
	public List<ReviewVO> getReviewListForSeller(ReviewVO vo) {
		return reviewDAO.getReviewListForSeller(vo);
	}

}
