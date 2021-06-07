package com.cqeec.gams.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cqeec.gams.entity.FunctionalModule;
import com.cqeec.gams.service.FunctionalModuleService;

@RestController
@RequestMapping("/api/function/")
public class FunctionRestController {
	@Autowired
	private FunctionalModuleService functionalModuleService;

	@GetMapping("/list/all")
	public List<FunctionalModule> list() {
		return functionalModuleService.findAll();
	}

}
