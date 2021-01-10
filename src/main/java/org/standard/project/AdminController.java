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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
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
import org.standard.project.brand.BrandDBService;
import org.standard.project.brand.BrandDBVO;
import org.standard.project.common.DeleteUtil;
import org.standard.project.common.UploadUtil;
import org.standard.project.customer.CustomerService;
import org.standard.project.customer.CustomerVO;
import org.standard.project.magazine.MagazineService;
import org.standard.project.magazine.MagazineVO;
import org.standard.project.order.Category2SalesVO;
import org.standard.project.order.MarketShareVO;
import org.standard.project.order.OrderHistoryService;

@Controller
@RequestMapping(value = "/Admin")
public class AdminController {
	@Resource(name = "CustomerService")
	CustomerService customerService;
	@Resource(name = "MagazineService")
	MagazineService magazineService;
	@Resource(name="BrandDBService")
	BrandDBService brandDBService;
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Resource(name="OrderHistoryService")
	OrderHistoryService orderHistoryService;
	
	@RequestMapping(value="/AdminGraph")
	public ModelAndView adminGraph(HttpServletRequest req) throws Exception  {
		System.out.println("관리자 그래프 컨트롤러");
		ModelAndView mav = new ModelAndView("/Admin/AdminGraph");
		//중분류에 따른 중분류별 판매 점유율 파이차트
		ArrayList<Category2SalesVO> MCMSList =  orderHistoryService.getManCategoryMarketShareVOList();
		ArrayList<Category2SalesVO> WCMSList =  orderHistoryService.getWomanCategoryMarketShareVOList();
		ArrayList<MarketShareVO> MSList = orderHistoryService.getMarketShareVOList();
		
		System.out.println("남자상품별 점유율:"+MCMSList);
		System.out.println("여자상품별 점유율:"+WCMSList);
		System.out.println("브랜드별 점유율:"+MSList);
		
		if(MCMSList!=null&&WCMSList!=null) {
			JSONArray MCMSListJSONArr = new JSONArray();
			JSONArray WCMSListJSONArr = new JSONArray();
			for(int i=0; i<MCMSList.size();i++) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("numberOfSales",MCMSList.get(i).getNumberOfSales());
				jsonObject.put("Category2",MCMSList.get(i).getCategory2());
				MCMSListJSONArr.add(jsonObject);
			}
			for(int i=0; i<WCMSList.size();i++) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("numberOfSales",WCMSList.get(i).getNumberOfSales());
				jsonObject.put("Category2", WCMSList.get(i).getCategory2());
				WCMSListJSONArr.add(jsonObject);
			}
			mav.addObject("womanCategoryMarketShareList",WCMSListJSONArr.toJSONString());
			mav.addObject("manCategoryMarketShareList",MCMSListJSONArr.toJSONString());
		}
		
		//브랜드별 판매 점유율 파이차트
		JSONArray MSListJSONArr = new JSONArray();
		
		
		if(MSList!=null) {
			//제이슨으로 변환 안하고 바로 list<Map> 형태로 해줘도 괜찮을까?
			//req.setAttribute("marketShareList", marketShareList);
			for(int i=0; i<MSList.size();i++) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("numberOfSales",MSList.get(i).getNumberOfSales());
				jsonObject.put("brandName", MSList.get(i).getBrandName());
				MSListJSONArr.add(jsonObject);
			}
			mav.addObject("marketShareList",MSListJSONArr.toJSONString());
		}
		
		List<Map<String,Object>> list = orderHistoryService.getDailyIncome();
		JSONArray jsonArr = new JSONArray();
		//{날짜: 2020-12-24},{판매액:25000}
		for(int i=0;i<list.size();i++) {
			JSONObject jsonObject = new JSONObject();
			//JSONObject jsonObject = new JSONObject(list.get(i)); Map으로 바로 넣으면 value값이 인트형이라 아니라 계산을 해버림
			jsonObject.put("totalPrice", list.get(i).get("o_TotalPrice").toString());
			jsonObject.put("orderDate", list.get(i).get("o_Date").toString());
			jsonArr.add(jsonObject);
		}
		System.out.println("toJSONString() : "+jsonArr.toJSONString() );
		mav.addObject("list",(Object)jsonArr.toString());
		
		//날짜별 가입 고객수 그래프
		List<Map<String,Object>> regNumberList = customerService.getDailyRegNumber();
		System.out.println(regNumberList);
		JSONArray RegCustomerjsonArr = new JSONArray();
		for(int i=0;i<regNumberList.size();i++) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("registerDate", regNumberList.get(i).get("c_RegisterDate").toString());
			jsonObject.put("regNum", regNumberList.get(i).get("COUNT(c_Id)").toString());
			RegCustomerjsonArr.add(jsonObject);
		}
		System.out.println(RegCustomerjsonArr.toJSONString());
		mav.addObject("regNumberList",RegCustomerjsonArr.toString());
		return mav;
	}

	@RequestMapping(value = "/AdminMain", method = RequestMethod.GET)
	public ModelAndView adminMain(Map<String, Object> map, CustomerVO vo, HttpSession session, HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView("/Admin/AdminMain");
		PrintWriter out = response.getWriter();
		CustomerVO customerVO = (CustomerVO) session.getAttribute("loginCustomer");
		if (customerVO == null) {
			out.println("<script>alert('로그인해주세요.');</script>");
			out.flush();
			mav.setViewName("Customer/login_form");
			return mav;
		} else if (!"관리자".equals(customerVO.getRole())) {
			out.println("<script>alert('관리자 아이디로 로그인해주세요.');</script>");
			out.flush();
			mav.setViewName("index");
			return mav;
		}
		System.out.println("어드민 입장 및 웨이팅회원 목록불러오기");

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
	public String approveCustomer(HttpServletRequest req,BrandDBVO vo) throws Exception { 
		//public String approveCustomer(@RequestParam(value = "chBox[]") String[] c_Info) throws Exception { 
		// 어차피 id 체크 되어 회원가입한것이라 체크 안하고 쿼리문을 통해 복사 붙혀널기 하고 삭제한다. 
		// 체크한 ID마다 반복해서 사용자 복붙 및 삭제
		System.out.println("선택한 회원 승인 가동");
		//ajax data에 들어있는 String 타입 JSONArray을 JSONArray타입으로 변환.
		JSONParser parser = new JSONParser();
		JSONArray arr = new JSONArray();
		arr=(JSONArray)parser.parse(req.getParameter("data"));
		//JSONArray에서 JSONObject를 추출해서 가입승인(웨이팅리스트의 값을 가져와서 고객리스트에 삽입후 웨이팅리스트 삭제, 브랜드 정보에 추가)
		for(int i=0; i<arr.size();i++) {
			JSONObject object = (JSONObject)arr.get(i);
			System.out.println(object.get("brandName"));
			System.out.println(object.get("c_id"));
			System.out.println(object.get("businessNumber"));
			//고객리스트에 복사
			String user_id =(String)object.get("c_id"); 
			customerService.approveCustomer(user_id);
			
			String brandName = (String)object.get("brandName");
			String businessNumber = (String)object.get("businessNumber");
			System.out.println("브랜드네임 : "+brandName);
			System.out.println("사업자번호 :" +businessNumber);
			vo.setBrandName(brandName);
			vo.setBusinessNumber(businessNumber);
			System.out.println(vo.toString());
			brandDBService.insertBrand(vo);
			//웨이팅리스트에서 삭제
			customerService.deleteWaitingCustomer(user_id);
		}
			

		
		/*
		 * for (String user_id : c_Info) { System.out.println("사용자 복사 붙혀놓기 = " +
		 * user_id); customerService.approveCustomer(user_id);
		 * System.out.println("사업자번호 : "+c_Info[1]);
		 * System.out.println("브랜드네임 :"+c_Info[2]); System.out.println("사용자 삭제 = " +
		 * user_id); customerService.deleteWaitingCustomer(user_id); }
		 */
		
		return "redirect:/Admin/AdminMain"; 
	}

	@RequestMapping(value = "/magazineManager", method = RequestMethod.GET)
	public ModelAndView magazineManager(MagazineVO vo) {
		System.out.println("매거진 매니저");
		ModelAndView mav = new ModelAndView("/Admin/magazineManager");
		List<MagazineVO> list = magazineService.getMagazineList(vo);
		mav.addObject("list", list);
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
	
	@RequestMapping(value = "/magazineModify", method = RequestMethod.GET)
	public ModelAndView magazineModify_form(HttpServletRequest req) {
		// 체크한 ID마다 반복해서 사용자 삭제
		System.out.println("선택한 회원 수정 가동");
		String m_Seq = req.getParameter("seq");
		MagazineVO vo = new MagazineVO();
		vo = magazineService.getMagazine(m_Seq);
		System.out.println(vo);
		ModelAndView mav = new ModelAndView("/Admin/magazineModify");
		mav.addObject("vo",vo);		
		return mav;
	}
	
	@RequestMapping(value = "/magazineModify", method = RequestMethod.POST)
	public String magazineModify_Action(HttpServletRequest req, MultipartFile modifyImage) throws IOException, Exception {
		MagazineVO vo = new MagazineVO();
//		System.out.println("m_Seq >> "+req.getParameter("m_Seq"));
//		System.out.println("m_Title >> "+req.getParameter("m_Title"));
//		System.out.println("m_Content >> "+req.getParameter("m_Content"));
//		System.out.println("m_Img >> "+m_Img.getOriginalFilename() );
//		System.out.println("m_Thumb URL >> "+req.getParameter("m_Thumb"));
//		System.out.println("m_Hit>> "+req.getParameter("m_Hit"));
//		System.out.println("m_Like>> "+req.getParameter("m_Like"));
		
		if(modifyImage.getOriginalFilename() == "") {
		//따로 이미지 수정을 하지 않았을 때(Seq,Img,Thumb,Hit,Like빼고, Title, Content만 업로드)
			System.out.println("이미지 변경 없는 수정");
			vo.setM_Seq(Integer.parseInt(req.getParameter("m_Seq")));
			vo.setM_Title(req.getParameter("m_Title"));
			vo.setM_Content(req.getParameter("m_Content"));
			magazineService.modifyMagazineWithoutImg(vo);
		} else {
			//이미지 수정을 했을 때
			System.out.println("이미지 변경한 수정");
			vo.setM_Seq(Integer.parseInt(req.getParameter("m_Seq")));
			vo.setM_Title(req.getParameter("m_Title"));
			vo.setM_Content(req.getParameter("m_Content"));
			String originalImagePath = req.getParameter("m_Img");
			String originalThumbPath = req.getParameter("m_Thumb");
			//오리지널 폴더에 있던 사진 삭제
			DeleteUtil.deleteImg(uploadPath + File.separator + originalImagePath);
			DeleteUtil.deleteImg(uploadPath + File.separator + originalThumbPath);
			System.out.println(uploadPath + File.separator + originalImagePath);
			//multipartFile로 받은 이미지 경로 set
			String imgUploadPath = uploadPath + File.separator + "magazineImage";
			String fileName = null;
			//req.getParameter("m_Img") != null
			if (modifyImage.getOriginalFilename() != null && modifyImage.getOriginalFilename() != "") {
				String ymdPath = UploadUtil.calcPath(imgUploadPath);
				fileName = UploadUtil.fileUpload(imgUploadPath, modifyImage.getOriginalFilename(), modifyImage.getBytes(), ymdPath);
				vo.setM_Img(File.separator + "magazineImage" + ymdPath + File.separator + fileName);
				vo.setM_Thumb(File.separator + "magazineImage" + ymdPath + File.separator + "s" + File.separator + "s_"
						+ fileName);
				System.out.println("값 세팅 완료");
			}else {
				System.out.println("수정 이미지 받지 못함");
			}
			//vo로 넘겨주는 값은 seq, title, content, img주소, thumb주소
			magazineService.modifyMagazineWithImg(vo);
		}
		return "redirect:/Admin/magazineManager";
	}
	
	@RequestMapping(value = "/deleteMagazine", method = RequestMethod.POST)
	public String deleteMagazine(@RequestParam(value = "chBox[]") String[] m_Seq) {
		// 체크한 ID마다 반복해서 사용자 삭제
				System.out.println("선택한 매거진 삭제 가동");
				for (String magazineSeq : m_Seq) {
					MagazineVO vo = magazineService.getMagazine(magazineSeq);
					String originalImagePath = vo.getM_Img();
					String originalThumbPath = vo.getM_Thumb() ;
					DeleteUtil.deleteImg(uploadPath + File.separator + originalImagePath);
					DeleteUtil.deleteImg(uploadPath + File.separator + originalThumbPath);
					System.out.println(magazineSeq + "번 매거진 삭제");
					magazineService.deleteMagazine(magazineSeq);
				}
		return "redirect:/Admin/magazineManager";
	}
	
//	@RequestMapping(value = "/MagazineDetail" , method = RequestMethod.GET)
//	public ModelAndView MagazineDetail(HttpServletRequest req) {
//		System.out.println("매거진디테일");
//		MagazineVO vo = new MagazineVO();
//		System.out.println(vo);
//		ModelAndView mav = new ModelAndView("/Magazine/MagazineDetail");
//		mav.addObject("vo",vo);		
//		return mav;
//	}

	
}
