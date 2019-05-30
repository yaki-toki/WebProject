package com.hyper.block;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GroupPayController {
	
	@RequestMapping(value = "/money", method = RequestMethod.GET)
	public String NewPage() {
		System.out.println("New Controller");
		return "sendMoney";
	}
}
