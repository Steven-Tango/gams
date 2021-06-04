package com.cqeec.gams.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cqeec.gams.entity.Account;
import com.cqeec.gams.service.AccountService;

@RestController
@RequestMapping("/api/user/")
public class UserRestController {
	@Autowired
	private AccountService accountService;

	@GetMapping("/list/all")
	public List<Account> getAll() {
		return accountService.findAll();
	}

	@PostMapping("/change/password")
	public Map<String, Object> changePassword(String id, String oldPassword, String newPassword,
			String confirmPassword) {
		return accountService.updatePassword(id, oldPassword, newPassword, confirmPassword);
	}
}
