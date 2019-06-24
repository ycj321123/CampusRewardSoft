package com.sise.ycj.model;

public class User{

	private int userid;
	private String account;
	private String username;
	private String password;
	private String email;
	private int creditIntegral;
	private int role;
	private String loginLimit;
	private float money;
	
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getCreditIntegral() {
		return creditIntegral;
	}
	public void setCreditIntegral(int creditIntegral) {
		this.creditIntegral = creditIntegral;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public String getLoginLimit() {
		return loginLimit;
	}
	public void setLoginLimit(String loginLimit) {
		this.loginLimit = loginLimit;
	}
	public float getMoney() {
		return money;
	}
	public void setMoney(float f) {
		this.money = f;
	}

}
