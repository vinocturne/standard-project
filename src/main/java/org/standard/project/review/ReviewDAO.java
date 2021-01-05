package org.standard.project.review;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("reviewDAO")
public class ReviewDAO {
	@Autowired 
	SqlSessionTemplate mySQL;
	private String loc = "org.standard.project.ReviewMapper.";
	
	public List<ReviewVO> getReviewListForSeller(int brandId) {
		return mySQL.selectList(loc+"reviewListForSeller", brandId);
	}
	
	public ArrayList<ReviewVO> listProductReview(String pp_Id) {
		ArrayList<ReviewVO> listProductReview = new ArrayList<ReviewVO>();
		listProductReview =(ArrayList) mySQL.selectList(loc+"listProductReview", pp_Id);
		return listProductReview;
	}
	
	public void writeReview(ReviewVO vo) {
		mySQL.insert(loc+"writeReview", vo);
	}
}
