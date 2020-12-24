package org.standard.project;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.standard.project.customer.CustomerService;
import org.standard.project.customer.CustomerVO;

@Controller
@RequestMapping(value = "/Admin")
public class AdminController {
	@Resource(name = "CustomerService")
	CustomerService customerService;
	
	@RequestMapping(value = "/AdminMain", method = RequestMethod.GET)
	public ModelAndView adminMain(Map<String, Object> map, CustomerVO vo) {
		System.out.println("어드민 입장");
		ModelAndView mav = new ModelAndView ("/Admin/AdminMain");
		
		List<Map<String, Object>> list = customerService.listWaitingCustomer(map);
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value= "/seller")
	public String magazineList() {
		
		return "/Admin/seller";
	}
	
}
