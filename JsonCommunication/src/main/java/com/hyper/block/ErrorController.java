package com.hyper.block;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/block/errors")
public class ErrorController {
	
	@RequestMapping(value="/error")
	public String Error(HttpServletRequest request, Model model) {
		model.addAttribute("msg", "서버에 오류가 발생하였습니다.");
		return "errors/error";
	}
	
	@RequestMapping(value="/404")
	public String Error404(HttpServletRequest request, Model model) {
		model.addAttribute("msg", "페이지를 찾을 수 없습니다.");
		return "errors/error404";
	}
	
	@RequestMapping(value="/405")
	public String Error405(HttpServletRequest request, Model model) {
		model.addAttribute("msg", "요청된 메소드가 허용되지 않습니다.");
		return "errors/error404";
	}
	
	@RequestMapping(value="/500")
	public String Error500(HttpServletRequest request, Model model) {
		model.addAttribute("msg", "서버에 오류가 발생하였습니다.");
		return "errors/error500";
	}
}
