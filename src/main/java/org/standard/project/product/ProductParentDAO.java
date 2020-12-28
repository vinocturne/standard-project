package org.standard.project.product;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("productParentDAO")
public class ProductParentDAO {
	@Autowired
	SqlSessionTemplate mySQL;
	
	private String loc = "org.standard.project.ProductMapper.";
	
	public List<Map<String, Object>> listProductParent(Map<String, Object> map) {
		return mySQL.selectList(loc+"listProductParent", map);
	}

}
