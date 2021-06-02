package com.cqeec.gams.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cqeec.gams.entity.Account;
import com.cqeec.gams.service.AccountService;

@Controller
public class LoginController {
	@Autowired
	private AccountService accountService;
	
	@RequestMapping("/user/singin.html")
	public ModelAndView login(String name, String password, String code, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		
		// 验证验证码
		Object obj = session.getAttribute("KAPTCHA_SESSION_KEY");
		if (obj == null) {
			mav.setViewName("redirect:/login.html");
			return mav;
		}
		String sysCode = (String) obj;
		if (!sysCode.equals(code)) {
			mav.setViewName("login");
			mav.addObject("name", name);
			mav.addObject("message", "验证码错误!");
			return mav;
		}
		// 验证用户
		Account account = accountService.login(name, password);
		if (account == null) {
			mav.setViewName("login");
			mav.addObject("name", name);
			mav.addObject("message", "用户名或密码错误!");
			return mav;
		}
		if (account.getDisabled()) {
			mav.setViewName("login");
			mav.addObject("name", name);
			mav.addObject("message", "用户已被禁用，不能登录!");
			return mav;
		}
		session.setAttribute("account", account);
		mav.setViewName("redirect:/app/main.html");
		return mav;
	}
	
	@RequestMapping({ "/", "login.html" })
	public String gotoLoginPage() {
		return "login";
	}
}
