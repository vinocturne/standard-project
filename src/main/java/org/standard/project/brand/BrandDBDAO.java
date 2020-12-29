package org.standard.project.brand;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("brandDBDAO")
public class BrandDBDAO {
	@Autowired
	SqlSessionTemplate mySQL;
	
	private String loc = "org.standard.project.BrandDBMapper.";
	
	public List<Map<String, Object>> getBrandName(Map<String, Object> map) {
		return mySQL.selectList(loc+"getBrandName", map);
	}
}
