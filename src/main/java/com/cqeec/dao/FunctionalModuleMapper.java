package com.cqeec.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cqeec.gams.entity.FunctionalModule;

/*
 * 功能模块Mapper(访问数据接口)
 * */
public interface FunctionalModuleMapper {
	
	
	/*
	 * 统计所有记录数
	 * */
	public long count();
	
	
	/*
	 * 查询所有功能模块信息
	 * */
	public List<FunctionalModule> findAll(); 
	
	/*
	 * 根据功能模块标识查询功能模块信息
	 * id：功能模块标识
	 * 功能模块信息
	 * */
	public FunctionalModule findById(String id);
	
	/*
	 * 不带条件的分页查询
	 * 	pageNumber 页码
	 *  pageSize 每页记录数
	 * 	 * */
	public List<FunctionalModule> findPage(@Param("pageNumber")int pageNumber,@Param("pageSize")int pageSize);
	
	/*
	 * 根据功能模块标识插入功能模块信息
	 * * */
	public void insert(FunctionalModule entity);
	
	/*
	 * 根据功能模块标识修改功能模块信息
	 * * */
	public void update(FunctionalModule entity);
	
	/*
	 * 根据功能模块标识删除功能模块信息
	 * * */
	public void delete(String id);
	
	
}
