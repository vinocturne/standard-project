package org.standard.project.customer.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.standard.project.customer.CustomerVO;

@Repository("customerDAO")
public class CustomerDAO {
	@Autowired
	SqlSessionTemplate mySQL;
	
	private String loc = "org.standard.project.CustomerMapper.";
	
	public CustomerVO getCustomer(CustomerVO vo) {
		return mySQL.selectOne(loc+"getCustomer", vo);
	}
		
	public void joinCustomer(CustomerVO vo) {
		
	}


}
