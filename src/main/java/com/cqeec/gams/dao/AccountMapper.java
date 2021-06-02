package com.cqeec.gams.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cqeec.gams.entity.Account;

/*
 * 账户Mapper(访问数据接口)
 * */
public interface AccountMapper {
	
	
	/*
	 * 统计所有记录数
	 * */
	public long count();
	
	
	/*
	 * 查询所有账户信息
	 * */
	public List<Account> findAll(); 
	
	/*
	 * 根据账户标识查询账户信息
	 * id：账户标识
	 * 账户信息
	 * */
	public Account findById(String id);
	
	/*
	 * 不带条件的分页查询
	 * 	pageNumber 页码
	 *  pageSize 每页记录数
	 * 	 * */
	public List<Account> findPage(@Param("pageNumber")int pageNumber,@Param("pageSize")int pageSize);
	
	/*
	 * 根据账户标识插入账户信息
	 * * */
	public void insert(Account entity);
	
	/*
	 * 根据账户标识修改账户信息
	 * * */
	public void update(Account entity);
	
	/*
	 * 根据账户标识删除账户信息
	 * * */
	public void delete(String id);


	public Account findByNameAndPassword(@Param("name") String name, @Param("password") String password);
	
	
}
