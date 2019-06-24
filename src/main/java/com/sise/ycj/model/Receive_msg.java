package com.sise.ycj.model;

public class Receive_msg {
	private int rMsgid; 		//消息接收id （自增）   
	private String rAccount;			//消息接收者
	private String rContent;			//消息内容
	private String rTime;			//接收时间
	private int isDelete;			//是否删除
	public int getrMsgid() {
		return rMsgid;
	}
	public void setrMsgid(int rMsgid) {
		this.rMsgid = rMsgid;
	}
	public String getrAccount() {
		return rAccount;
	}
	public void setrAccount(String rAccount) {
		this.rAccount = rAccount;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
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
	
	
}
