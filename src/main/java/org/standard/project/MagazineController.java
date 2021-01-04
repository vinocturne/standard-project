package org.standard.project;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.standard.project.customer.CustomerService;
import org.standard.project.customer.CustomerVO;
import org.standard.project.magazine.MagazineLikeVO;
import org.standard.project.magazine.MagazineService;
import org.standard.project.magazine.MagazineVO;
import org.standard.project.product.ProductChildVO;
import org.standard.project.product.ProductParentVO;

@Controller
@RequestMapping(value = "/magazine")
public class MagazineController {
	@Resource(name = "MagazineService")
	MagazineService magazineService;

	@RequestMapping(value = "/magazineList", method = RequestMethod.GET)
	public ModelAndView magazineList(MagazineVO vo) {
		System.out.println("매거진 매니저");
		ModelAndView mav = new ModelAndView("/Magazine/Magazine");
		List<MagazineVO> list = magazineService.getMagazineList(vo);
		mav.addObject("list", list);
		return mav;
	}

//	@RequestMapping(value = "/magazineList", method = RequestMethod.GET)
//	public ModelAndView magazineList(HttpServletRequest req) {
//		System.out.println("Magazine");
//		String m_Seq = req.getParameter("seq");
//		MagazineVO vo = new MagazineVO();
//		vo = magazineService.getMagazine(m_Seq);
//		System.out.println(vo);
//		ModelAndView mav = new ModelAndView("/Magazine/Magazine");
//		mav.addObject("vo",vo);		
//		return mav;
//	}

	@RequestMapping("/MagazineIn")
	public String magazineDetail() {

		return "Magazine/MagazineIn";
	}

	@RequestMapping(value = "/MagazineDetail", method = RequestMethod.GET)
	public ModelAndView newmagazineDetail(CustomerVO cvo, HttpSession session, ModelAndView mav,
			HttpServletRequest req) {
		MagazineLikeVO magazineLikeVO = new MagazineLikeVO();
		String userLikeCheck = "";
		int mm_Seq = Integer.parseInt(req.getParameter("m_Seq"));
		MagazineVO magazineVO = magazineService.selectMagazine(mm_Seq);
		if (session.getAttribute("loginCustomer") != null) {
			System.out.println(">> 세션에 login기록 남아있음");
			try {
				cvo = (CustomerVO) session.getAttribute("loginCustomer");
				String c_Id = cvo.getC_Id();
				magazineLikeVO.setC_Id(c_Id);
				magazineLikeVO.setM_Seq(mm_Seq);
				if(magazineService.magazineLikeCheck(magazineLikeVO) == null) {
					magazineService.makeLikeRow(magazineLikeVO);					
				}else {
				userLikeCheck = magazineService.magazineLikeCheck(magazineLikeVO);
					System.out.println(magazineLikeVO);
					System.out.println("userLikeCheck >> " + userLikeCheck);
				}
				if (userLikeCheck.equals("1")) {
					System.out.println("좋아요를 누른 게시물");
					mav.addObject("likecheck", userLikeCheck);

				} else {
					System.out.println("좋아요를 누르지 않은 게시물");
					mav.addObject("likecheck", 0);
				}
			} catch (Exception e) {
				System.out.println("캐치오류");
			} finally {
				mav = new ModelAndView("/Magazine/MagazineDetail");
				mav.addObject("m_Seq", magazineVO);
				
			}
		} else {
			System.out.println(">> 세션에 login기록 없음");
			mav = new ModelAndView("/Magazine/MagazineDetail");
			mav.addObject("m_Seq", magazineVO);
		}
		magazineService.hitIncrease(mm_Seq);
		return mav;

	}

}
