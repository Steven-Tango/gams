package cqeec.com.gams.entity;

public class Account {
	private String id;
	private String name;
	private String loginName;
	private String password;
	private Boolean disable;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Boolean getDisable() {
		return disable;
	}
	public void setDisable(Boolean disable) {
		this.disable = disable;
	}
}
