package org.standard.project.order;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

	@Override
	public List<Map<String, Object>> getDailyIncome() {
		List<Map<String, Object>> dailyIncomeList = new ArrayList<Map<String, Object>>();
		dailyIncomeList = orderHistoryDAO.getDailyIncome();
		return dailyIncomeList;
	}
	
	/*
	 * public CustomerVO getCustomer(CustomerVO vo) { return
	 * customerDAO.getCustomer(vo); }
	 */

}
