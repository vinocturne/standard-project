package org.standard.project.customer.impl;

import java.util.ArrayList;
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
	
	public void deleteWaitingCustomer(String c_Id) {
		customerDAO.deleteWaitingCustomer(c_Id);
	}

	public void approveCustomer(String c_Id) {
		customerDAO.approveCustomer(c_Id);
		
	}

	@Override
	public List<Map<String, Object>> getDailyRegNumber() {
		List<Map<String, Object>> regNumberList = new ArrayList<Map<String, Object>>();
		regNumberList = customerDAO.getDailyRegNumber();
		return regNumberList;
	}

	@Override
	public CustomerVO getCustomerByNameAndEmail(CustomerVO vo) {
		return customerDAO.getCustomerByNameAndEmail(vo);
	}

	@Override
	public CustomerVO getCustomerByIdAndNameAndEmail(CustomerVO vo) {
		return customerDAO.getCustomerByIdAndNameAndEmail(vo);
	}

	@Override
	public void changePassword(CustomerVO vo) {
		customerDAO.changePassword(vo);
		
	}


}
