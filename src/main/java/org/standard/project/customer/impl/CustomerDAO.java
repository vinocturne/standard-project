package org.standard.project.customer.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
	
	public List<Map<String, Object>> listWaitingCustomer(Map<String, Object> map) {
		return mySQL.selectList(loc+"listWaitingCustomer", map);
	}
	public void deleteWaitingCustomer(String c_Id) {
		mySQL.delete(loc+"deleteWaitingCustomer", c_Id);
	}
	public void approveCustomer(String c_Id) {
		mySQL.delete(loc+"approveCustomer", c_Id);

	}

	public List<Map<String, Object>> getDailyRegNumber() {
		List<Map<String, Object>> regNumberList = new ArrayList<Map<String, Object>>();
		regNumberList = mySQL.selectList(loc+"getDailyRegNumber");
		return regNumberList;
	}

	public CustomerVO getCustomerByNameAndEmail(CustomerVO vo) {
		return mySQL.selectOne(loc+"getCustomerId", vo);
	}

	public CustomerVO getCustomerByIdAndNameAndEmail(CustomerVO vo) {
		// TODO Auto-generated method stub
		return mySQL.selectOne(loc+"getCustomerPwd", vo);
	}

	public void changePassword(CustomerVO vo) {
		mySQL.update(loc+"chagePassword", vo);
		
	}

}
