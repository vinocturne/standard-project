package org.standard.project;

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
	
	@RequestMapping(value = "/AdminMain", method = RequestMethod.GET)
	public ModelAndView adminMain(Map<String, Object> map, CustomerVO vo) {
		System.out.println("어드민 입장 및 웨이팅회원 목록불러오기");
		ModelAndView mav = new ModelAndView ("/Admin/AdminMain");
		
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
		ModelAndView mav = new ModelAndView ("/Admin/magazineManager");
		
		
		
		return mav;
	}
	
	@RequestMapping(value = "/magazineWrite", method = RequestMethod.GET)
	public ModelAndView magazineWrite(HttpServletRequest req) {
		System.out.println("매거진 입력 폼");
		ModelAndView mav = new ModelAndView ("/Admin/magazineWrite");

		return mav;
	}
	@RequestMapping(value = "/magazineWrite", method = RequestMethod.POST)
	public String magazineWriteAction(HttpServletRequest req, MultipartFile file) throws Exception {
		System.out.println("매거진 입력 액션");
		MagazineVO vo = new MagazineVO();
		
		String m_Title = req.getParameter("m_Title");
		String m_Content = req.getParameter("m_Content");
		
		//파일 처리 코드
		//이미지 저장 폴더 선언.
		String imgUploadPath = this.getClass().getResource("").getPath();
		System.out.println(imgUploadPath);
		//		imgUploadPath = imgUploadPath.substring(1, imgUploadPath.indexOf(".metadata"))+"standard-project/src/main/webapp/uploadResources/magazineImage";
		String ymdPath = UploadUtil.calcPath(imgUploadPath);
		String fileName = null;
		
		if(file!=null) {
			fileName = UploadUtil.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		}else {
			fileName = imgUploadPath+"/none.jpg";
		}
		vo.setM_Title(m_Title);
		vo.setM_Content(m_Content);
		vo.setM_Img("/"+imgUploadPath+"/"+ymdPath+"/"+fileName);
		vo.setM_Thumb("/"+imgUploadPath+"/"+ymdPath+"/thumb"+"/"+"thumb_"+fileName);
		magazineService.writeMagazine(vo);
		
		return "redirect:/Admin/magazineManager";
	}
}
