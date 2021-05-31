package com.cqeec.gams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/app/user/")
public class UserController {

	@RequestMapping("/list.html")
	public String gotoMainPage() {
		return "user/list";
	}

	@RequestMapping("/add.html")
	public String gotoAddPage() {
		return "user/add";
	}

	@RequestMapping("/edit.html")
	public String gotoEditPage() {
		return "user/edit";
	}

}
