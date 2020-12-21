package org.standard.project.customer.impl;

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

}
