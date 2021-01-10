package org.standard.project.order;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.standard.project.brand.BrandDBVO;
import org.standard.project.customer.CustomerVO;
import org.standard.project.product.ProductParentVO;

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

	@Override
	public ArrayList<ProductParentVO> getBrandOrderList(BrandDBVO loginBrand) {
		return orderHistoryDAO.getBrandOrderList(loginBrand);
	}

	@Override
	public void modifyDeliveryList(OrderHistoryVO vo) {
		orderHistoryDAO.modifyDeliveryList(vo);
	}

	@Override
	public void deleteDeliveryList(String o_Num) {
		orderHistoryDAO.deleteDeliveryList(o_Num);
	}

	@Override
	public void insertOrderHistory(OrderHistoryVO vo) {
		orderHistoryDAO.insertOrderHistory(vo);
		
	}


	
	/*
	 * public CustomerVO getCustomer(CustomerVO vo) { return
	 * customerDAO.getCustomer(vo); }
	 */
	
	@Override
	public ArrayList<OrderHistoryVO> cusOrder(OrderHistoryVO vo) {
		return orderHistoryDAO.cusOrder(vo);
	}


	@Override
	public OrderHistoryVO getOneHistory(int o_Num) {
		return orderHistoryDAO.getOneHistory(o_Num);
	}

	@Override
	public ArrayList<Category2SalesVO> getManCategoryMarketShareVOList() {
		return orderHistoryDAO.getManCategoryMarketShareVOList();
	}

	@Override
	public ArrayList<Category2SalesVO> getWomanCategoryMarketShareVOList() {
		// TODO Auto-generated method stub
		return orderHistoryDAO.getWomanCategoryMarketShareVOList();
	}

	@Override
	public ArrayList<MarketShareVO> getMarketShareVOList() {
		// TODO Auto-generated method stub
		return orderHistoryDAO.getMarketShareVOList();
	}

//	@Override
//	public ArrayList<Category2SalesVO> getCategoryMarketShareVOList() {
//		return orderHistoryDAO.getCategoryMarketShareVOList();
//	}

	

}
