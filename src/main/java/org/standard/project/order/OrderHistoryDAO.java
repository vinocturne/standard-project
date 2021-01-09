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
	public List<Map<String, Object>> getMarketShare() {
		List<Map<String, Object>> marketShareList = new ArrayList<Map<String,Object>>();
		marketShareList = mySQL.selectList(loc+"getMarketShareList");
		return marketShareList;
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
		System.out.println("orderHistoryDAO 실행전 확인");
		System.out.println("상품가격 : "+vo.getP_Price()+",주문 수량: "+ vo.getO_Quantity() + ",총 주문금액 : "+ vo.getO_TotalPrice());
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
	
	public ArrayList<OrderHistoryVO> cusOrder(OrderHistoryVO vo) {
		ArrayList<OrderHistoryVO> cusOrder = new ArrayList<OrderHistoryVO>();
		cusOrder =(ArrayList) mySQL.selectList(loc+"cusOrder", vo);
		return cusOrder;
	}

	public List<Map<String, Object>> getManCategoryMarketShare() {
		List<Map<String, Object>> manCategoryMarketShareList = new ArrayList<Map<String,Object>>();
		manCategoryMarketShareList = mySQL.selectList(loc+"getManCategoryMarketShare");
		return manCategoryMarketShareList;
	}

	public List<Map<String, Object>> getWomanCategoryMarketShare() {
		List<Map<String, Object>> womanCategoryMarketShareList = new ArrayList<Map<String,Object>>();
		womanCategoryMarketShareList = mySQL.selectList(loc+"getWomanCategoryMarketShare");
		return womanCategoryMarketShareList;
	}

	public OrderHistoryVO getOneHistory(int o_Num) {
		return mySQL.selectOne(loc+"getOneHistory", o_Num);
	}

	

}
