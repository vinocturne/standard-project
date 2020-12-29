package org.standard.project;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/Cs")
public class CsController {
	@RequestMapping(value = "/cs_request", method = RequestMethod.GET)
	public String cs_request() {
		
		return "Cs/cs_request";
	}
}
