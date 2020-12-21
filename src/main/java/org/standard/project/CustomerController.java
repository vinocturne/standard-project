package org.standard.project;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.standard.project.customer.CustomerService;
import org.standard.project.customer.CustomerVO;

@Controller
@RequestMapping(value="/Customer")
public class CustomerController {
	@Resource(name="CustomerService")
	CustomerService customerService;
	
	@RequestMapping(value="/login_form", method=RequestMethod.GET)
	public void login() {} 
	
	@RequestMapping(value="/login_ok", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView login_ok(CustomerVO vo, ModelAndView mav, HttpSession session, HttpServletResponse response) throws IOException {
		if(vo.getC_Id() == null || vo.getC_Id().equals("")) {
//			throw new IllegalArgumentException("ID를 입력해주세요");
		}
		System.out.println(">>> 로그인 프로세스 입장");
		System.out.println(vo);
		CustomerVO customer = customerService.getCustomer(vo);
		System.out.println(customer);
		
		if(vo.getC_Id().equals(customer.getC_Id()) && vo.getC_Password().equals(customer.getC_Password())) {
			System.out.println("로그인 되어씁니다");
			session.setAttribute("loginCustomer", customer); 
			mav.setViewName("index"); 
		}else {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
            out.flush();
        }


//			System.out.println("꺼져");
//			mav.setViewName("redirect:login_form"); 
		
			
		return mav;
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "user/login";
	}
	

	
	
}
