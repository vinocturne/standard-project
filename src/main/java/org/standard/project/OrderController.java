package org.standard.project;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.standard.project.customer.CustomerService;
import org.standard.project.customer.CustomerVO;
import org.standard.project.order.OrderHistoryService;
import org.standard.project.order.OrderHistoryVO;
import org.standard.project.product.ProductChildService;
import org.standard.project.product.ProductChildVO;
import org.standard.project.product.ProductParentService;
import org.standard.project.product.ProductParentVO;
import org.standard.project.review.ReviewService;
import org.standard.project.review.ReviewVO;

@Controller
@RequestMapping(value = "/OrderHistory")
public class OrderController {
	
	@Resource(name = "OrderHistoryService")
	OrderHistoryService orderService;
	@Resource(name="ProductChildService")
	ProductChildService proudctChildService;
	@Resource(name="ProductParentService")
	ProductParentService productParentService;
	@Resource(name="ReviewService")
	ReviewService reviewService;
	
	
	@RequestMapping("/OrderHistory")
	public String getList(HttpSession session, HttpServletRequest req){
		session.removeAttribute("orderList");
		System.out.println(session.getAttribute("orderList"));
		System.out.println("order내역보기");
		//로그인후에 세션에 저장된 사용자 객체를 활용.
		CustomerVO customerVO = (CustomerVO)session.getAttribute("loginCustomer");
		ArrayList<OrderHistoryVO> orderHistoryList = new ArrayList<OrderHistoryVO>();
		orderHistoryList = orderService.getOrderHistoryList(customerVO);
		System.out.println(orderHistoryList);
		System.out.println("오더히스토리리스트 싸이즈 "+orderHistoryList.size());
		ArrayList<ProductParentVO> productInfoList = new ArrayList<ProductParentVO>();//부모상품객체리스트를 넘겨줄 배열
		for(int i=0;i<orderHistoryList.size();i++) {
			//System.out.println("parent_p_Id : "+orderHistoryList.get(i).getParent_p_Id());
			ProductParentVO ppVO = new ProductParentVO();
			String parent_p_Id =orderHistoryList.get(i).getParent_p_Id();
			ppVO =productParentService.selectParentProduct(parent_p_Id);
			//System.out.println("parent_p_Id로 ppVO 가져온 결과 : "+ ppVO);
			productInfoList.add(ppVO);
		}
		System.out.println("어미상품객체리스트 정보 : "+productInfoList);
//		//request에 저장
		req.setAttribute("productInfoList", productInfoList);

		//가져온 후 세션에 저장하고,
		session.setAttribute("orderList", orderHistoryList);
		//돌아갈 페이지 지정
		return "Customer/OrderHistory";
	}
	
	@RequestMapping(value="/save", method = RequestMethod.POST)
	public void reviewSave(HttpSession session, HttpServletRequest req) {
		String p_Id = req.getParameter("p_Id");
		String pp_Id = p_Id.substring(0,7);
		ProductParentVO ppvo = productParentService.selectParentProduct(pp_Id);
		int brandId = ppvo.getPp_Brand();
		String pp_Name = ppvo.getPp_Name();
		String r_Coment = req.getParameter("r_Coment");
		CustomerVO cvo = (CustomerVO)session.getAttribute("loginCustomer");
		String r_Writer = cvo.getC_Id();
		String r_Title = req.getParameter("r_Title");
		ReviewVO rvo = new ReviewVO();
		rvo.setBrandId(brandId);
		rvo.setP_Id(p_Id);
		rvo.setParent_p_Id(pp_Id);
		rvo.setR_Coment(r_Coment);
		rvo.setR_Writer(r_Writer);
		rvo.setR_Title(r_Title);
		reviewService.writeReview(rvo);
	}
	

}

