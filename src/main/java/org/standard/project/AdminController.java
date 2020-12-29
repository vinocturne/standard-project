package org.standard.project;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import org.springframework.web.servlet.ModelAndView;
import org.standard.project.common.UploadUtil;
import org.standard.project.customer.CustomerService;
import org.standard.project.customer.CustomerVO;
import org.standard.project.magazine.MagazineService;
import org.standard.project.magazine.MagazineVO;

@Controller
@RequestMapping(value = "/Admin")
public class AdminController {
	@Resource(name = "CustomerService")
	CustomerService customerService;
	@Resource(name = "MagazineService")
	MagazineService magazineService;
	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/AdminMain", method = RequestMethod.GET)
	public ModelAndView adminMain(Map<String, Object> map, CustomerVO vo) {
		System.out.println("어드민 입장 및 웨이팅회원 목록불러오기");
		ModelAndView mav = new ModelAndView("/Admin/AdminMain");

		List<Map<String, Object>> list = customerService.listWaitingCustomer(map);
		mav.addObject("list", list);

		return mav;
	}

	@RequestMapping(value = "/deleteWaitingCustomer", method = RequestMethod.POST)
	public String delete_user(@RequestParam(value = "chBox[]") String[] c_Id) throws Exception {
		// 체크한 ID마다 반복해서 사용자 삭제
		System.out.println("선택한 회원 삭제 가동");
		for (String user_id : c_Id) {
			System.out.println("사용자 삭제 = " + user_id);
			customerService.deleteWaitingCustomer(user_id);
		}
		return "redirect:/Admin/AdminMain";
	}

	@RequestMapping(value = "/approveCustomer", method = RequestMethod.POST)
	public String approveCustomer(@RequestParam(value = "chBox[]") String[] c_Id) throws Exception {
		// 어차피 id 체크 되어 회원가입한것이라 체크 안하고 쿼리문을 통해 복사 붙혀널기 하고 삭제한다.
		// 체크한 ID마다 반복해서 사용자 복붙 및 삭제
		System.out.println("선택한 회원 승인 가동");
		for (String user_id : c_Id) {
			System.out.println("사용자 복사 붙혀놓기 = " + user_id);
			customerService.approveCustomer(user_id);
			System.out.println("사용자 삭제 = " + user_id);
			customerService.deleteWaitingCustomer(user_id);
		}

		return "redirect:/Admin/AdminMain";
	}

	@RequestMapping(value = "/magazineManager", method = RequestMethod.GET)
	public ModelAndView magazineManager() {
		System.out.println("매거진 매니저");
		ModelAndView mav = new ModelAndView("/Admin/magazineManager");

		return mav;
	}

	@RequestMapping(value = "/magazineWrite", method = RequestMethod.GET)
	public ModelAndView magazineWrite(HttpServletRequest req) {
		System.out.println("매거진 입력 폼");
		ModelAndView mav = new ModelAndView("/Admin/magazineWrite");

		return mav;
	}

	@RequestMapping(value = "/magazineWrite", method = RequestMethod.POST)
	public String magazineWriteAction(HttpServletRequest req, MultipartFile m_Img) throws Exception {
		System.out.println("매거진 입력 액션");
		MagazineVO vo = new MagazineVO();

		String m_Title = req.getParameter("m_Title");
		String m_Content = req.getParameter("m_Content");

		String imgUploadPath = uploadPath + File.separator + "magazineImage";
		String fileName = null;
		//req.getParameter("m_Img") != null
		if (m_Img.getOriginalFilename() != null && m_Img.getOriginalFilename() != "") {
			String ymdPath = UploadUtil.calcPath(imgUploadPath);
			fileName = UploadUtil.fileUpload(imgUploadPath, m_Img.getOriginalFilename(), m_Img.getBytes(), ymdPath);
			vo.setM_Img(File.separator + "magazineImage" + ymdPath + File.separator + fileName);
			vo.setM_Thumb(File.separator + "magazineImage" + ymdPath + File.separator + "s" + File.separator + "s_"
					+ fileName);
		} else {
			vo.setM_Img(File.separator + "magazineImage" + File.separator + "none.png");
			vo.setM_Thumb(File.separator + "magazineImage" + File.separator + "none.png");
		}

		vo.setM_Title(m_Title);
		vo.setM_Content(m_Content);

		magazineService.writeMagazine(vo);

		return "redirect:/Admin/magazineManager";
	}
}
