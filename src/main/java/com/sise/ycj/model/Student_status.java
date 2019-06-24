package com.sise.ycj.model;

public class Student_status {
	private int sid;
	private String uaccount;
	private	String schoolName;
	private String yuanXi;
	private String zhuanYe;
	private String xueLi;
	private String ruxueYear;
	
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getUaccount() {
		return uaccount;
	}
	public void setUaccount(String uaccount) {
		this.uaccount = uaccount;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public String getYuanXi() {
		return yuanXi;
	}
	public void setYuanXi(String yuanXi) {
		this.yuanXi = yuanXi;
	}
	public String getZhuanYe() {
		return zhuanYe;
	}
	public void setZhuanYe(String zhuanYe) {
		this.zhuanYe = zhuanYe;
	}
	public String getXueLi() {
		return xueLi;
	}
	public void setXueLi(String xueLi) {
		this.xueLi = xueLi;
	}
	public String getRuxueYear() {
		return ruxueYear;
	}
	public void setRuxueYear(String ruxueYear) {
		this.ruxueYear = ruxueYear;
	}
	@Override
	public String toString() {
		return "Student_status [sid=" + sid + ", uaccount=" + uaccount + ", schoolName=" + schoolName + ", yuanXi="
				+ yuanXi + ", zhuanYe=" + zhuanYe + ", xueLi=" + xueLi + ", ruxueYear=" + ruxueYear + "]";
	}
	
	
}
