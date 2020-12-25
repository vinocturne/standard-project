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
@RequestMapping(value = "/Admin")
public class AdminController {
	@Resource(name = "CustomerService")
	CustomerService customerService;
	
	@RequestMapping(value = "/AdminMain", method = RequestMethod.GET)
	public ModelAndView adminMain(Map<String, Object> map, CustomerVO vo) {
		System.out.println("어드민 입장 및 웨이팅회원 목록불러오기");
		ModelAndView mav = new ModelAndView ("/Admin/AdminMain");
		
		List<Map<String, Object>> list = customerService.listWaitingCustomer(map);
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value = "/deleteWaitingCustomer", method = RequestMethod.POST) 
	public String delete_user(@RequestParam(value = "chBox[]") String[] c_Id) throws Exception { 
		// 체크한 ID마다 반복해서 사용자 삭제
		System.out.println("선택한 회원 삭제 가동");
		for (String user_id : c_Id) { 
			System.out.println("사용자 삭제 = " + user_id); 
			customerService.deleteWaitingCustomer(user_id);
		} 
		return "redirect:/Admin/AdminMain"; 
	}
	
	@RequestMapping(value = "/approveCustomer", method = RequestMethod.POST) 
	public String approveCustomer(@RequestParam(value = "chBox[]") String[] c_Id) throws Exception { 
		// 어차피 id 체크 되어 회원가입한것이라 체크 안하고 쿼리문을 통해 복사 붙혀널기 하고 삭제한다. 
		// 체크한 ID마다 반복해서 사용자 복붙 및 삭제
		System.out.println("선택한 회원 승인 가동");
		for (String user_id : c_Id) { 
			System.out.println("사용자 복사 붙혀놓기 = " + user_id); 
			customerService.approveCustomer(user_id);
			System.out.println("사용자 삭제 = " + user_id); 
			customerService.deleteWaitingCustomer(user_id);
		} 
		
		return "redirect:/Admin/AdminMain"; 
	}
	
	
}
