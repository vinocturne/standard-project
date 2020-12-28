package org.standard.project;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.standard.project.customer.CustomerService;
import org.standard.project.customer.CustomerVO;
import org.standard.project.product.ProductParentService;
import org.standard.project.product.ProductParentVO;

@Controller
@RequestMapping(value = "/Seller")
public class SellerController {
	@Resource(name = "ProductParentService")
	ProductParentService productParentService;
	@Resource(name = "CustomerService")
	CustomerService customerService;
	
	@RequestMapping(value = "/ProductManage", method = RequestMethod.GET)
	public ModelAndView productManage(Map<String, Object> map, ProductParentVO vo) {
		System.out.println("어드민 입장 및 웨이팅회원 목록불러오기");
		ModelAndView mav = new ModelAndView ("/Seller/ProductManage");
		List<Map<String, Object>> re = productParentService.listProductParent(map);
		mav.addObject("list", re);
		
		return mav;
	}
	
	@RequestMapping(value = "/ProductAddParent", method = RequestMethod.GET)
	public ModelAndView AddParent(Map<String, Object> map, CustomerVO vo) {
		System.out.println("부모 상품 추가");
		ModelAndView mav = new ModelAndView ("/Seller/ProductAddParent");
		

		return mav;
	}

}
