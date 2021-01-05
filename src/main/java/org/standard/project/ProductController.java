package org.standard.project;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.standard.project.customer.CustomerVO;
import org.standard.project.product.ProductChildService;
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
		System.out.println(pp_Id);
		if(pp_Id == "" || pp_Id == null) {
			pp_Id = (String) session.getAttribute("productParent_session");
		} 
		ProductParentVO parentVO = productParentService.selectParentProduct(pp_Id);
//		List<ProductChildVO> childVO = productChildService.listProductChild(pp_Id);
		List<String> optionColor = productChildService.optionColor(pp_Id);
		List<String> optionSize = productChildService.optionSize(pp_Id);
		System.out.println("옵션 컬러 >>>>"+optionColor);
		////
		//pp_Id를 받아서 리스트 
		System.out.println("리스트 나온다");
		ArrayList<ReviewVO> reviewList = new ArrayList<ReviewVO>();
		reviewList = reviewService.listProductReview(pp_Id);
		///
		
		mav = new ModelAndView("/Store/StoreDetail");
		mav.addObject("p_VO", parentVO);
		mav.addObject("optionColor", optionColor);
		mav.addObject("optionSize", optionSize);
		mav.addObject("reviewList", reviewList);
		
		System.out.println(parentVO);
		System.out.println(optionColor);
		
		return mav;
	}
	
	
	  
	  @RequestMapping(value="/StoreWomenMain", method = RequestMethod.GET)
		public ModelAndView StoreWomenMain(ModelAndView mav, HttpServletRequest req) {
		  String gender = "woman";
		  String category = req.getParameter("category");
		  ProductParentVO ppVO = new ProductParentVO();
		  
			if(req.getParameter("category")==null) {
				List<ProductParentVO> showWomanProductList = productParentService.showWomanProductList();
				mav = new ModelAndView ("/Store/StoreWomenMain");
				mav.addObject("list", showWomanProductList);
			}
			else {
				ppVO.setPp_Category1(gender);
				ppVO.setPp_Category2(category);
				List<ProductParentVO> showCategoryList = productParentService.showCategoryList(ppVO);
				mav = new ModelAndView ("/Store/StoreWomenMain");
				mav.addObject("list", showCategoryList);
			}
			return mav;
		}
	
	  @RequestMapping(value="/StoreManMain", method = RequestMethod.GET)
	  public ModelAndView StoreManMain(ModelAndView mav, HttpServletRequest req) {
		  String gender = "man";
		  String category = req.getParameter("category");
		  ProductParentVO ppVO = new ProductParentVO();
		  if(req.getParameter("category")==null) {
			  List<ProductParentVO> showManProductList = productParentService.showManProductList();
			  mav = new ModelAndView ("/Store/StoreManMain");
			  mav.addObject("list", showManProductList);
		  }else {
			  ppVO.setPp_Category1(gender);
			  ppVO.setPp_Category2(category);
			  List<ProductParentVO> showCategoryList = productParentService.showCategoryList(ppVO);
			  mav = new ModelAndView ("/Store/StoreManMain");
			  mav.addObject("list", showCategoryList);
		  } 
		  return mav;
	  }
	  
	  @RequestMapping(value = "/WriteReview", method = RequestMethod.POST)
		public ModelAndView writeReview(HttpSession session, HttpServletRequest req, HttpServletResponse response, ModelAndView mav) throws Exception {
			System.out.println("리뷰작성한것, 저장");
			ReviewVO vo = new ReviewVO();
			CustomerVO customerVO = (CustomerVO) session.getAttribute("loginCustomer");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			String parent_p_Id = req.getParameter("parent_p_Id");
			String brandId = req.getParameter("brandId");
			String pp_Name = req.getParameter("pp_Name");
			String r_Title = req.getParameter("r_Title");
			String r_Coment = req.getParameter("r_Coment");
			
			int brandIntId = Integer.parseInt(brandId);
			vo.setP_Id("0001001white100");
			vo.setParent_p_Id(parent_p_Id);
			vo.setBrandId(brandIntId);
			vo.setPp_Name(pp_Name);
			vo.setR_Title(r_Title);
			vo.setR_Coment(r_Coment);
			vo.setR_Writer(customerVO.getC_Id());
			
			reviewService.writeReview(vo);
			mav.setViewName("redirect:/shop/product");
			return mav;
		}
}
