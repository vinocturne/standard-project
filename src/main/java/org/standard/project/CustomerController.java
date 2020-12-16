package org.standard.project;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.standard.customer.CustomerService;
import org.standard.customer.CustomerVO;

@Controller
@RequestMapping(value="/login")
public class CustomerController {
	@Resource
	CustomerService customerService;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void login() {} //GET으로 login이라는 주소를 받으면 login.jsp로 이동.
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView login_ok(CustomerVO vo, ModelAndView mav, HttpSession session) {
		if(vo.getC_Id() == null || vo.getC_Id().equals("")) {
			throw new IllegalArgumentException("아이디를 입력해주세요");
			//아이디가 null이거나 공백일 경우 출력
		}
		
		CustomerVO customer = customerService.getCustomer(vo);
		
		session.setAttribute("loginCustomer", customer); //session을 loginUser라는 이름으로 설정하고,userVO에서 불러온 user의 vo를 넣어준다.
		mav.setViewName("redirect:login"); //login으로 재연결.
		
		return mav;
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "user/login";
	}
}
