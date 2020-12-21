package org.standard.project;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReviewController {
	@Resource(name="")
//	CustomerService customerService; //이런식으로 입력
	
	@RequestMapping(value="/Wishlist", method=RequestMethod.GET)
	public void reviewListView() {} 
}
