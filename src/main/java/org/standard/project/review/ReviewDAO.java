package org.standard.project.review;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("reviewDAO")
public class ReviewDAO {
	@Autowired 
	SqlSessionTemplate mySQL;
	private String loc = "org.standard.project.ReviewMapper.";
	
	public List<ReviewVO> getReviewListForSeller(ReviewVO vo) {
		return mySQL.selectList(loc+"reviewListForSeller", vo);
	}
}
