package org.standard.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.standard.project.brand.BrandDBService;
import org.standard.project.brand.BrandDBVO;
import org.standard.project.customer.CustomerService;
import org.standard.project.customer.CustomerVO;
import org.standard.project.order.OrderHistoryVO;
import org.standard.project.product.ProductParentService;
import org.standard.project.product.ProductParentVO;

@Controller
@RequestMapping(value = "/Seller")
public class SellerController {
	@Resource(name = "ProductParentService")
	ProductParentService productParentService;
	@Resource(name = "CustomerService")
	CustomerService customerService;
	@Resource(name = "BrandDBService")
	BrandDBService brandDBService;
	
	@RequestMapping(value = "/ProductManage", method = RequestMethod.GET)
	public ModelAndView productManage(HttpSession session, ModelAndView mav, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		session.removeAttribute("productParentList");
		System.out.println(session.getAttribute("productParentList"));
		System.out.println("productParentList 보기");
		//로그인후에 세션에 저장된 사용자 객체를 활용.
		CustomerVO customerVO = (CustomerVO)session.getAttribute("loginCustomer");
		if(customerVO == null) {
			out.println("<script>alert('로그인해주세요.');</script>");
			out.flush();
			mav.setViewName("Customer/login_form");
			return mav;
		}else if (customerVO.getBrandName() ==null) {
			out.println("<script>alert('기업회원으로 가입해주세요.');</script>");
			out.flush();
			mav.setViewName("Customer/login_form");
			return mav;
		}
		
		BrandDBVO loginBrand = brandDBService.getBrandId(customerVO);
		System.out.println(loginBrand);
		
		ArrayList<ProductParentVO> listProductParent = new ArrayList<ProductParentVO>();
		listProductParent = productParentService.listProductParent(loginBrand);
		System.out.println(listProductParent);
		
		mav = new ModelAndView ("/Seller/ProductManage");
		mav.addObject("list", listProductParent);
		return mav;
	}
	
	@RequestMapping(value = "/ProductAddParent", method = RequestMethod.GET)
	public ModelAndView AddParent(Map<String, Object> map, CustomerVO vo) {
		System.out.println("부모 상품 추가");
		ModelAndView mav = new ModelAndView ("/Seller/ProductAddParent");
		

		return mav;
	}

}
