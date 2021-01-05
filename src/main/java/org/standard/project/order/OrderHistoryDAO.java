package org.standard.project.order;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.standard.project.brand.BrandDBVO;
import org.standard.project.customer.CustomerVO;
import org.standard.project.product.ProductChildVO;
import org.standard.project.product.ProductParentVO;

@Repository("orderHistoryDAO")
public class OrderHistoryDAO {
	@Autowired SqlSessionTemplate mySQL;
	
	private String loc = "org.standard.project.OrderHistoryMapper.";

	public ArrayList<OrderHistoryVO> getOrderHistoryList(CustomerVO customerVO) {
		ArrayList<OrderHistoryVO> orderHistoryList = new ArrayList<OrderHistoryVO>();
		orderHistoryList =(ArrayList) mySQL.selectList(loc+"getList",customerVO);
		return orderHistoryList;
	}

	public List<Map<String, Object>> getDailyIncome() {
		List<Map<String, Object>> dailyIncomeList = new ArrayList<Map<String, Object>>();
		dailyIncomeList = mySQL.selectList(loc+"getDailyIncomeList");
		return dailyIncomeList;
	}
	
	public ArrayList<ProductParentVO> getBrandOrderList(BrandDBVO loginBrand) {
		ArrayList<ProductParentVO> getBrandOderList = new ArrayList<ProductParentVO>();
		getBrandOderList =(ArrayList) mySQL.selectList(loc+"getBrandOrderList",loginBrand);
		return getBrandOderList;
	}
	
	public void modifyDeliveryList(OrderHistoryVO vo) {
		mySQL.update(loc+"modifyDeliveryList", vo);
	}
	
	public void deleteDeliveryList(String o_Num) {
		mySQL.delete(loc+"deleteDeliveryList", o_Num);
	}


	public void insertOrderHistory(OrderHistoryVO vo) {
		mySQL.insert(loc+"insertOrderHistory", vo);
		
	}

	/*
	 * @Repository("customerDAO") public class CustomerDAO {
	 * 
	 * @Autowired SqlSessionTemplate mySQL;
	 * 
	 * private String loc = "org.standard.project.CustomerMapper.";
	 * 
	 * public CustomerVO getCustomer(CustomerVO vo) { return
	 * mySQL.selectOne(loc+"getCustomer", vo); }
	 */
	
	public OrderHistoryVO cusOrder(OrderHistoryVO vo) {
		return mySQL.selectOne(loc+"cusOrder", vo);
	}

}
