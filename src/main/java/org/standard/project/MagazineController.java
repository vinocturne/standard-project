package org.standard.project;

import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.standard.project.customer.CustomerService;
import org.standard.project.magazine.MagazineService;
import org.standard.project.magazine.MagazineVO;

@Controller
@RequestMapping(value = "/magazine")
public class MagazineController {
	@Resource(name = "MagazineService")
	MagazineService magazineService;

	
	
	
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


	@RequestMapping("/MagazineDetail")
	public String newmagazineDetail() {

		return "Magazine/MagazineDetail";
	}

}
