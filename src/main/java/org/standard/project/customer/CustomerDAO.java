package org.standard.project.customer;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("customerDAO")
public class CustomerDAO {
	@Autowired
	SqlSessionTemplate mySQL;
	
	private String loc = "org.standard.project.CustomerMapper.";
	
	public CustomerVO getCustomer(CustomerVO vo) {
		return mySQL.selectOne(loc+"getCustomer", vo);
	}
		
	public void joinCustomer(CustomerVO vo) {
		mySQL.insert(loc+"joinCustomer", vo);
	}
	
	public void deleteCustomer(CustomerVO vo) {
		mySQL.delete(loc+"deleteCustomer", vo);
	}
	public void modifyCustomer(CustomerVO vo) {
		mySQL.delete(loc+"modifyCustomer", vo);
	}

	public void joinWaitingList(CustomerVO vo) {
		mySQL.insert(loc+"joinWaitingList", vo);
		
	}

	public CustomerVO getWaitingCustomer(CustomerVO vo) {
		return mySQL.selectOne(loc+"getWaitingCustomer", vo);
	}
	
	


}
