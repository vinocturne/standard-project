package org.standard.project;

import java.util.Locale;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.standard.project.customer.CustomerService;

@Controller
@RequestMapping(value = "/magazine")
public class MagazineController {
	@RequestMapping("/magazineList")
	public String magazineList() {
		
		return "Magazine/Magazine";
	}
	
	@RequestMapping("/MagazineIn")
	public String magazineDetail() {
		
		return "Magazine/MagazineIn";
	}

	@RequestMapping("/MagazineNew")
	public String newmagazineList() {
		
		return "Magazine/MagazineNew";
	}
}
