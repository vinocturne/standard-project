package org.standard.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.standard.project.brand.BrandDBService;
import org.standard.project.brand.BrandDBVO;
import org.standard.project.common.Email;
import org.standard.project.common.Encrypt;
import org.standard.project.common.TempPWD;
import org.standard.project.customer.CustomerService;
import org.standard.project.customer.CustomerVO;
import org.standard.project.product.ProductParentService;
import org.standard.project.product.ProductParentVO;
import org.standard.project.review.ReviewService;
import org.standard.project.review.ReviewVO;

@Controller
@RequestMapping(value = "/Customer")
public class CustomerController {
	@Resource(name = "CustomerService")
	CustomerService customerService;
	@Resource(name ="BrandDBService")
	BrandDBService brandDBService;
	@Resource(name ="ProductParentService")
	ProductParentService productParentService;
	@Resource(name ="ReviewService")
	ReviewService reviewService;
	
	@RequestMapping(value = "/login_form", method = RequestMethod.GET)
	public void login() {
	}

	@RequestMapping(value = "/login_ok", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView login_ok(CustomerVO vo, ModelAndView mav, HttpSession session,  HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		// 아이디 없을 시(d
		if (vo.getC_Id() == null || vo.getC_Id().equals("")) {
			out.println("<script>alert('아이디를 입력해주세요.'); history.go(-1);</script>");
			out.flush();
			mav.setViewName("Customer/login_form");
			return mav;
		}
		// 비밀번호 없을시
		else if (vo.getC_Password() == null || vo.getC_Password().equals("")) {
			out.println("<script>alert('비밀번호를 입력해주세요.'); history.go(-1);</script>");
			out.flush();
			mav.setViewName("Customer/login_form");
			return mav;
		}
		//--
		System.out.println(">>> 로그인 프로세스 입장");
		System.out.println(vo);
		// 암호화처리.(사용자가 입력한 비밀번호를 암호화처리하여 vo객체에 setPassword()처리후에 디비조회.
		vo.setC_Password(Encrypt.encrypt(vo.getC_Password()));

		CustomerVO customer = customerService.getCustomer(vo);
		//등록되지 않은 아이디로 로그인하려는 경우
		//가입승인처리 되지않은 판매자고객이 로그인하려는경우
				if(customer==null) {
					out.println("<script>alert('등록되지 않은 아이디입니다.'); history.go(-1);</script>");
					out.flush();
					mav.setViewName("Customer/login_form");
					return mav;
				}
		System.out.println(vo);
		System.out.println(customer);
		System.out.println(vo.getC_Password());
		System.out.println(customer.getC_Password());
		
		
		try {
			if (vo.getC_Id().equals(customer.getC_Id()) && vo.getC_Password().equals(customer.getC_Password())) {
				System.out.println("로그인 되어씁니다");
				customer.setC_Password(null);
				session.setAttribute("loginCustomer", customer);
				mav.setViewName("index");
			} else {
				out.println("<script>alert('아이디 또는 비밀번호가 틀립니다.'); history.go(-1);</script>");
				out.flush();
				mav.setViewName("Customer/login_form");
				return mav;
			}
		} catch (NullPointerException e) {
			out.println("<script>alert('아이디 또는 비밀번호가 틀립니다.'); history.go(-1);</script>");
			out.flush();
			mav.setViewName("Customer/login_form");
			return mav;
		}
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
	public ModelAndView register(CustomerVO vo, ModelAndView mav, HttpServletResponse response, HttpServletRequest req) throws IOException {
		System.out.println("가입기능");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		vo.setC_Password(Encrypt.encrypt(vo.getC_Password()));
		System.out.println((String) req.getParameter("c_Password"));
		System.out.println((String) req.getParameter("c_Password_confirm"));
		System.out.println("vo값"+vo);
		if ((String) req.getParameter("c_Password") == "") {
			out.println("<script>alert('비밀번호를 입력해주세요.'); history.go(-1);</script>");
			out.flush();
			mav.setViewName("Customer/Register");
			return mav;
		} else if (req.getParameter("c_Password").equals(req.getParameter("c_Password_confirm")) != true) {
			out.println("<script>alert('비밀번호와 비밀번호 확인을 같게해주세요.'); history.go(-1);</script>");
			out.flush();
			mav.setViewName("Customer/Register");
			return mav;
		} else if (req.getParameter("c_Name") == "" || req.getParameter("zipcode") == "" || req.getParameter("mobile-2") == "" || req.getParameter("c_Email") == "") {
			out.println("<script>alert('필수입력사항을 확인해주세요.'); history.go(-1);</script>");
			out.flush();
			mav.setViewName("Customer/Register");
			return mav;
		}
		
		String phoneNum = req.getParameter("mobile1-1") + req.getParameter("mobile1-2") + req.getParameter("mobile1-3");
		vo.setC_Phone1(phoneNum);
		String phoneNum2 = req.getParameter("mobile2-1") + req.getParameter("mobile2-2")
				+ req.getParameter("mobile2-3");
		vo.setC_Phone2(phoneNum2);
		String emailAddr = req.getParameter("email1") + "@" + req.getParameter("email2");
		vo.setC_Email(emailAddr);
		
		vo.setRole((String)req.getParameter("radiocheck"));
		System.out.println("vo값"+vo);
		if (vo.getRole().equals("개인회원")) {
			customerService.joinCustomer(vo);
		}
		// 셀러면 가입대기목록에 저장(waitingcustomer)
		else if (vo.getRole().equals("기업회원")) {
			customerService.joinWaitingList(vo);
		}
		out.println("<script>alert('가입완료');</script>");
		out.flush();
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
			out.print("<strong style='color :green'>사용할 수 있는 아이디 입니다.</strong>");
		} else {
			// 등록이 되어있는경우
			out.print("<strong style='color :red'>이미 사용중인 아이디입니다.</strong>");
		}

	}	
	
	@RequestMapping(value = "/Modify", method = RequestMethod.GET)
	public String modify_form() {
		return "Customer/Modify";
	}

	@RequestMapping(value = "/Modify", method = RequestMethod.POST)
	public ModelAndView modify(CustomerVO vo, ModelAndView mav, HttpServletRequest req, HttpServletResponse response)
			throws IOException {
		System.out.println("수정기능");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		vo.setC_Password(Encrypt.encrypt(vo.getC_Password()));
		System.out.println((String) req.getParameter("c_Password"));
		System.out.println((String) req.getParameter("c_Password_confirm"));
		if ((String) req.getParameter("c_Password") == "") {
			out.println("<script>alert('비밀번호를 입력해주세요.'); history.go(-1);</script>");
			out.flush();
			mav.setViewName("Customer/Modify");
			return mav;
		} else if (req.getParameter("c_Password").equals(req.getParameter("c_Password_confirm")) != true) {
			out.println("<script>alert('비밀번호와 비밀번호 확인을 같게해주세요.'); history.go(-1);</script>");
			out.flush();
			mav.setViewName("Customer/Modify");
			return mav;
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

		out.println("<script>alert('수정완료.'); history.go(-1);</script>");
		out.flush();
		mav.setViewName("Customer/Modify");
		return mav;

	}

	@RequestMapping(value = "/Delete", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView delete(CustomerVO vo, ModelAndView mav, HttpSession session, HttpServletResponse response)
			throws IOException {
		vo = (CustomerVO) session.getAttribute("loginCustomer");
		System.out.println("삭제기능");
		System.out.println(vo);
		customerService.deleteCustomer(vo);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('삭제완료.'); location.href='/project';</script>");
		out.flush();
		session.invalidate();
		mav.setViewName("index");
		return mav;

	}

	@RequestMapping(value = "/OrderHistory", method = RequestMethod.GET)
	public String myOrder(HttpSession session) {
		if (session.getAttribute("loginCustomer") == null) {
			return "redirect:/Customer/login_form";
		} else {
			return "Customer/OrderHistory";
		}

	}
	
	@RequestMapping(value = "/ReviewPopup", method=RequestMethod.GET)
	public String reviewpopup(HttpSession session) {
	return "Customer/ReviewPopup";
	}
	
	@RequestMapping(value = "/ReviewModify", method=RequestMethod.GET)
	public String reviewmodify(HttpSession session) {
	return "Customer/ReviewModify";
	}
	 
	
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPageMain(HttpSession session) {
		if (session.getAttribute("loginCustomer") == null) {
			return "redirect:/Customer/login_form";
		} else {
			return "Customer/Mypage";
		}
	}
	@RequestMapping(value="/checkBrandInfo", method = RequestMethod.POST)
	public void brandInfoCheck(HttpServletRequest req,HttpServletResponse resp) throws Exception {
		//JSON stringfy된 데이터를 JSONObject로 변환(JSONParser 사용)
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject =(JSONObject)jsonParser.parse(req.getParameter("jsonInfo"));
		String bName = (String)jsonObject.get("bName");
		String bNumber =(String)jsonObject.get("bNumber");
		PrintWriter out = resp.getWriter();
		//중복체크처리
		//브랜드네임만 있을수도, 사업자번호만 있을수도 있기 때문에 리스트를 가져와서 비교한다.
		ArrayList<BrandDBVO> brandList = (ArrayList<BrandDBVO>)brandDBService.getBrandList();
		if(brandList!=null) {
		for(int i=0;i<brandList.size();i++) {
			if(brandList.get(i).getBrandName().equals(bName)&&brandList.get(i).getBusinessNumber().equals(bNumber)) {
				out.print("<strong style='color :red'>이미 등록된 업체입니다.</strong>");
				break;
			}else if(brandList.get(i).getBrandName().equals(bName)) {
				out.print("<strong style='color :red'>이미 등록된 브랜드명입니다. 다른 이름을 사용해주세요</strong>");
				break;
			}else if(brandList.get(i).getBusinessNumber().equals(bNumber)) {
				out.print("<strong style='color :red'>이미 등록된 사업자번호입니다.</strong>");
				break;
			}else if(i==brandList.size()-1){
				out.print("<strong style='color :green'>등록 가능한 브랜드입니다.</strong>");
			}
		}//for
		}//if
		else {
			//brandDB에 아무것도 등록되어있지 않을때
			out.print("<strong style='color :green'>등록 가능한 브랜드입니다.</strong>");
			 
		}
	}
	
	@RequestMapping(value = "/OrderForm", method=RequestMethod.GET)
	public String orderForm(HttpSession session) {
	return "Customer/OrderForm";
	}
	
	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public String myCartList(HttpSession session) {
		if (session.getAttribute("loginCustomer") == null) {
			return "redirect:/Customer/login_form";
		} else {
			return "Customer/cart";
		}
	}
	@RequestMapping(value="/findID", method=RequestMethod.GET)
	public String findIDForm(HttpSession session) {
		System.out.println("컨트롤러 : 아이디찾기페이지로 연결");
			
		return "Customer/findId";
	}
	@RequestMapping(value="/findID", method=RequestMethod.POST)
	public void findID(HttpSession session,HttpServletRequest req,HttpServletResponse resp) throws MessagingException, IOException, ParseException {
		System.out.println("컨트롤러 아이디 찾기 요청");
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject =(JSONObject)jsonParser.parse(req.getParameter("data"));
		
		System.out.println("제이슨Object : "+jsonObject);
		PrintWriter out = resp.getWriter();
		String name =jsonObject.get("NAME").toString();
		String email = jsonObject.get("EMAIL").toString();
		System.out.println("요청 이름 : "+name +", 요청 이메일 : "+email);
		CustomerVO vo = new CustomerVO();
		vo.setC_Name(name);
		vo.setC_Email(email);
		CustomerVO customer = customerService.getCustomerByNameAndEmail(vo);
		System.out.println("custoemr : "+customer);
		if(customer.getC_Id()!=null) {
			//이름과 이메일로 아이디를 가져올 수 있는경우(등록은 되어있음)
			String customerId = customer.getC_Id();
			//이메일로 customerId를 보내주기
			Email.sendFindIdResult(customer.getC_Id(), customer.getC_Email());
			
			out.print("요청하신 아이디를 이메일로 발송했습니다.");
		}else {
			//가입 정보를 찾을 수 없습니다. 
			//Ajax로 정보 표시해주기
			out.print("입력하신 정보로 가입된 아이디가 없습니다.");
		}
			
	}
	
	@RequestMapping(value="/findPWD", method=RequestMethod.GET)
	public String findPWD(HttpSession session) {
		System.out.println("컨트롤러 : 비밀번호 찾기 페이지로 연결");
		return "Customer/findPasswd";
	}
	
	@RequestMapping(value="/findPWD", method=RequestMethod.POST)
	public void findPWD(HttpSession session,HttpServletRequest req,HttpServletResponse resp) throws MessagingException, IOException, ParseException {
		System.out.println("컨트롤러 비밀번호 찾기 요청");
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject =(JSONObject)jsonParser.parse(req.getParameter("data"));
		
		System.out.println("제이슨Object : "+jsonObject);
		PrintWriter out = resp.getWriter();
		String ID = jsonObject.get("ID").toString();
		String name =jsonObject.get("NAME").toString();
		String email = jsonObject.get("EMAIL").toString();
		System.out.println("요청 아이디 : "+ID+", 요청 이름 : "+name +", 요청 이메일 : "+email);
		CustomerVO vo = new CustomerVO();
		vo.setC_Id(ID);
		vo.setC_Name(name);
		vo.setC_Email(email);
		CustomerVO customer = customerService.getCustomerByIdAndNameAndEmail(vo);
		System.out.println("custoemr : "+customer);
		//등록이 되있는경우
		//비밀번호 재설정을 위한 인증번호 발송
		//인증번호를 입력하면 비밀번호 재설정 페이지로 이동
		if(customer.getC_Password()!=null) {
			//이름과 이메일로 아이디를 가져올 수 있는경우(등록은 되어있음)
			String customerId = customer.getC_Id();
			//이메일로 임시 비밀번호 보내주기
			String tempPWD = TempPWD.randomPw();
			System.out.println("생성된 임시 비밀번호 : "+tempPWD);
			Email.sendTempPWD(customer.getC_Id(), customer.getC_Email(),tempPWD);
			vo.setC_Password(Encrypt.encrypt(tempPWD));
			customerService.changePassword(vo);
			out.print("등록된 이메일로 임시 비밀번호를 발송했습니다.");
		}else {
			//가입 정보를 찾을 수 없습니다. 
			//Ajax로 정보 표시해주기
			out.print("입력하신 정보로 가입된 아이디가 없습니다.");
		}
			
	}
	
	@RequestMapping(value = "/Mobile", method = RequestMethod.GET)
	public String mobileLanding() {
		return "Customer/Mobile";
	}
	
	@RequestMapping(value="save", method = RequestMethod.POST)
	public ModelAndView reviewSave(HttpSession session, HttpServletRequest req, ModelAndView mav, HttpServletResponse response) throws IOException {
		String p_Id = req.getParameter("p_Id");
		String pp_Id = p_Id.substring(0,8);
		ProductParentVO ppvo = productParentService.selectParentProduct(pp_Id);
		int brandId = ppvo.getPp_Brand();
		String pp_Name = ppvo.getPp_Name();
		String r_Coment = req.getParameter("r_Coment");
		CustomerVO cvo = (CustomerVO)session.getAttribute("loginCustomer");
		String r_Writer = cvo.getC_Id();
		String r_Title = req.getParameter("r_Title");
		ReviewVO rvo = new ReviewVO();
		rvo.setBrandId(brandId);
		rvo.setP_Id(p_Id);
		rvo.setPp_Name(pp_Name);
		rvo.setParent_p_Id(pp_Id);
		rvo.setR_Coment(r_Coment);
		rvo.setR_Writer(r_Writer);
		rvo.setR_Title(r_Title);
		reviewService.writeReview(rvo);
		mav = new ModelAndView ("/Customer/OrderHistory");
		String ss = "ok";
		mav.addObject("ok", ss);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('리뷰등록 완료');</script>");
		out.flush();
		return mav;
	}
	
}