package com.sise.ycj.model;

public class Goodfriend {
	private int fid;		//自增id
	private String myAccount;		//我的账号
	private String yourAccount;		//你的账号
	private int isdelete;		//是否删除
	private int addHMD;		//加入黑名单
	private int isAgree;
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public String getMyAccount() {
		return myAccount;
	}
	public void setMyAccount(String myAccount) {
		this.myAccount = myAccount;
	}
	public String getYourAccount() {
		return yourAccount;
	}
	public void setYourAccount(String yourAccount) {
		this.yourAccount = yourAccount;
	}
	public int getIsdelete() {
		return isdelete;
	}
	public void setIsdelete(int isdelete) {
		this.isdelete = isdelete;
	}
	public int getAddHMD() {
		return addHMD;
	}
	public void setAddHMD(int addHMD) {
		this.addHMD = addHMD;
	}
	public int getIsAgree() {
		return isAgree;
	}
	public void setIsAgree(int isAgree) {
		this.isAgree = isAgree;
	}
	
}
