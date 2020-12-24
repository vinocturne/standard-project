package org.standard.project.customer.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.standard.project.customer.CustomerService;
import org.standard.project.customer.CustomerVO;

@Service("CustomerService")
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	private CustomerDAO customerDAO;
	
	public void setCustomerDAO(CustomerDAO customerDAO) {
		this.customerDAO = customerDAO;
	}
	
	public void joinCustomer(CustomerVO vo) {
		customerDAO.joinCustomer(vo);		
	}
	
	public CustomerVO getCustomer(CustomerVO vo) {
		return customerDAO.getCustomer(vo);
	}
	
	public void deleteCustomer(CustomerVO vo) {
		customerDAO.deleteCustomer(vo);
	}
	
	public void modifyCustomer(CustomerVO vo) {
		customerDAO.modifyCustomer(vo);
	}

	@Override
	public void joinWaitingList(CustomerVO vo) {
		customerDAO.joinWaitingList(vo);
		
	}

	@Override
	public CustomerVO getWaitingCustomer(CustomerVO vo) {
		return customerDAO.getWaitingCustomer(vo);
	}
	
	public List<Map<String, Object>> listWaitingCustomer(Map<String, Object> map) {
		return customerDAO.listWaitingCustomer(map);
	}

}
