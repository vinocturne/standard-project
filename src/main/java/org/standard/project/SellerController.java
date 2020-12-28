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

@Controller
@RequestMapping(value = "/Seller")
public class SellerController {
	@Resource(name = "CustomerService")
	CustomerService customerService;
	
	@RequestMapping(value = "/ProductManage", method = RequestMethod.GET)
	public ModelAndView adminMain(Map<String, Object> map, CustomerVO vo) {
		System.out.println("셀러 입장 및 @@ 목록불러오기");
		ModelAndView mav = new ModelAndView ("/Seller/ProductManage");
		
		
		return mav;
	}
	

}
