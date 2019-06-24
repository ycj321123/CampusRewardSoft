package com.sise.ycj.model;

public class Receive_job {
	private int rId;			//任务接收id（自增）
	private String pId;			//job发布id
	private String rAccount;			//发布者
	private	String rTime;			//接收时间
	private	int isDelete;			//是否删除
	private	String okTime;
	public int getrId() {
		return rId;
	}
	public void setrId(int rId) {
		this.rId = rId;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public String getrAccount() {
		return rAccount;
	}
	public void setrAccount(String rAccount) {
		this.rAccount = rAccount;
	}
	public String getrTime() {
		return rTime;
	}
	public void setrTime(String rTime) {
		this.rTime = rTime;
	}
	public int getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
	public String getOkTime() {
		return okTime;
	}
	public void setOkTime(String okTime) {
		this.okTime = okTime;
	}
	
	
	
}
