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
	
	@RequestMapping(value="/shopList", method = RequestMethod.GET)
	public ModelAndView shopMain(ModelAndView mav) {
		List<ProductParentVO> allProductList = productParentService.allProductList();
			
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
	
	
	
	  @RequestMapping(value="/DamStoreMain") 
	  	public String shopMain() { 
		  
		  
		  return "Store/DamStoreMain"; 
		  
	  }
	 
	
}
