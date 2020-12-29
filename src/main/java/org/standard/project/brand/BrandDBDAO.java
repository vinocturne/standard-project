package org.standard.project.brand;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.standard.project.customer.CustomerVO;

@Repository("brandDBDAO")
public class BrandDBDAO {
	@Autowired
	SqlSessionTemplate mySQL;
	
	private String loc = "org.standard.project.BrandDBMapper.";
	
	public BrandDBVO getBrandId(CustomerVO vo) {
		return mySQL.selectOne(loc+"getBrandId", vo);
	}
	public void insertBrand(BrandDBVO vo) {
		mySQL.insert(loc+"insertBrand", vo);
	}
	
}
