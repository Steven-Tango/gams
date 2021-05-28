package com.cqeec.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cqeec.gams.entity.AccountRole;

/*
 * 账户角色Mapper(访问数据接口)
 * */
public interface AccountRoleMapper {
	
		/*
		 * 统计所有记录数
		 * */
		public long count();
		
		
		/*
		 * 查询所有账户角色信息
		 * */
		public List<AccountRole> findAll(); 
		
		/*
		 * 根据账户标识查询账户信息
		 * id：账户标识
		 * 账户信息
		 * */
		public AccountRoleMapper findById(String id);
		
		/*
		 * 不带条件的分页查询
		 * 	pageNumber 页码
		 *  pageSize 每页记录数
		 * 	 * */
		public List<AccountRole> findPage(@Param("pageNumber")int pageNumber,@Param("pageSize")int pageSize);
		
		/*
		 * 根据账户标识插入账户角色信息
		 * * */
		public void insert(AccountRole entity);
		
		/*
		 * 根据账户标识修改账户信息
		 * * */
		public void update(AccountRole entity);
		
		/*
		 * 根据账户标识删除账户信息
		 * * */
		public void delete(String id);
}

