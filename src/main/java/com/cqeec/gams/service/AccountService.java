package com.cqeec.gams.service;
import java.util.Map;

import com.cqeec.gams.entity.Account;
import com.cqeec.gams.service.core.BasesService;

public interface AccountService extends BasesService<Account>{

		public Account login(String name, String password);

		public Map<String, Object> updatePassword(String id, String oldPassword, String newPassword,
			String confirmPassword);

}
