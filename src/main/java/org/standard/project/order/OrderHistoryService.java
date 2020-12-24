package org.standard.project.order;

import java.util.ArrayList;

import org.standard.project.customer.CustomerVO;

public interface OrderHistoryService {
	//Customer의 이름을 넣고 CustomerId에 맞는 구매목록 가져오는 기능
	ArrayList<OrderHistoryVO> getOrderHistoryList(CustomerVO customerVO);
	
}
