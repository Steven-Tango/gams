package com.cqeec.gams.service;

import java.util.Map;

import com.cqeec.gams.entity.Account;
import com.cqeec.gams.service.core.BasesService;

public interface AccountService extends BasesService<Account> {
	/**
	 * 登录。
	 * 
	 * @param name     用户名。
	 * @param password 用户密码。
	 * @return 登录成功，返回登录的账户信息；登录失败返回null。
	 */

	public Account login(String name, String password);

	public Map<String, Object> updatePassword(String id, String oldPassword, String newPassword,
			String confirmPassword);

}
