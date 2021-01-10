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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.standard.project.brand.BrandDBService;
import org.standard.project.brand.BrandDBVO;
import org.standard.project.common.DeleteUtil;
import org.standard.project.common.UploadUtil;
import org.standard.project.common.UploadUtilProductLong;
import org.standard.project.common.UploadUtilProductThumb;
import org.standard.project.customer.CustomerService;
import org.standard.project.customer.CustomerVO;
import org.standard.project.magazine.MagazineVO;
import org.standard.project.order.OrderHistoryService;
import org.standard.project.order.OrderHistoryVO;
import org.standard.project.product.ProductChildService;
import org.standard.project.product.ProductChildVO;
import org.standard.project.product.ProductParentService;
import org.standard.project.product.ProductParentVO;
import org.standard.project.review.ReviewService;
import org.standard.project.review.ReviewVO;

@Controller
@RequestMapping(value = "/Seller")
public class SellerController {
	@Resource(name = "ProductParentService")
	ProductParentService productParentService;
	@Resource(name = "CustomerService")
	CustomerService customerService;
	@Resource(name = "BrandDBService")
	BrandDBService brandDBService;
	@Resource(name = "ProductChildService")
	ProductChildService productChildService;
	@Resource(name = "OrderHistoryService")
	OrderHistoryService orderHistoryService;
	@Resource(name = "ReviewService")
	ReviewService reviewService;
	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/ProductManage", method = RequestMethod.GET)
	public ModelAndView productManage(HttpSession session, ModelAndView mav, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		session.removeAttribute("productParentList");
		System.out.println(session.getAttribute("productParentList"));
		System.out.println("productParentList 보기");
		// 로그인후에 세션에 저장된 사용자 객체를 활용.
		CustomerVO customerVO = (CustomerVO) session.getAttribute("loginCustomer");
		if (customerVO == null) {
			out.println("<script>alert('로그인해주세요.');</script>");
			out.flush();
			mav.setViewName("Customer/login_form");
			return mav;
		} else if (customerVO.getBrandName() == null) {
			out.println("<script>alert('기업회원전용 기능입니다');</script>");
			out.flush();
			mav.setViewName("index");
			return mav;
		}

		BrandDBVO loginBrand = brandDBService.getBrandId(customerVO);
//		System.out.println(loginBrand);

		ArrayList<ProductParentVO> listProductParent = new ArrayList<ProductParentVO>();
		listProductParent = productParentService.listProductParent(loginBrand);
		System.out.println(listProductParent);

		mav = new ModelAndView("/Seller/ProductManage");
		mav.addObject("list", listProductParent);
		return mav;
	}

	@RequestMapping(value = "/ProductAddParent", method = RequestMethod.GET)
	public ModelAndView addParent(Map<String, Object> map, CustomerVO vo) {
		System.out.println("부모 상품 추가");
		ModelAndView mav = new ModelAndView("/Seller/ProductAddParent");
		return mav;
	}

	@RequestMapping(value = "/ProductAddParent", method = RequestMethod.POST)
	public ModelAndView addParentAction(HttpSession session, HttpServletRequest req, MultipartHttpServletRequest mhsq,
			HttpServletResponse response, ModelAndView mav) throws Exception {
		System.out.println("상품 입력 액션");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		ProductParentVO vo = new ProductParentVO();
		
		String pp_Name = req.getParameter("pp_Name");

//		이것을 어떻게 가져올까,, 아이디 값 가져와서 0001만들어주고 
		CustomerVO customerVO = (CustomerVO) session.getAttribute("loginCustomer");
		BrandDBVO loginBrand = brandDBService.getBrandId(customerVO);
		System.out.println(loginBrand);

		int int_first_parent_p_Id = loginBrand.getBrandId();
		String string_first_parent_p_Id = String.format("%04d", int_first_parent_p_Id);
		int int_second_parent_p_Id = productParentService.cntBrandProductParent(loginBrand);
		System.out.println(int_second_parent_p_Id);
		String string_second_parent_p_Id = String.format("%04d", int_second_parent_p_Id + 1);
		String parent_p_Id = string_first_parent_p_Id.concat(string_second_parent_p_Id);

		String pp_Category1 = req.getParameter("pp_Category1");
		String pp_Category2 = req.getParameter("pp_Category2");
		vo.setPp_Name(pp_Name);
		vo.setParent_p_Id(parent_p_Id);
		;
		vo.setPp_Category1(pp_Category1);
		;
		vo.setPp_Category2(pp_Category2);
		;
		
		try {
		int pp_Price = Integer.parseInt(req.getParameter("pp_Price"));
		vo.setPp_Price(pp_Price);
		} catch (NumberFormatException e) {
			out.println("<script>alert('가격에는 숫자를 넣어주세요'); history.go(-1);</script>");
			out.flush();
			mav.setViewName("Seller/ProductAddParent");
			return mav;
		}
		
		vo.setPp_Brand(loginBrand.getBrandId());
		System.out.println(vo);

		String imgUploadPath = uploadPath + File.separator + "productImage";
		String fileName = null;
		List<MultipartFile> mf = mhsq.getFiles("m_Img");

		if (mf.get(0).getOriginalFilename().equals("") || mf.get(1).getOriginalFilename().equals("")) {
			out.println("<script>alert('꼭 이미지를 넣어주세요'); history.go(-1);</script>");
			out.flush();
		} else {
			String ymdPath = UploadUtilProductThumb.calcPath(imgUploadPath);
			for (int i = 0; i < mf.size(); i++) {
				if (i == 0) {
					fileName = UploadUtilProductThumb.fileUpload(imgUploadPath, mf.get(i).getOriginalFilename(),
							mf.get(i).getBytes(), ymdPath);
					vo.setPp_thumb(File.separator + "productImage" + ymdPath + File.separator + fileName);
				} else if (i == 1) {
					fileName = UploadUtilProductLong.fileUpload(imgUploadPath, mf.get(i).getOriginalFilename(),
							mf.get(i).getBytes(), ymdPath);
					vo.setPp_image(File.separator + "productImage" + ymdPath + File.separator + fileName);
				}
			}
		}

		System.out.println(vo);

		productParentService.registProductParent(vo);
		mav.setViewName("redirect:/Seller/ProductManage");
		return mav;
	}

	@RequestMapping(value = "/DeleteParentProduct", method = RequestMethod.POST)
	public String deleteParentProduct(@RequestParam(value = "chBox[]") String[] parent_p_Id) throws Exception {
		// 체크한 상품 ID마다 반복해서 사용자 삭제
		System.out.println("선택한 상품 삭제 가동");
		for (String del_Id : parent_p_Id) {
			System.out.println("사용자 삭제 = " + del_Id);
			productParentService.deleteParentProduct(del_Id);
		}
		return "redirect:/Seller/ProductManage";
	}

	@RequestMapping(value = "/ModifyParentProduct", method = RequestMethod.GET)
	public ModelAndView selectParentProduct(HttpServletRequest req, HttpSession session) {
		System.out.println("선택한 부모상품 수정 가동");
		String parent_p_Id = req.getParameter("seq");
		ProductParentVO vo = new ProductParentVO();
		vo = productParentService.selectParentProduct(parent_p_Id);
		System.out.println(vo);
		ModelAndView mav = new ModelAndView("/Seller/ProductModify");
		mav.addObject("vo", vo);
		return mav;
	}

	@RequestMapping(value = "/ModifyParentProduct", method = RequestMethod.POST)
	public ModelAndView modifyParentProduct(HttpServletRequest req, MultipartHttpServletRequest images, HttpServletResponse response, ModelAndView mav, HttpSession session)
			throws IOException, Exception {
		ProductParentVO vo = new ProductParentVO();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		List<MultipartFile> mf = images.getFiles("m_Img");
		if (mf.get(0).getOriginalFilename() == "" && mf.get(1).getOriginalFilename() == "") {
			// 따로 이미지 수정을 하지 않았을 때 text만
			System.out.println("이미지 변경 없는 수정");
			vo.setParent_p_Id(req.getParameter("parent_p_Id"));
			vo.setPp_Name(req.getParameter("pp_Name"));
			vo.setPp_Category1(req.getParameter("pp_Category1"));
			vo.setPp_Category2(req.getParameter("pp_Category2"));
			try {
				int pp_Price = Integer.parseInt(req.getParameter("pp_Price"));
				vo.setPp_Price(pp_Price);
			} catch (NumberFormatException e) {
				out.println("<script>alert('가격에는 숫자를 넣어주세요');history.go(-1);</script>");
				out.flush();
			}
			System.out.println(vo);
			productParentService.modifyParentProductWithoutImage(vo);
		} else {
			// 이미지 수정을 했을 때
			System.out.println("이미지 두개 수정");
			vo.setParent_p_Id(req.getParameter("parent_p_Id"));
			vo.setPp_Name(req.getParameter("pp_Name"));
			vo.setPp_Category1(req.getParameter("pp_Category1"));
			vo.setPp_Category2(req.getParameter("pp_Category2"));
			vo.setPp_Price(Integer.parseInt(req.getParameter("pp_Price")));

			if ((mf.get(0).getOriginalFilename() != "" && mf.get(1).getOriginalFilename() != "")) {
				String originalThumbPath = req.getParameter("pp_thumb");
				String originalImagePath = req.getParameter("pp_image");
				System.out.println(originalThumbPath);
				System.out.println(originalImagePath);
				// 오리지널 폴더에 있던 사진 삭제
				DeleteUtil.deleteImg(uploadPath + originalThumbPath);
				DeleteUtil.deleteImg(uploadPath + originalImagePath);
				System.out.println("pp_thumb" + originalThumbPath);
				System.out.println("pp_thumb" + originalImagePath);
				// multipartFile로 받은 이미지 경로 set
				String imgUploadPath = uploadPath + File.separator + "productImage";
				String fileName = null;
				// req.getParameter("m_Img") != null

				String ymdPath = UploadUtilProductThumb.calcPath(imgUploadPath);
				for (int i = 0; i < mf.size(); i++) {
					if (i == 0) {
						fileName = UploadUtilProductThumb.fileUpload(imgUploadPath, mf.get(i).getOriginalFilename(),
								mf.get(i).getBytes(), ymdPath);
						vo.setPp_thumb(File.separator + "productImage" + ymdPath + File.separator + fileName);
					} else if (i == 1) {
						fileName = UploadUtilProductLong.fileUpload(imgUploadPath, mf.get(i).getOriginalFilename(),
								mf.get(i).getBytes(), ymdPath);
						vo.setPp_image(File.separator + "productImage" + ymdPath + File.separator + fileName);
					}
				}
			} else if ((mf.get(0).getOriginalFilename() != "" && mf.get(1).getOriginalFilename() == "")) {
				String originalThumbPath = req.getParameter("pp_thumb");
				vo.setPp_image(req.getParameter("pp_image"));
				// 오리지널 폴더에 있던 사진 삭제
				DeleteUtil.deleteImg(uploadPath + File.separator + originalThumbPath);
				System.out.println(uploadPath + File.separator + originalThumbPath);

				String imgUploadPath = uploadPath + File.separator + "productImage";
				String fileName = null;
				String ymdPath = UploadUtilProductThumb.calcPath(imgUploadPath);
				fileName = UploadUtilProductThumb.fileUpload(imgUploadPath, mf.get(0).getOriginalFilename(),
						mf.get(0).getBytes(), ymdPath);
				vo.setPp_thumb(File.separator + "productImage" + ymdPath + File.separator + fileName);

			} else if ((mf.get(0).getOriginalFilename() == "" && mf.get(1).getOriginalFilename() != "")) {
				vo.setPp_thumb(req.getParameter("pp_thumb"));
				String originalImagePath = req.getParameter("pp_image");
				// 오리지널 폴더에 있던 사진 삭제
				DeleteUtil.deleteImg(uploadPath + File.separator + originalImagePath);
				System.out.println(uploadPath + File.separator + originalImagePath);

				String imgUploadPath = uploadPath + File.separator + "productImage";
				String fileName = null;
				String ymdPath = UploadUtilProductThumb.calcPath(imgUploadPath);
				fileName = UploadUtilProductLong.fileUpload(imgUploadPath, mf.get(1).getOriginalFilename(),
						mf.get(1).getBytes(), ymdPath);
				vo.setPp_image(File.separator + "productImage" + ymdPath + File.separator + fileName);

			} else {
				System.out.println("이미지 문제");
			}
			System.out.println(vo);
			productParentService.modifyParentProductWithImage(vo);
		}
		mav.setViewName("redirect:/Seller/ProductManage");
		return mav;
	}

//	@RequestMapping(value = "/BuyList", method = RequestMethod.GET)
//	public ModelAndView deliveryManage(HttpSession session, ModelAndView mav, HttpServletResponse response)
//			throws IOException {
//		mav = new ModelAndView("/Seller/BuyList");
//		return mav;
//	}

	@RequestMapping(value = "/Review", method = RequestMethod.GET)
	public ModelAndView sellerReview(HttpSession session, ModelAndView mav, HttpServletResponse response, ReviewVO vo)
			throws IOException {
		mav = new ModelAndView("/Seller/Review");
		CustomerVO cVO = (CustomerVO)session.getAttribute("loginCustomer");
		BrandDBVO bVO = brandDBService.getBrandId(cVO);
		int brandId = bVO.getBrandId();
		
		List<ReviewVO> reviewList = reviewService.getReviewListForSeller(brandId);
		mav.addObject("list",reviewList);
		return mav;
	}

	@RequestMapping(value = "/ProductAddChild", method = RequestMethod.GET)
	public ModelAndView ProductAddChild(HttpSession session, HttpServletRequest req, ModelAndView mav,
			HttpServletResponse response) throws IOException {
		System.out.println("선택한 상품의 옵션나열");
		String parent_p_Id = req.getParameter("seq");
		ProductParentVO vo = new ProductParentVO();
		
		if(parent_p_Id == "" || parent_p_Id == null) {
			vo = (ProductParentVO) session.getAttribute("parent_session");
			System.out.println("수정,삭제로 넘어왔을때");
			parent_p_Id = vo.getParent_p_Id();
		} 
		
		vo = productParentService.selectParentProduct(parent_p_Id);
		session.setAttribute("parent_session", vo);
		
		ArrayList<ProductChildVO> listProductParent = new ArrayList<ProductChildVO>();
		listProductParent = productChildService.listProductChild(parent_p_Id);
		System.out.println(listProductParent);
		session.setAttribute("childList", vo);
		mav = new ModelAndView("/Seller/ProductAddChild");
		mav.addObject("vo", vo);
		mav.addObject("list", listProductParent);
		return mav;
	}

	@RequestMapping(value = "/AddChild", method = RequestMethod.POST)
	public ModelAndView addChildAction(HttpSession session, HttpServletRequest req, HttpServletResponse response, ModelAndView mav) throws Exception {
		System.out.println("옵션 입력 액션");
		ProductChildVO vo = new ProductChildVO();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String p_Color = req.getParameter("p_Color");
		String p_Size = req.getParameter("p_Size");
		String parent_p_Id = req.getParameter("parent_p_Id");
		String p_Id = parent_p_Id.concat(p_Color).concat(p_Size);
		int p_Brand = Integer.parseInt(req.getParameter("pp_Brand"));
		
		try {
			int p_Stack = Integer.parseInt(req.getParameter("p_Stack"));
			vo.setP_Stack(p_Stack);
		} catch (NumberFormatException e) {
			out.println("<script>alert('가격에는 숫자를 넣어주세요'); history.go(-1);</script>");
			out.flush();
			mav.setViewName("Seller/ProductAddChild");
			return mav;
		}
		
		vo.setP_Color(p_Color);
		vo.setP_Size(p_Size);
		vo.setParent_p_Id(parent_p_Id);
		vo.setP_Id(p_Id);
		vo.setP_Brand(p_Brand);
		
		productChildService.registProductChild(vo);
		mav.setViewName("redirect:/Seller/ProductAddChild");
		return mav;
	}

	@RequestMapping(value = "/DeleteChild", method = RequestMethod.GET)
	public String deleteChildAction(HttpServletRequest req) throws Exception {
		String p_Id = req.getParameter("seq");
		productChildService.deleteChildProduct(p_Id);
		return "redirect:/Seller/ProductAddChild";
	}

	@RequestMapping(value = "/ModifyChild", method = RequestMethod.POST)
	public ModelAndView modifyChildAction(HttpServletRequest req, ModelAndView mav, HttpServletResponse response) throws IOException {
		System.out.println("옵션 수정 액션");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		ProductChildVO vo = new ProductChildVO();
		vo.setP_Id(req.getParameter("p_Id"));
		vo.setP_Color(req.getParameter("p_Color"));
		vo.setP_Size(req.getParameter("p_Size"));
		try {
			int p_Stack = Integer.parseInt(req.getParameter("p_Stack"));
			vo.setP_Stack(p_Stack);
		} catch (NumberFormatException e) {
			out.println("<script>alert('가격에는 숫자를 넣어주세요'); history.go(-1);</script>");
			out.flush();
			mav.setViewName("Seller/ProductAddChild");
			return mav;
		}
		productChildService.modifyChildProduct(vo);
		
		mav.setViewName("redirect:/Seller/ProductAddChild");
		return mav;
	}
	
	@RequestMapping(value = "/BuyList", method = RequestMethod.GET)
	public ModelAndView orderList(HttpSession session, ModelAndView mav, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		System.out.println("구매관리입니다");
//		session.removeAttribute("productParentList");
//		System.out.println(session.getAttribute("productParentList"));
//		System.out.println("productParentList 보기");
		
		CustomerVO customerVO = (CustomerVO) session.getAttribute("loginCustomer");
		if (customerVO == null) {
			out.println("<script>alert('로그인해주세요.');</script>");
			out.flush();
			mav.setViewName("Customer/login_form");
			return mav;
		} else if (customerVO.getBrandName() == null) {
			out.println("<script>alert('기업회원으로 가입해주세요.');</script>");
			out.flush();
			mav.setViewName("Customer/login_form");
			return mav;
		}
		BrandDBVO loginBrand = brandDBService.getBrandId(customerVO);
		ArrayList<ProductParentVO> orderList = new ArrayList<ProductParentVO>();
		orderList = orderHistoryService.getBrandOrderList(loginBrand);
		System.out.println(orderList);
		mav = new ModelAndView("Seller/BuyList");
		mav.addObject("list", orderList);
		return mav;
	}
	
	@RequestMapping(value = "/BuyList", method = RequestMethod.POST)
	public ModelAndView modifyDeliveryAction(HttpServletRequest req, ModelAndView mav, HttpSession session, HttpServletResponse response) throws IOException {
		System.out.println("배송상태 수정 액션");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		OrderHistoryVO vo = new OrderHistoryVO();
		vo.setO_Num(Integer.parseInt(req.getParameter("o_Num")));
		vo.setO_Delivery(req.getParameter("o_Delivery"));
		System.out.println(vo);
		orderHistoryService.modifyDeliveryList(vo);
		out.println("<script>alert('배송상태적용완료');</script>");
		out.flush();
		System.out.println("구매관리입니다");
//		session.removeAttribute("productParentList");
//		System.out.println(session.getAttribute("productParentList"));
//		System.out.println("productParentList 보기");
		
		CustomerVO customerVO = (CustomerVO) session.getAttribute("loginCustomer");
		if (customerVO == null) {
			out.println("<script>alert('로그인해주세요.');</script>");
			out.flush();
			mav.setViewName("Customer/login_form");
			return mav;
		} else if (customerVO.getBrandName() == null) {
			out.println("<script>alert('기업회원으로 가입해주세요.');</script>");
			out.flush();
			mav.setViewName("Customer/login_form");
			return mav;
		}
		BrandDBVO loginBrand = brandDBService.getBrandId(customerVO);
		ArrayList<ProductParentVO> orderList = new ArrayList<ProductParentVO>();
		orderList = orderHistoryService.getBrandOrderList(loginBrand);
		System.out.println(orderList);
		mav = new ModelAndView("Seller/BuyList");
		mav.addObject("list", orderList);
		return mav;
	}
	
	@RequestMapping(value = "/DeleteDelivery", method = RequestMethod.POST)
	public String deleteDeliveryAction(@RequestParam(value = "chBox[]") String[] o_Num) throws Exception {
		
		for (String del_Num : o_Num) {
			System.out.println("삭제할주문번호 = " + del_Num);
			orderHistoryService.deleteDeliveryList(del_Num);
		}
		
		return "Seller/Review";
	}
	
	@RequestMapping(value = "/ReviewReply", method = RequestMethod.POST)
	public String reviewReplyAction(@RequestParam(value = "chBox[]") String[] r_Seq, HttpServletRequest req) throws Exception {
		for (String seq : r_Seq) {
			System.out.println("이 리뷰에 답변 달기 = " + seq);
			ReviewVO vo = reviewService.selectOneReview(seq); //여기서 불러오고 
			String r_CoRe = req.getParameter("v1");
			System.out.println(r_CoRe);
			vo.setR_ComentRe(r_CoRe);
			reviewService.modifyReviewReply(vo); //답변을 모디파이 
			System.out.println(vo);
		}
		
		return "Seller/Review";
	}
	
	@RequestMapping(value = "/DeleteReviewReply", method = RequestMethod.POST)
	public String deleteReviewReply(@RequestParam(value = "chBox[]") String[] r_Seq) throws Exception {
		
		for (String seq : r_Seq) {
			System.out.println("삭제할 리뷰의 답변 = " + seq);
			reviewService.DelReviewReply(seq);
		}
		
		return "Seller/Review";
	}
	
}
