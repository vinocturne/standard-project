package org.standard.project.order;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.standard.project.brand.BrandDBVO;
import org.standard.project.customer.CustomerVO;
import org.standard.project.product.ProductParentVO;

public interface OrderHistoryService {

	//Customer의 이름을 넣고 CustomerId에 맞는 구매목록 가져오는 기능
	ArrayList<OrderHistoryVO> getOrderHistoryList(CustomerVO customerVO);
	
	//일자별 주문금액 총액 정보를 가져오는 기능
	List<Map<String, Object>> getDailyIncome();
	ArrayList<ProductParentVO> getBrandOrderList(BrandDBVO loginBrand);
	
}
