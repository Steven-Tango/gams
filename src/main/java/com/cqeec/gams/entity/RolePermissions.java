package com.cqeec.gams.entity;

public class RolePermissions {
	private String id;
	private String role;//角色标识
	private String FunctionalModule;//功能模块标识
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getFunctionalModule() {
		return FunctionalModule;
	}
	public void setFunctionalModule(String functionalModule) {
		FunctionalModule = functionalModule;
	}
}
