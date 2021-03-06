package com.cqeec.gams.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqeec.gams.dao.RoleMapper;
import com.cqeec.gams.entity.Role;

@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleMapper rolemapper;

	@Override
	public long count() {
		return rolemapper.count();
	}

	@Override
	public List<Role> findAll() {
		return rolemapper.findAll();
	}

	@Override
	public Role findById(String id) {
		return rolemapper.findById(id);
	}

	@Override
	public List<Role> findPage(int pageNumber, int pageSize) {
		return rolemapper.findPage(pageNumber, pageSize);
	}

	@Override
	public void insert(Role entity) {
		rolemapper.insert(entity);
	}

	@Override
	public void update(Role entity) {
		rolemapper.update(entity);
	}

	@Override
	public void delete(String id) {
		rolemapper.delete(id);
	}

	@Override
	public List<Role> findByConditionPage(int pageNumber, int pageSize, Role role) {
		return rolemapper.findByConditionPage(pageNumber, pageSize, role);
	}

	@Override
	public long count(Role role) {
		return rolemapper.countByCondition(role);
	}

}
