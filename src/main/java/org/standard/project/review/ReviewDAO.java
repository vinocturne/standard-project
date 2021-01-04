package org.standard.project.review;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("ReviewDAO")
public class ReviewDAO {
	@Autowired 
	SqlSessionTemplate mySQL;
	private String loc = "org.standard.project.OrderHistoryMapper.";
	
	
}
