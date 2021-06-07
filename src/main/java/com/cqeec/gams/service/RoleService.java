package com.cqeec.gams.service;

import java.util.List;

import com.cqeec.gams.entity.Role;
import com.cqeec.gams.service.core.BasesService;

/*
 * 角色服务
 * */
public interface RoleService extends BasesService<Role> {

	List<Role> findByConditionPage(int pageNumber, int pageSize, Role role);

	long count(Role role);

}
