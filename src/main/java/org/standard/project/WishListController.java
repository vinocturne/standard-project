package org.standard.project;

import java.util.ArrayList;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.standard.project.customer.CustomerService;
import org.standard.project.customer.CustomerVO;
import org.standard.project.wishList.WishListProductVO;
import org.standard.project.wishList.WishListService;
import org.standard.project.wishList.WishListVO;

@Controller
@RequestMapping(value="/WishList")
public class WishListController {
	@Resource(name = "WishListService")
	WishListService wishListService;
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public ModelAndView myCart(HttpSession session) {
		System.out.println("wishList컨트롤러");
		if (session.getAttribute("loginCustomer") == null) {
			ModelAndView mav = new ModelAndView("redirect:/Customer/login_form");
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("Customer/cart");
			//아이디에 맞는 wishListVO를 가져오기 위해 아이디를 받아온다.
			CustomerVO customer =(CustomerVO) session.getAttribute("loginCustomer");
			//가져온 아이디로 wishListVO를 불러온 후 저장.
			ArrayList<WishListVO> wishListVOList =wishListService.getWishList(customer.getC_Id());
			//wishList가 null이 아니면 p_Id로 상품 정보를 받아온다.
			if(wishListVOList!=null) {
				//product에서 부모아이디, 아이디, 브랜드, 컬러, 사이즈, 재고를 받아온다
				
				//product에서 받아온 부모아이디로 부모아이디 테이블에서 썸네일 파일 경로를 받아온다.
				//조인으로 합친다음에 받아오기 부모아이디(클릭하면 이동하기위해),p_Id,부모이름, 부모브랜드?, 컬러, 싸이즈, 썸네일이미지(p.parent_p_Id, p.p_Id,pp_Name, p_Brand, p_Color,p_Size,pp_thumb)
				//SELECT p.parent_p_Id, p.p_Id,pp_Name, p_Brand, p_Color,p_Size,pp_thumb FROM product p JOIN productparent pp ON p.parent_p_Id = pp.parent_p_Id WHERE p_Id='00010001Black100';
				
				//ArrayList<wishListVO>에는 여러개의 행들이 존재한다. 이 행들의 p_Id의 각각에 정보를 받아와야한다.
				ArrayList<WishListProductVO> productInfoArr = new ArrayList<WishListProductVO>();
				for(int i=0;i<wishListVOList.size();i++) {
					WishListProductVO productVO = new WishListProductVO();
					productVO = wishListService.getProductInfo(wishListVOList.get(i).getP_Id());
					productInfoArr.add(productVO);
					System.out.println(productInfoArr.get(i).toString());
				}
				
				mav.addObject("wishList", productInfoArr);
				return mav;
			}else {
				return mav;
			}
			
			
		}
	}

}
