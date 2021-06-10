package com.cqeec.gams.controller;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cqeec.gams.entity.FunctionalModule;
import com.cqeec.gams.service.FunctionalModuleService;

@Controller
@RequestMapping("/app/function/")
public class FunctionController {
	@Autowired
	private FunctionalModuleService fmService;

	@RequestMapping("/list.html")
	public String gotoListPage() {
		return "function/list";
	}

	@RequestMapping("/group/update.html")
	public ModelAndView update(FunctionalModule functionalModule) {
		ModelAndView mav = new ModelAndView("function/group/edit");
		try {
			fmService.update(functionalModule);
			mav.addObject("message", "保存数据成功！");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("fm", functionalModule);
			mav.addObject("message", "保存数据失败！");
		}
		return mav;
	}

	@RequestMapping("/group/edit.html")
	public ModelAndView gotoEditFunctionGroupPage(String id) {
		ModelAndView mav = new ModelAndView("function/group/edit");
		FunctionalModule fm = fmService.findById(id);
		mav.addObject("fm", fm);
		return mav;
	}

	@RequestMapping("/group/save.html")
	public ModelAndView save(FunctionalModule functionalModule, RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();
		String id = functionalModule.getId();
		if (id == null || "".equals(id)) {
			functionalModule.setId(UUID.randomUUID().toString().toUpperCase());
		}
		try {
			functionalModule.setType("1");
			fmService.insert(functionalModule);
			mav.setViewName("redirect:/app/function/group/add.html");
			ra.addFlashAttribute("message", "保存数据成功！");
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("function/group/add");
			mav.addObject("fm", functionalModule);
			mav.addObject("message", "保存数据失败！");
		}
		return mav;
	}

	@RequestMapping("/group/add.html")
	public ModelAndView gotoAddFunctionGroupPage() {
		ModelAndView mav = new ModelAndView("function/group/add");
		return mav;
	}

	@RequestMapping("/module/save.html")
	public ModelAndView saveFunctionModule(FunctionalModule functionalModule, RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();
		String id = functionalModule.getId();
		if (id == null || "".equals(id)) {
			functionalModule.setId(UUID.randomUUID().toString().toUpperCase());
		}
		try {
			functionalModule.setType("2");
			fmService.insert(functionalModule);
			mav.setViewName("redirect:/app/function/module/add.html");
			ra.addFlashAttribute("message", "保存数据成功！");
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("function/module/add");
			mav.addObject("fm", functionalModule);
			// 查询所有的功能组
			List<FunctionalModule> functionGroups = fmService.getAllFunctionGroup();
			mav.addObject("functionGroups", functionGroups);
			mav.addObject("message", "保存数据失败！");
		}
		return mav;
	}

	@RequestMapping("/module/add.html")
	public ModelAndView gotoAddFunctionModulePage() {
		ModelAndView mav = new ModelAndView("function/module/add");
		// 查询所有的功能组
		List<FunctionalModule> functionGroups = fmService.getAllFunctionGroup();
		mav.addObject("functionGroups", functionGroups);
		return mav;
	}

	@RequestMapping("/module/update.html")
	public ModelAndView updateModule(FunctionalModule functionalModule) {
		ModelAndView mav = new ModelAndView("function/module/edit");
		try {
			fmService.update(functionalModule);
			mav.addObject("message", "保存数据成功！");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("message", "保存数据失败！");
		}
		mav.addObject("fm", functionalModule);
		// 查询所有的功能组
		mav.addObject("functionGroups", fmService.getAllFunctionGroup());
		return mav;
	}

	@RequestMapping("/module/edit.html")
	public ModelAndView gotoEditFunctionModulePage(String id) {
		ModelAndView mav = new ModelAndView("function/module/edit");
		FunctionalModule fm = fmService.findById(id);
		mav.addObject("fm", fm);
		// 查询所有的功能组
		mav.addObject("functionGroups", fmService.getAllFunctionGroup());
		return mav;
	}

}
