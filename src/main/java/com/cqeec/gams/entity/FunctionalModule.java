package com.cqeec.gams.entity;

public class FunctionalModule {
	private String id;
	private String type;// 类型（1:功能组2:功能模块）
	private String parent;// 所属功能组标识
	private String name;// 模块代码
	private String code;// 模块代码URl

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getParent() {
		return parent;
	}

	public void setParent(String parent) {
		this.parent = parent;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
}
