package com.cqeec.gams.service.core;

import java.util.List;

import com.cqeec.gams.entity.Role;

/*
 * 基本服务（）
 * */
public interface BasesService<T> {
	/*
	 * 统计所有记录数
	 */
	public long count();

	/*
	 * 查询所有角色信息
	 */
	public List<T> findAll();

	/*
	 * 查询角色信息 id：角色标识 角色信息
	 */
	public T findById(String id);

	/*
	 * 不带条件的分页查询 pageNumber 页码 pageSize 每页记录数 *
	 */
	public List<T> findPage(int pageNumber, int pageSize);

	/*
	 * 根据角色标识插入角色信息 *
	 */
	public void insert(T entity);

	/*
	 * 根据角色标识修改角色信息 *
	 */
	public void update(T entity);

	/*
	 * 根据角色标识删除角色信息 *
	 */
	public void delete(String id);
}
