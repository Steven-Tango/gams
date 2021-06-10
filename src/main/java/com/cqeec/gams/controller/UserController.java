package com.cqeec.gams.controller;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cqeec.gams.entity.Account;
import com.cqeec.gams.service.AccountService;

@Controller
@RequestMapping("/app/user/")
public class UserController {
	@Autowired
	private AccountService accountService;

	@RequestMapping("/update.html")
	public ModelAndView update(Account account) {
		ModelAndView mav = new ModelAndView("user/edit");
		Boolean disabled = account.getDisabled();
		if (disabled == null) {
			account.setDisabled(false);
		}
		try {
			accountService.update(account);
			mav.addObject("message", "保存数据成功！");
		} catch (Exception e) {
			mav.addObject("message", "保存数据失败！");
		}
		mav.addObject("obj", account);
		return mav;
	}

	@RequestMapping("/delete.html")
	public ModelAndView delete(String id) {
		ModelAndView mav = new ModelAndView("redirect:/app/user/list.html");
		try {
			accountService.delete(id);
			mav.addObject("message", "删除数据成功！");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("message", "删除数据失败！");
		}
		return mav;
	}

	@RequestMapping("/save.html")
	public ModelAndView save(Account account, RedirectAttributes ra) {
		String id = account.getId();
		if (id == null || "".equals(id)) {
			account.setId(UUID.randomUUID().toString().toUpperCase());
		}
		ModelAndView mav = new ModelAndView();
		try {
			accountService.insert(account);
			ra.addFlashAttribute("message", "保存数据成功！");
			mav.setViewName("redirect:/app/user/add.html");
		} catch (Exception e) {
			ra.addFlashAttribute("message", "保存数据失败！");
			mav.setViewName("user/add");
		}
		return mav;
	}

	@RequestMapping("/list.html")
	public String gotoMainPage() {
		return "user/list";
	}

	@RequestMapping("/add.html")
	public String gotoAddPage() {
		return "user/add";
	}

	@RequestMapping("/edit.html")
	public String gotoEditPage(String id, Model model) {
		Account account = accountService.findById(id);
		model.addAttribute("obj", account);
		return "user/edit";
	}

}
