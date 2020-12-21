package org.standard.project;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.standard.project.customer.CustomerService;
import org.standard.project.customer.CustomerVO;

@Controller
@RequestMapping(value="/login")
public class CustomerController {
	@Resource(name="CustomerService")
	CustomerService customerService;
	
	@RequestMapping(value="/login_form", method=RequestMethod.GET)
	public void login() {} 
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView login_ok(CustomerVO vo, ModelAndView mav, HttpSession session) {
		if(vo.getC_Id() == null || vo.getC_Id().equals("")) {
			throw new IllegalArgumentException("ID를 입력해주세요");
		}
		
		CustomerVO customer = customerService.getCustomer(vo);
		
		session.setAttribute("loginCustomer", customer); 
		mav.setViewName("redirect:login"); 
		
		return mav;
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "user/login";
	}
}
