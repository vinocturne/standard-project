package org.standard.project.order;

import java.util.ArrayList;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.standard.project.customer.CustomerVO;

@Service("OrderHistoryService")
public class OrderHistoryServiceImpl implements OrderHistoryService {

	@Autowired
	private OrderHistoryDAO orderHistoryDAO;

	@Override
	public ArrayList<OrderHistoryVO> getOrderHistoryList(CustomerVO customerVO) {
		
		ArrayList<OrderHistoryVO> orderHistoryList = new ArrayList<OrderHistoryVO>();
		orderHistoryList = orderHistoryDAO.getOrderHistoryList(customerVO);
		return orderHistoryList;
	}
	
	/*
	 * public CustomerVO getCustomer(CustomerVO vo) { return
	 * customerDAO.getCustomer(vo); }
	 */

}
