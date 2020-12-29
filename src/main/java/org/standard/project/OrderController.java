package org.standard.project;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.standard.project.customer.CustomerService;
import org.standard.project.customer.CustomerVO;
import org.standard.project.order.OrderHistoryService;
import org.standard.project.order.OrderHistoryVO;

@Controller
@RequestMapping(value = "/OrderHistory")
public class OrderController {
	
	@Resource(name = "OrderHistoryService")
	OrderHistoryService orderService;
	
	@RequestMapping("/OrderHistory")
	public String getList(HttpSession session){
		session.removeAttribute("orderList");
		System.out.println(session.getAttribute("orderList"));
		System.out.println("order내역보기");
		//로그인후에 세션에 저장된 사용자 객체를 활용.
		CustomerVO customerVO = (CustomerVO)session.getAttribute("loginCustomer");
		ArrayList<OrderHistoryVO> orderHistoryList = new ArrayList<OrderHistoryVO>();
		orderHistoryList = orderService.getOrderHistoryList(customerVO);
		System.out.println(orderHistoryList);
		//가져온 후 세션에 저장하고,
		session.setAttribute("orderList", orderHistoryList);
		//돌아갈 페이지 지정
		return "Customer/OrderHistory";
	}

}

