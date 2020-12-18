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
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void login() {} //GET���� login�̶�� �ּҸ� ������ login.jsp�� �̵�.
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView login_ok(CustomerVO vo, ModelAndView mav, HttpSession session) {
		if(vo.getC_Id() == null || vo.getC_Id().equals("")) {
			throw new IllegalArgumentException("���̵� �Է����ּ���");
			//���̵� null�̰ų� ������ ��� ���
		}
		
		CustomerVO customer = customerService.getCustomer(vo);
		
		session.setAttribute("loginCustomer", customer); //session�� loginUser��� �̸����� �����ϰ�,userVO���� �ҷ��� user�� vo�� �־��ش�.
		mav.setViewName("redirect:login"); //login���� �翬��.
		
		return mav;
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "user/login";
	}
}
