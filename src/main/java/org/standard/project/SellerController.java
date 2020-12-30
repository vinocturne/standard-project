package org.standard.project;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.standard.project.brand.BrandDBService;
import org.standard.project.brand.BrandDBVO;
import org.standard.project.common.UploadUtil;
import org.standard.project.customer.CustomerService;
import org.standard.project.customer.CustomerVO;
import org.standard.project.magazine.MagazineVO;
import org.standard.project.order.OrderHistoryVO;
import org.standard.project.product.ProductParentService;
import org.standard.project.product.ProductParentVO;

@Controller
@RequestMapping(value = "/Seller")
public class SellerController {
	@Resource(name = "ProductParentService")
	ProductParentService productParentService;
	@Resource(name = "CustomerService")
	CustomerService customerService;
	@Resource(name = "BrandDBService")
	BrandDBService brandDBService;
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "/ProductManage", method = RequestMethod.GET)
	public ModelAndView productManage(HttpSession session, ModelAndView mav, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		session.removeAttribute("productParentList");
		System.out.println(session.getAttribute("productParentList"));
		System.out.println("productParentList 보기");
		//로그인후에 세션에 저장된 사용자 객체를 활용.
		CustomerVO customerVO = (CustomerVO)session.getAttribute("loginCustomer");
		if(customerVO == null) {
			out.println("<script>alert('로그인해주세요.');</script>");
			out.flush();
			mav.setViewName("Customer/login_form");
			return mav;
		}else if (customerVO.getBrandName() ==null) {
			out.println("<script>alert('기업회원으로 가입해주세요.');</script>");
			out.flush();
			mav.setViewName("Customer/login_form");
			return mav;
		}
		
		BrandDBVO loginBrand = brandDBService.getBrandId(customerVO);
		System.out.println(loginBrand);
		
		ArrayList<ProductParentVO> listProductParent = new ArrayList<ProductParentVO>();
		listProductParent = productParentService.listProductParent(loginBrand);
		System.out.println(listProductParent);
		
		mav = new ModelAndView ("/Seller/ProductManage");
		mav.addObject("list", listProductParent);
		return mav;
	}
	
	
	
	@RequestMapping(value = "/ProductAddParent", method = RequestMethod.GET)
	public ModelAndView AddParent(Map<String, Object> map, CustomerVO vo) {
		System.out.println("부모 상품 추가");
		ModelAndView mav = new ModelAndView ("/Seller/ProductAddParent");
		return mav;
	}
	
	@RequestMapping(value = "/ProductAddParent", method = RequestMethod.POST)
	public String magazineWriteAction(HttpServletRequest req, MultipartHttpServletRequest mhsq, HttpServletResponse response) throws Exception {
		System.out.println("상품 입력 액션");
		ProductParentVO vo = new ProductParentVO();

		String pp_Name = req.getParameter("pp_Name");
		String parent_p_Id = req.getParameter("parent_p_Id");
		String pp_Category1 = req.getParameter("pp_Category1");
		String pp_Category2 = req.getParameter("pp_Category2");
		vo.setPp_Name(pp_Name);
		vo.setParent_p_Id(parent_p_Id);;
		vo.setPp_Category1(pp_Category1);;
		vo.setPp_Category2(pp_Category2);;
		System.out.println(vo);
		String imgUploadPath = uploadPath+ File.separator + "productImage" ;
		String fileName = null;
		
		List<MultipartFile> mf = mhsq.getFiles("m_Img");
		
		if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('꼭 이미지를 넣어주세요'); history.go(-1);</script>");
			out.flush();
        } else {
            for (int i = 0; i < mf.size(); i++) {
                if(i==0) {
                	String ymdPath = UploadUtil.calcPath(imgUploadPath);
        			fileName = UploadUtil.fileUpload(imgUploadPath, mf.get(i).getOriginalFilename(), mf.get(i).getBytes(), ymdPath);
        			vo.setPp_thumb(File.separator + "productImage" + ymdPath + File.separator + fileName);
                }else if(i==1) {
                	String ymdPath = UploadUtil.calcPath(imgUploadPath);
        			fileName = UploadUtil.fileUpload(imgUploadPath, mf.get(i).getOriginalFilename(), mf.get(i).getBytes(), ymdPath);
        			vo.setPp_image(File.separator + "productImage" + ymdPath + File.separator+ "long" +File.separator + "long_"+ fileName);
                }
            }
        }

		int pp_Brand = Integer.parseInt(req.getParameter("pp_Brand"));
		int pp_Price = Integer.parseInt(req.getParameter("pp_Price"));
		
		vo.setPp_Brand(pp_Brand);
		vo.setPp_Price(pp_Price);
		System.out.println(vo);
		
		productParentService.registProductParent(vo);

		return "redirect:/Seller/ProductAddParent";
	}
	
	@RequestMapping(value = "/BuyList", method = RequestMethod.GET)
	public ModelAndView deliveryManage(HttpSession session, ModelAndView mav, HttpServletResponse response) throws IOException {
		mav = new ModelAndView ("/Seller/BuyList");
		return mav;
	}

	@RequestMapping(value = "/Review", method = RequestMethod.GET)
	public ModelAndView sellerReview(HttpSession session, ModelAndView mav, HttpServletResponse response) throws IOException {
		
		mav = new ModelAndView ("/Seller/Review");
		return mav;
	}
	
}
