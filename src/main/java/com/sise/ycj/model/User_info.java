package com.sise.ycj.model;

public class User_info {
	private int uid;
	private String uaccount;
	private String realname;
	private	String nickname;
	private int sex;
	private String birthday;
	private	String addr;
	private String headsrc;
	private int hasMsg;
	

	public String getUaccount() {
		return uaccount;
	}
	public void setUaccount(String uaccount) {
		this.uaccount = uaccount;
	}
	public String getHeadsrc() {
		return headsrc;
	}
	public void setHeadsrc(String headsrc) {
		this.headsrc = headsrc;
	}

	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getHasMsg() {
		return hasMsg;
	}
	public void setHasMsg(int hasMsg) {
		this.hasMsg = hasMsg;
	}
	@Override
	public String toString() {
		return "User_info [uid=" + uid + ", uaccount=" + uaccount + ", realname=" + realname + ", nickname="
				+ nickname + ", sex=" + sex + ", birthday=" + birthday + ", addr=" + addr + ", headsrc=" + headsrc
				+ "]";
	}
	
	
}
