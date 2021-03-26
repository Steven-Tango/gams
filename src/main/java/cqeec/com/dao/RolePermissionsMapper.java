package cqeec.com.dao;

import java.util.List;
import cqeec.com.gams.entity.RolePermissions;

/*
 * 角色权限Mapper(访问数据接口)
 * */
public interface RolePermissionsMapper {
	
	
	/*
	 * 统计所有记录数
	 * */
	public long cunt();
	
	
	/*
	 * 查询所有角色权限信息
	 * */
	public List<RolePermissions> findAll(); 
	
	/*
	 * 根据角色权限标识查询角色权限信息
	 * id：角色权限标识
	 * 角色权限信息
	 * */
	public RolePermissions findById(String id);
	
	/*
	 * 不带条件的分页查询
	 * 	pageNumber 页码
	 *  pageSize 每页记录数
	 * 	 * */
	public List<RolePermissions> findPage(int pageNumber,int pageSize);
	
	/*
	 * 根据角色权限标识插入角色权限信息
	 * * */
	public void insert(RolePermissions entity);
	
	/*
	 * 根据角色权限标识修改角色权限信息
	 * * */
	public void update(RolePermissions entity);
	
	/*
	 * 根据角色权限标识删除角色权限信息
	 * * */
	public void delete(String id);
	
	
}
