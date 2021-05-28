package com.cqeec.gams.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cqeec.gams.entity.Role;

/*
 * 角色Mapper(访问数据接口)
 * */
public interface RoleMapper {
	
	
	/*
	 * 统计所有记录数
	 * */
	public long count();
	
	
	/*
	 * 查询所有角色信息
	 * */
	public List<Role> findAll(); 
	
	/*
	 * 根据角色标识查询角色信息
	 * id：角色标识
	 * 角色信息
	 * */
	public Role findById(String id);
	
	/*
	 * 不带条件的分页查询
	 * 	pageNumber 页码
	 *  pageSize 每页记录数
	 * 	 * */
	public List<Role> findPage(@Param("pageNumber")int pageNumber,@Param("pageSize")int pageSize);
	
	/*
	 * 根据角色标识插入角色信息
	 * * */
	public void insert(Role entity);
	
	/*
	 * 根据角色标识修改角色信息
	 * * */
	public void update(Role entity);
	
	/*
	 * 根据角色标识删除角色信息
	 * * */
	public void delete(String id);
	
	
}
