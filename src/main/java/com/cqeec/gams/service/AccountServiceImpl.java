package com.cqeec.gams.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqeec.gams.dao.AccountMapper;
import com.cqeec.gams.entity.Account;
import com.cqeec.gams.entity.Role;

@Service
public class AccountServiceImpl implements AccountService {
	@Autowired
	private AccountMapper accountMapper;

	@Override
	public long count() {
		return accountMapper.count();
	}

	@Override
	public List<Account> findAll() {
		return accountMapper.findAll();
	}

	@Override
	public Account findById(String id) {
		return accountMapper.findById(id);
	}

	@Override
	public List<Account> findPage(int pageNumber, int pageSize) {
		return accountMapper.findPage(pageNumber, pageSize);
	}

	@Override
	public void insert(Account entity) {
		accountMapper.insert(entity);
	}

	@Override
	public void update(Account entity) {
		accountMapper.update(entity);
	}

	@Override
	public void delete(String id) {
		accountMapper.delete(id);
	}

	@Override
	public Account login(String name, String password) {
		return accountMapper.findByNameAndPassword(name, password);
	}

	@Override
	public Map<String, Object> updatePassword(String id, String oldPassword, String newPassword,
			String confirmPassword) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (!newPassword.equals(confirmPassword)) {
			map.put("code", 1);
			map.put("message", "新密码与确认密码不一致！");
			return map;
		}
		Account account = accountMapper.findById(id);
		if (!account.getPassword().equals(oldPassword)) {
			map.put("code", 2);
			map.put("message", "用户原密码错误！");
			return map;
		}
		account = new Account();
		account.setId(id);
		account.setPassword(newPassword);
		try {
			accountMapper.update(account);
			map.put("code", 0);
			map.put("message", "密码修改成功！");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("code", 3);
			map.put("message", "密码修改失败！");
		}
		return map;
	}

}
