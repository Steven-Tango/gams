package com.cqeec.gams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/app/function/")
public class FunctionController {

	@RequestMapping("/list.html")
	public String gotoListPage() {
		return "function/list";
	}

	@RequestMapping("/group/add.html")
	public ModelAndView gotoAddFunctionGroupPage() {
		ModelAndView mav = new ModelAndView("function/group/add");
		return mav;
	}

	@RequestMapping("/module/add.html")
	public ModelAndView gotoAddFunctionModulePage() {
		ModelAndView mav = new ModelAndView("function/module/add");
		return mav;
	}

	@RequestMapping("/group/edit.html")
	public ModelAndView gotoEditFunctionGroupPage() {
		ModelAndView mav = new ModelAndView("function/group/edit");
		return mav;
	}

	@RequestMapping("/module/edit.html")
	public ModelAndView gotoEditFunctionModulePage() {
		ModelAndView mav = new ModelAndView("function/module/edit");
		return mav;
	}

}
