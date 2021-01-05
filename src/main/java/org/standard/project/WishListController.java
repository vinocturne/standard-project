package org.standard.project;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.standard.project.customer.CustomerService;
import org.standard.project.customer.CustomerVO;
import org.standard.project.order.OrderHistoryService;
import org.standard.project.order.OrderHistoryVO;
import org.standard.project.product.ProductChildService;
import org.standard.project.wishList.WishListProductVO;
import org.standard.project.wishList.WishListService;
import org.standard.project.wishList.WishListVO;

@Controller
@RequestMapping(value = "/wishList")
public class WishListController {
	@Resource(name = "WishListService")
	WishListService wishListService;
	@Resource(name="OrderHistoryService")
	OrderHistoryService orderHistoryService;
	@Resource(name="ProductChildService")
	ProductChildService productChildService;
	
	@RequestMapping(value="addWishList")
	public String addWishList(HttpSession session,HttpServletRequest req,WishListVO vo) {
		//아작스로 요청할 주소임으로 리턴페이지 없음.
		CustomerVO customer = (CustomerVO) session.getAttribute("loginCustomer");
		
		//커맨드 객체로 받을지? 아작스 코드 작성하면서 
		System.out.println("장바구니에 담기");
		//필요정보 c_Id, p_Id,p_Price, w_Quantity
		vo.setC_Id(customer.getC_Id());
		System.out.println(vo);
		wishListService.addWishList(vo);
		return "redirect:/wishList/cart";
	}
	
	@RequestMapping(value ="purchase")
	public String purchase(HttpSession session,HttpServletRequest req)throws Exception {
		System.out.println("purchase 서버");
		System.out.println(req.getParameter("data"));
		JSONParser parser = new JSONParser(); 
		JSONArray arr = new JSONArray();
		arr=(JSONArray)parser.parse(req.getParameter("data")); 
		for(int i=0; i<arr.size(); i++) { 
			JSONObject object = (JSONObject)arr.get(i);
			System.out.println(object.toString()); 
			OrderHistoryVO vo = new OrderHistoryVO();
			vo.setC_Id((String) object.get("c_Id"));
			vo.setP_Id((String)object.get("p_Id"));

			vo.setO_BrandId(Integer.valueOf((String)object.get("p_Brand")));
			//날짜는 SQL로 처리
			//o_Num = 는 자동증가.
			vo.setO_Num(0);
			vo.setP_Price(Integer.valueOf((String)object.get("p_Price")));
			vo.setO_Quantity(Integer.valueOf((String)object.get("o_Quantity")));
			System.out.println("토탈 가격 : "+object.get("o_TotalPrice"));
			String totalPrice =object.get("o_TotalPrice").toString();
			vo.setO_TotalPrice(Integer.valueOf(totalPrice.trim()));
			vo.setO_Delivery("결제완료");
			System.out.println("zipcode:"+object.get("zipcode"));
			vo.setZipcode((String)object.get("zipcode"));
			vo.setO_Address1((String)object.get("o_Address1"));
			vo.setO_Address2((String)object.get("o_Address2"));
			vo.setO_Name((String)object.get("o_Name"));
			vo.setO_Phone1((String)object.get("o_Phone1"));
			vo.setO_Phone2((String)object.get("o_Phone2"));
			
			WishListVO wishListVO = new WishListVO();
			wishListVO.setC_Id((String) object.get("c_Id"));
			wishListVO.setP_Id((String)object.get("p_Id"));
			wishListVO.setW_Quantity(Integer.valueOf((String)object.get("o_Quantity")));
			//구매 내역에 추가, 재고 -1, 재고가 0이면 돌려보내기?
			//재고0이면 돌려보내고, 아니면 재고 감소후 결제되게하기.
			//p_Id, o_Quantity필요.(위의 wishListVO는 c_Id,p_Id만을 활용해서 장바구니에서 삭제해주는 역할이였으므로, 구매를 원하는 수량을 넣어서 구매했을때 재고를 감소하는데에도 활용한다.)
			//****만약에 재고가 없는경우??? 메세지를 어떻게 할까?
			//1.재고가 없으면 무시하고, 나머지 우선 결제되게하기.
			//=> 재고확인 먼저?
			int presentStack = productChildService.checkStack((String)object.get("p_Id"));
			if(presentStack>0&&presentStack>wishListVO.getW_Quantity()) {//재고 확인: 0보다 크고, 요청 수량보다 많은경우에 완료
				productChildService.purchase(wishListVO); //재고-1
				orderHistoryService.insertOrderHistory(vo);//구매내역에 입력
				wishListService.deleteWishList(wishListVO); //장바구니에서 삭제
			}

		} 
		return "index";
	}

	@RequestMapping(value = "/order")
	public ModelAndView orderForm(HttpSession session, HttpServletRequest req) throws Exception { // ,@RequestParam(value="chBox")
																									// String[][]
																									// cartlist
		System.out.println("wishList/order 요청. 장바구니에서 체크한 리스트 가져오기");
		ModelAndView mav = new ModelAndView("Customer/OrderForm");
		System.out.println(req.getAttribute("data"));
		
		  JSONParser parser = new JSONParser(); 
		  JSONArray arr = new JSONArray();
		  arr=(JSONArray)parser.parse(req.getParameter("data")); 
		  for(int i=0; i<arr.size(); i++) { 
			  JSONObject object = (JSONObject)arr.get(i);
			  System.out.println("orderController 요청,카트에서 넘어온 데이터 : "+object.toString());
		  } 
		  mav.addObject("cartList",req.getParameter("data"));
		  System.out.println(mav.getViewName());
		return mav;
		// orderForm에 기본으로 있어야할 목록 정보.
		// 1.고객정보(이미 세션에 저장되어있음) 제이슨으로 넘겨주기.
		// 2.장바구니로부터 받아온 p_Id, p_Price, o_Quantity,pp_Name,p_Color,p_Size,pp_thumb
		// 정보.(JSON으로 받아서 바로 제이슨으로 넘기기?)
		// 2번은 최종 주문 수량과 주문할 품목을 장바구니 페이지로부터 받아야하기때문에 디비에서 가져오지 않는다.
		// System.out.println("장바구니 체크리스트"+cartlist.toString());
	}

	@RequestMapping(value = "/cart")
	public ModelAndView myCart(HttpSession session) {
		System.out.println("wishList컨트롤러");
		if (session.getAttribute("loginCustomer") == null) {
			ModelAndView mav = new ModelAndView("redirect:/Customer/login_form");
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("Customer/cart");
			// 아이디에 맞는 wishListVO를 가져오기 위해 아이디를 받아온다.
			CustomerVO customer = (CustomerVO) session.getAttribute("loginCustomer");
			// 가져온 아이디로 wishListVO를 불러온 후 저장.
			ArrayList<WishListVO> wishListVOList = wishListService.getWishList(customer.getC_Id());
			// wishList가 null이 아니면 p_Id로 상품 정보를 받아온다
			// System.out.println("c_Id : " +customer.getC_Id());
			// System.out.println("wishListVOList : "+ wishListVOList);
			// mav.addObject("wishListVO", wishListVOList);
			session.setAttribute("wishListVO", wishListVOList);
			// private int w_Quantity, p_Price; private String c_Id, p_Id;
			if (wishListVOList != null) {
				// product에서 부모아이디, 아이디, 브랜드, 컬러, 사이즈, 재고를 받아온다

				// product에서 받아온 부모아이디로 부모아이디 테이블에서 썸네일 파일 경로를 받아온다.
				// 조인으로 합친다음에 받아오기 부모아이디(클릭하면 이동하기위해),p_Id,부모이름, 부모브랜드?, 컬러, 싸이즈,
				// 썸네일이미지(p.parent_p_Id, p.p_Id,pp_Name, p_Brand, p_Color,p_Size,pp_thumb)
				// SELECT p.parent_p_Id, p.p_Id,pp_Name, p_Brand, p_Color,p_Size,pp_thumb FROM
				// product p JOIN productparent pp ON p.parent_p_Id = pp.parent_p_Id WHERE
				// p_Id='00010001Black100';

				// ArrayList<wishListVO>에는 여러개의 행들이 존재한다. 이 행들의 p_Id의 각각에 정보를 받아와야한다.
				ArrayList<WishListProductVO> productInfoArr = new ArrayList<WishListProductVO>();
				for (int i = 0; i < wishListVOList.size(); i++) {
					WishListProductVO productVO = new WishListProductVO();
					productVO = wishListService.getProductInfo(wishListVOList.get(i).getP_Id());
					productInfoArr.add(productVO);
				}
				System.out.println("장바구니 컨트롤러 요청 , 모델에 저장될 정보 productInfoArr : " + productInfoArr);
				session.setAttribute("wishListProductVO", productInfoArr);
				// mav.addObject("wishListProductVO", productInfoArr);
				// private String p_Id, parent_p_Id, pp_Name,p_Color,p_Size,pp_thumb; private
				// int p_Stack,p_Price;

				return mav;
			} else {
				return mav;
			}

		}
	}

}
