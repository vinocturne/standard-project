package org.standard.project;

import java.io.PrintWriter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.standard.project.customer.CustomerVO;
import org.standard.project.order.OrderHistoryService;
import org.standard.project.order.OrderHistoryVO;
import org.standard.project.product.ProductChildService;
import org.standard.project.product.ProductChildVO;
import org.standard.project.product.ProductParentService;
import org.standard.project.product.ProductParentVO;
import org.standard.project.review.ReviewService;
import org.standard.project.review.ReviewVO;

@Controller
@RequestMapping(value = "/shop")
public class ProductController {
	@Resource(name = "ProductParentService")
	ProductParentService productParentService;
	
	@Resource(name = "ProductChildService")
	ProductChildService productChildService;
	
	@Resource(name = "OrderHistoryService")
	OrderHistoryService orderHistoryService;
	
	@Resource(name = "ReviewService")
	ReviewService reviewService;
	
	//	남자, 여자 전체 상품 보여주는 매퍼 추가.
	// 남자의 경우 productParentService.showManProductList();를 리스트로 받아오면 되고
	// 여자의 경우 productParentService.showWomanProductList();로 설정하면 됩니다.
	
	
	@RequestMapping(value="/shopList", method = RequestMethod.GET)
	public ModelAndView shopMain(ModelAndView mav) {
		List<ProductParentVO> allProductList = productParentService.showManProductList();
			
		mav = new ModelAndView ("/Store/StoreWomenMain");
		mav.addObject("list", allProductList);
		return mav;
	}

	@RequestMapping(value="/product", method = RequestMethod.GET)
	public ModelAndView productDetail(ModelAndView mav, HttpServletRequest req, HttpSession session) {
		String pp_Id = req.getParameter("p_id");
		if(pp_Id == "" || pp_Id == null) {
			pp_Id = (String) session.getAttribute("productParent_session");
		} 
		session.setAttribute("productParent_session", pp_Id);
		ProductParentVO parentVO = productParentService.selectParentProduct(pp_Id);
//		List<ProductChildVO> childVO = productChildService.listProductChild(pp_Id);
		List<String> optionColor = productChildService.optionColor(pp_Id);
		List<String> optionSize = productChildService.optionSize(pp_Id);
		List<ProductChildVO> productVO = productChildService.selectProductDetail(pp_Id);
		List<Map<String, Integer>> stockList = new ArrayList<Map<String,Integer>>(); 
		Map<String, Integer> stockMap = new HashMap<String, Integer>();
		ArrayList<ReviewVO> reviewList = new ArrayList<ReviewVO>();
		reviewList = reviewService.listProductReview(pp_Id);
		
		for(int i=0; i<productVO.size(); i++) {
			String p_Id = productVO.get(i).getP_Id();
			int p_Stock = productVO.get(i).getP_Stack();
			stockMap.put(p_Id, p_Stock);
//			stockList.set(0, stockMap)
		}
		
		System.out.println(stockMap);
		
		mav = new ModelAndView("/Store/StoreDetail");
		mav.addObject("p_VO", parentVO);
		mav.addObject("stockCheck", stockMap);
		mav.addObject("optionColor", optionColor);
		mav.addObject("optionSize", optionSize);
		System.out.println("/product 컨트롤러에서 저장해주는 optionSize : " + optionSize);
		System.out.println("optionSize 배열 1번째"+optionSize.get(0));
		mav.addObject("reviewList", reviewList);
		
		
		return mav;
	}
	
	
	  
	  @RequestMapping(value="/StoreWomenMain", method = RequestMethod.GET)
		public ModelAndView StoreWomenMain(ModelAndView mav, HttpServletRequest req) {
		  String gender = "woman";
		  String category = req.getParameter("category");
		  ProductParentVO ppVO = new ProductParentVO();
		  String pp_Name = req.getParameter("s_pp_Name");
			if(req.getParameter("category")==null||req.getParameter("category")=="") {
				List<ProductParentVO> showWomanProductList = new ArrayList<ProductParentVO>();
				if(pp_Name ==""||pp_Name==null) {
					showWomanProductList = productParentService.showWomanProductList();
				}else {
					showWomanProductList = productParentService.searchWomanProductList(pp_Name); //구축
				}
				mav = new ModelAndView ("/Store/StoreWomenMain");
				mav.addObject("search", pp_Name);
				mav.addObject("list", showWomanProductList);
			}
			else {
				ppVO.setPp_Category1(gender);
				ppVO.setPp_Category2(category);
				
				List<ProductParentVO> showCategoryList = new ArrayList<ProductParentVO>();
				  if(pp_Name ==""||pp_Name==null) {
					  showCategoryList = productParentService.showCategoryList(ppVO);
				  }else {
					  ppVO.setPp_Name(pp_Name);
					  System.out.println(ppVO);
					  showCategoryList = productParentService.showSearchCategoryList(ppVO);
					  System.out.println(showCategoryList);
				  }
				
				mav = new ModelAndView ("/Store/StoreWomenMain");
				mav.addObject("list", showCategoryList);
				mav.addObject("category", category);
			}
			return mav;
		}
	
	  @RequestMapping(value="/StoreManMain", method = RequestMethod.GET)
	  public ModelAndView StoreManMain(ModelAndView mav, HttpServletRequest req) {
		  String gender = "man";
		  String category = req.getParameter("category");
		  ProductParentVO ppVO = new ProductParentVO();
		  String pp_Name = req.getParameter("s_pp_Name");
		  if(req.getParameter("category")==null||req.getParameter("category")=="") {
			  
			  List<ProductParentVO> showManProductList = new ArrayList<ProductParentVO>();
				if(pp_Name ==""||pp_Name==null) {
					showManProductList = productParentService.showManProductList();
				}else {
					showManProductList = productParentService.searchManProductList(pp_Name); //구축
				}
			  mav = new ModelAndView ("/Store/StoreManMain");
			  mav.addObject("search", pp_Name);
			  mav.addObject("list", showManProductList);
		  }else {
			  ppVO.setPp_Category1(gender);
			  ppVO.setPp_Category2(category);
			  List<ProductParentVO> showCategoryList = new ArrayList<ProductParentVO>();
			  if(pp_Name ==""||pp_Name==null) {
				  showCategoryList = productParentService.showCategoryList(ppVO);
			  }else {
				  ppVO.setPp_Name(pp_Name);
				  showCategoryList = productParentService.showSearchCategoryList(ppVO);
			  }
			  mav = new ModelAndView ("/Store/StoreManMain");
			  mav.addObject("list", showCategoryList);
			  mav.addObject("category", category);
		  } 
		  return mav;
	  }
	  
	  @RequestMapping(value = "/WriteReview", method = RequestMethod.POST)
		public ModelAndView writeReview(HttpSession session, HttpServletRequest req, HttpServletResponse response, ModelAndView mav) throws Exception {
			System.out.println("리뷰작성한것, 저장");
			ReviewVO vo = new ReviewVO();
			OrderHistoryVO orderVO = new OrderHistoryVO();
			ProductChildVO product = new ProductChildVO();
			ArrayList<OrderHistoryVO> orVO = new ArrayList<OrderHistoryVO>();
			CustomerVO customerVO = (CustomerVO) session.getAttribute("loginCustomer");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			try{
				vo.setR_Writer(customerVO.getC_Id());
				String pp_Id = (String) session.getAttribute("productParent_session");
				orderVO.setParent_p_Id(pp_Id);
				orderVO.setC_Id(customerVO.getC_Id());
			}catch (NullPointerException e){
				out.println("<script>alert('로그인해주세요.'); history.go(-1);</script>");
				out.flush();
			}
			try{
				orVO = orderHistoryService.cusOrder(orderVO);
			}catch (NullPointerException e) {
				out.println("<script>alert('구매자만 작성할 수 있습니다.'); history.go(-1);</script>");
				out.flush();
			}
			try {
				product.setP_Id(orVO.get(0).getP_Id());
			}catch(IndexOutOfBoundsException e) {
				out.println("<script>alert('구매자만 작성할 수 있습니다.'); history.go(-1);</script>");
				out.flush();
			}
			
			product.setP_Id(orVO.get(0).getP_Id());
			vo.setP_Id(product.getP_Id());
			System.out.println(vo);
			String parent_p_Id = req.getParameter("parent_p_Id");
			String brandId = req.getParameter("brandId");
			String pp_Name = req.getParameter("pp_Name");
			String r_Title = req.getParameter("r_Title");
			String r_Coment = req.getParameter("r_Coment");
			int brandIntId = Integer.parseInt(brandId);
			
			vo.setParent_p_Id(parent_p_Id);
			vo.setBrandId(brandIntId);
			vo.setPp_Name(pp_Name);
			vo.setR_Title(r_Title);
			vo.setR_Coment(r_Coment);
			System.out.println(vo);
			reviewService.writeReview(vo);
			mav.setViewName("redirect:/shop/product");
			return mav;
		}
}
