package org.standard.project;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.standard.project.product.ProductParentService;
import org.standard.project.product.ProductParentVO;

@Controller
@RequestMapping(value = "/shop")
public class ProductController {
	@Resource(name = "ProductParentService")
	ProductParentService productParentService;
	
	@RequestMapping(value="/shopMain" )
	public ModelAndView shopMain(ModelAndView mav) {
		List<ProductParentVO> allProductList = productParentService.allProductList();
			
		mav = new ModelAndView ("/Store/StoreWomenMain");
		mav.addObject("list", allProductList);
		return mav;
	}

	
	
	/*
	 * @RequestMapping(value="/shopMain" ) public String shopMain() { return
	 * "Store/StoreMain"; }
	 */
	
}
