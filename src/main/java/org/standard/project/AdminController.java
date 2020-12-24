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
	
//	@ResponseBody
//	@RequestMapping(value = "/deleteWaitingCustomer", method = RequestMethod.POST)
//	public int deleteWaitingCustomer(HttpSession session, @RequestParam(value = "chBox[]") List<String> chArr, CustomerVO vo) throws Exception {
//		 System.out.println("선택한 웨이팅회원");
//		 System.out.println(chArr);
//		 int result = 0;
//		 
//		   customerService.deleteWaitingCustomer(chArr);
//		   result = 1;
//		 return result;  
//		}
	@RequestMapping(value = "/deleteWaitingCustomer", method = RequestMethod.POST) 
	public String delete_user(@RequestParam(value = "chBox[]") String[] c_Id) throws Exception { 
		// 삭제할 사용자 ID마다 반복해서 사용자 삭제
		System.out.println("선택한 웨이팅회원");
		for (String user_id : c_Id) { 
			System.out.println("사용자 삭제 = " + user_id); 
			customerService.deleteWaitingCustomer(user_id);
		} 
		// 목록 페이지로 이동 
		return "redirect:/Admin/AdminMain"; }
}
