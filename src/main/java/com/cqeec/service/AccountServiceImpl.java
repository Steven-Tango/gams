package com.cqeec.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqeec.dao.AccountMapper;
import com.cqeec.gams.entity.Account;
import com.cqeec.gams.entity.Role;

@Service
public class AccountServiceImpl implements AccountService{
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

}
