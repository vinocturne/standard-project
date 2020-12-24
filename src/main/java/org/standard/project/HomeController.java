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

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "index";
	}
	
	@RequestMapping(value = "/Review", method = RequestMethod.GET)
	public String Review(Locale locale, Model model) {
		return "/Review/Review";
	}
	
	@RequestMapping(value = "/SellerReview", method = RequestMethod.GET)
	public String SellerReview(Locale locale, Model model) {
		return "SellerReview";
	}
	
	@RequestMapping(value = "/Register", method = RequestMethod.GET)
	public String Register(Locale locale, Model model) {

		return "Register";
	}
	

}
