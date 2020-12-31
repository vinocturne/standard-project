package org.standard.project;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/shop")
public class ProductController {
	
	@RequestMapping(value="/shopMain")
	public String shopMain() {
		return "Store/StoreMain";
	}

}
