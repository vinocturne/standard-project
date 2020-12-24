package org.standard.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "/Admin")
public class AdminController {
	@RequestMapping(value = "/AdminMain", method = RequestMethod.GET)
	public void adminMain() {
		
	}
	
	@RequestMapping(value= "/seller")
	public String magazineList() {
		
		return "/Admin/seller";
	}
	
}
