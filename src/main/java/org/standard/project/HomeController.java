package org.standard.project;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.standard.project.customer.CustomerVO;
import org.standard.project.customer.impl.CustomerDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/login_form", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		logger.info("test", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "login_form";
	}
	
	@RequestMapping(value = "/Review", method = RequestMethod.GET)
	public String Review(Locale locale, Model model) {
		logger.info("test", locale);
		
		
		
		return "Review";
	}
	
	@RequestMapping(value = "/SellerReview", method = RequestMethod.GET)
	public String SellerReview(Locale locale, Model model) {
		logger.info("test", locale);
		
		
		
		return "SellerReview";
	}
	
	@RequestMapping(value = "/login_ok", method = RequestMethod.POST)
	public String LoginOk(CustomerVO vo, CustomerDAO customerDAO) {
		System.out.println("로그인 오케이");
		
		
		
		
		return "login_ok";
	}
	
	
	@RequestMapping(value = "/Register", method = RequestMethod.GET)
	public String Register(Locale locale, Model model) {
		logger.info("test", locale);
		
		
		
		return "Register";
	}
	
	@RequestMapping(value = "/Wishlist", method = RequestMethod.GET)
	public String Wishlist(Locale locale, Model model) {
		logger.info("test", locale);
		
		
		
		return "Register";
	}
	
}

// TEST 1 
// TEST 2 ����     
// TEST 3 ����
// TEST 4 ����