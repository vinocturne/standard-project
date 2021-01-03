package org.standard.project;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.standard.project.product.ProductChildService;
import org.standard.project.product.ProductChildVO;
import org.standard.project.product.ProductParentService;
import org.standard.project.product.ProductParentVO;

@Controller
@RequestMapping(value = "/shop")
public class ProductController {
	@Resource(name = "ProductParentService")
	ProductParentService productParentService;
	
	@Resource(name = "ProductChildService")
	ProductChildService productChildService;
	
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
	public ModelAndView productDetail(ModelAndView mav, HttpServletRequest req) {
		String pp_Id = req.getParameter("p_id");
		System.out.println(pp_Id);
		
		ProductParentVO parentVO = productParentService.selectParentProduct(pp_Id);
		List<ProductChildVO> childVO = productChildService.listProductChild(pp_Id);
		
		mav = new ModelAndView("/Store/StoreDetail");
		mav.addObject("p_VO", parentVO);
		mav.addObject("c_VO", childVO);
		
		System.out.println(parentVO);
		System.out.println(childVO);
		
		return mav;
	}
	
	
	  
	  @RequestMapping(value="/StoreWomenMain", method = RequestMethod.GET)
		public ModelAndView StoreWomenMain(ModelAndView mav) {
			List<ProductParentVO> allProductList = productParentService.showWomanProductList();
				
			mav = new ModelAndView ("/Store/StoreWomenMain");
			mav.addObject("list", allProductList);
			return mav;
		}
	
	  @RequestMapping(value="/StoreManMain", method = RequestMethod.GET)
	  public ModelAndView StoreManMain(ModelAndView mav) {
		  List<ProductParentVO> allProductList = productParentService.showManProductList();
		  
		  mav = new ModelAndView ("/Store/StoreManMain");
		  mav.addObject("list", allProductList);
		  return mav;
	  }
	  
}
