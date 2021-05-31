package com.cqeec.gams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/app/role/")
public class RoleController {

	@RequestMapping("/list.html")
	public String gotoMainPage() {
		return "role/list";
	}

	@RequestMapping("/add.html")
	public String gotoAddPage() {
		return "role/add";
	}

	@RequestMapping("/edit.html")
	public String gotoEditPage() {
		return "role/edit";
	}

}
