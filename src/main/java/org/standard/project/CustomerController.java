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
import org.standard.project.common.Encrypt;
import org.standard.project.customer.CustomerService;
import org.standard.project.customer.CustomerVO;
import org.standard.project.customer.impl.CustomerDAO;

@Controller
@RequestMapping(value = "/Customer")
public class CustomerController {
	@Resource(name = "CustomerService")
	CustomerService customerService;

	@RequestMapping(value = "/login_form", method = RequestMethod.GET)
	public void login() {
	}

	@RequestMapping(value = "/login_ok", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView login_ok(CustomerVO vo, ModelAndView mav, HttpSession session, HttpServletResponse response)
			throws IOException {
		if (vo.getC_Id() == null || vo.getC_Id().equals("")) {
//         throw new IllegalArgumentException("ID를 입력해주세요");
		}
		System.out.println(">>> 로그인 프로세스 입장");
		System.out.println(vo);
		// 암호화처리.(사용자가 입력한 비밀번호를 암호화처리하여 vo객체에 setPassword()처리후에 디비조회.
		vo.setC_Password(Encrypt.encrypt(vo.getC_Password()));

		CustomerVO customer = customerService.getCustomer(vo);
		System.out.println(customer);
		if (vo.getC_Id().equals(customer.getC_Id()) && vo.getC_Password().equals(customer.getC_Password())) {
			System.out.println("로그인 되어씁니다");
			customer.setC_Password(null);
			session.setAttribute("loginCustomer", customer);
			mav.setViewName("index");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
			out.flush();
		}

//         System.out.println("꺼져");
//         mav.setViewName("redirect:login_form"); 

		return mav;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/Customer/login_form";
	}

	// Register. Get일땐 페이지로 단순이동, Post면 등록처리
	@RequestMapping(value = "/Register", method = RequestMethod.GET)
	public String register_form() {
		return "Customer/Register";
	}

	@RequestMapping(value = "/Register", method = RequestMethod.POST)
	public ModelAndView register(CustomerVO vo, ModelAndView mav, HttpServletRequest req) {
		String phoneNum = req.getParameter("mobile1-1") + req.getParameter("mobile1-2") + req.getParameter("mobile1-3");
		vo.setC_Phone1(phoneNum);
		String phoneNum2 = req.getParameter("mobile2-1") + req.getParameter("mobile2-2")
				+ req.getParameter("mobile2-3");
		vo.setC_Phone2(phoneNum2);
		String emailAddr = req.getParameter("email1") + "@" + req.getParameter("email2");
		vo.setC_Email(emailAddr);
		vo.setC_Password(Encrypt.encrypt(vo.getC_Password()));
		// 구매자이면 바로 가입
		if (vo.getRole().equals("구매자")) {
			customerService.joinCustomer(vo);
		}
		// 셀러면 가입대기목록에 저장(waitingcustomer)
		else if (vo.getRole().equals("셀러")) {
			customerService.joinWaitingList(vo);
		}

		System.out.println(vo);
		mav.setViewName("index");
		// 등록 완료후에는 메인페이지로 이동
		return mav;
	}

	@RequestMapping(value = "/check_Id")
	public void check_Id(HttpServletRequest req, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		// System.out.println(req.getParameter("data"));
		System.out.println(req.getParameter("param"));
		String RequestedID = req.getParameter("param");
		CustomerVO vo = new CustomerVO();
		vo.setC_Id(RequestedID);
		CustomerVO customer = customerService.getCustomer(vo);
		CustomerVO waitingCustomer = customerService.getWaitingCustomer(vo);
		if (customer == null && waitingCustomer == null) {
			// 등록이 되었지 않은 경우
			out.print("사용할 수 있는 아이디 입니다.");
		} else {
			// 등록이 되어있는경우
			out.print("이미 사용중인 아이디입니다.");
		}

	}

	@RequestMapping(value = "/Modify", method = RequestMethod.GET)
	public String modify_form() {
		return "Customer/Modify";
	}

	@RequestMapping(value = "/Modify", method = RequestMethod.POST)
	public ModelAndView modify(CustomerVO vo, ModelAndView mav, HttpServletRequest req, HttpServletResponse response) throws IOException {
		System.out.println("수정기능");
		vo.setC_Password(Encrypt.encrypt(vo.getC_Password()));
		if(!(vo.getC_Password()==null)) {
			
		}
		System.out.println(vo);
		String phoneNum = req.getParameter("mobile1-1") + req.getParameter("mobile1-2") + req.getParameter("mobile1-3");
		vo.setC_Phone1(phoneNum);
		String phoneNum2 = req.getParameter("mobile2-1") + req.getParameter("mobile2-2")
				+ req.getParameter("mobile2-3");
		vo.setC_Phone2(phoneNum2);
		String emailAddr = req.getParameter("email1") + "@" + req.getParameter("email2");
		vo.setC_Email(emailAddr);
		customerService.modifyCustomer(vo);
		System.out.println(vo);

		// 수정완료후 수정페이지
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
			out.println("<script>alert('수정완료.'); history.go(-1);</script>");
			out.flush();
		mav.setViewName("Customer/Modify");
		return mav;

	}
	
	@RequestMapping(value = "/Delete",method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView delete(CustomerVO vo, ModelAndView mav, HttpServletRequest req, HttpSession session, HttpServletResponse response) throws IOException {
		vo = (CustomerVO) session.getAttribute("loginCustomer");
		System.out.println("삭제기능");
		System.out.println(vo);
		customerService.deleteCustomer(vo);
		System.out.println(vo);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
			out.println("<script>alert('삭제완료.'); history.go(1);</script>");
			out.flush();
		mav.setViewName("index");
		return mav;

	}

	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String myCart(HttpSession session) {
		if (session.getAttribute("loginCustomer") == null) {
			return "redirect:/Customer/login_form";
		} else {
			return "Customer/cart";
		}
	}

	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String myOrder(HttpSession session) {
		if (session.getAttribute("loginCustomer") == null) {
			return "redirect:/Customer/login_form";
		} else {
			return "Customer/order";
		}

	}

	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPageMain(HttpSession session) {
		if (session.getAttribute("loginCustomer") == null) {
			return "redirect:/Customer/login_form";
		} else {
			return "Customer/Mypage";
		}

	}

}