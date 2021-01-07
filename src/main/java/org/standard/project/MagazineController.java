package org.standard.project;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.standard.project.customer.CustomerVO;
import org.standard.project.magazine.MagazineLikeVO;
import org.standard.project.magazine.MagazineService;
import org.standard.project.magazine.MagazineVO;

@Controller
@RequestMapping(value = "/magazine")
public class MagazineController {
	@Resource(name = "MagazineService")
	MagazineService magazineService;

	@RequestMapping(value = "/magazineList", method = RequestMethod.GET)
	public ModelAndView magazineList(MagazineVO vo, HttpServletRequest req) {
		String m_Title = req.getParameter("s_m_Title");
		System.out.println("매거진 매니저");
		ModelAndView mav = new ModelAndView("/Magazine/Magazine");
		List<MagazineVO> list = new ArrayList<MagazineVO>();
		if(m_Title ==""||m_Title==null) {
			list = magazineService.getMagazineList(vo);
		}else {
			list = magazineService.searchMagazineViewList(m_Title);
		}
		mav.addObject("list", list);
		mav.addObject("search", m_Title);
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
		mav = new ModelAndView("/Magazine/MagazineDetail");
		MagazineLikeVO magazineLikeVO = new MagazineLikeVO();
		String userLikeCheck = "";
		int mm_Seq = Integer.parseInt(req.getParameter("m_Seq"));
		int likeCnt = magazineService.getLikeCnt(mm_Seq);
		System.out.println(">>likeNum >> "+likeCnt);
		MagazineVO magazineVO = magazineService.selectMagazine(mm_Seq);
		if (session.getAttribute("loginCustomer") != null) {
			System.out.println(">> 세션에 login기록 남아있음");
			try {
				cvo = (CustomerVO) session.getAttribute("loginCustomer");
				String c_Id = cvo.getC_Id();
				magazineLikeVO.setC_Id(c_Id);
				magazineLikeVO.setM_Seq(mm_Seq);
				if (magazineService.magazineLikeCheck(magazineLikeVO) == null) {
//					magazineService.makeLikeRow(magazineLikeVO);
				} else {
					userLikeCheck = magazineService.magazineLikeCheck(magazineLikeVO);
					System.out.println(magazineLikeVO);
					System.out.println("userLikeCheck >> " + userLikeCheck);
				}
				System.out.println(userLikeCheck);
				
				mav.addObject("c_Id", c_Id);
				if (userLikeCheck.contentEquals("1")) {
					System.out.println("좋아요를 누른 게시물");
					mav.addObject("likecheck", userLikeCheck);

				} else {
					System.out.println("좋아요를 누르지 않은 게시물");
					mav.addObject("likecheck", 0);
				}
			} catch (Exception e) {
				System.out.println("캐치오류");
			}
		} else {
			System.out.println(">> 세션에 login기록 없음");
		}

		mav.addObject("likeCnt", likeCnt);
		mav.addObject("m_Seq", magazineVO);
		magazineService.hitIncrease(mm_Seq);
		return mav;

	}
	@RequestMapping(value = "/clickLike", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> clickLike(HttpServletRequest req,HttpServletResponse resp) throws Exception {
//		PrintWriter out = resp.getWriter();
		//m_Seq, c_Id 불러오기
		int m_Seq = Integer.parseInt(req.getParameter("m_Seq"));
		String c_Id = req.getParameter("c_Id");
		int likeCnt = 0;
		int likeCheck = 1;
		int resultCode = 1;
		//매퍼에 필요한 껍데기 만들어주기
		MagazineVO mVO = new MagazineVO();
		MagazineLikeVO mlVO = new MagazineLikeVO();
		mVO.setM_Seq(m_Seq);
		mlVO.setC_Id(c_Id);
		mlVO.setM_Seq(m_Seq);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			//처음 좋아요 누르면 magazineLike에 값이 없기 때문에 여기로 가서 새로운 행을 생성
			if(magazineService.magazineLikeCheck(mlVO) == null) {
				magazineService.makeLikeRow(mlVO);
				magazineService.updateLikeCntPlus(mVO);
				resultCode = 1;
			}else if(Integer.parseInt(magazineService.magazineLikeCheck(mlVO)) == 0){
				//magazineLike를 좋아요 한 적은 있으나 취소한 상태
				magazineService.likeCheckPlus(mlVO);
				magazineService.updateLikeCntPlus(mVO);
				likeCheck = Integer.parseInt(magazineService.magazineLikeCheck(mlVO));
				resultCode = 1;
			}else {
				//취소하면 여기로
				magazineService.updateLikeCntMinus(mVO);
				magazineService.likeCheckInit(mlVO);
//				likeCheck = Integer.parseInt(magazineService.magazineLikeCheck(mlVO));
				likeCheck = 0;
				resultCode = 0;
			}
			likeCnt = magazineService.getLikeCnt(m_Seq);
			resultMap.put("likeCnt", likeCnt);			
			resultMap.put("likeCheck", likeCheck);
		}catch(Exception e) {
			resultCode = -1;
		}
		
		resultMap.put("resultCode", resultCode);
		//alert 테스트용
		return resultMap;
	}
}
