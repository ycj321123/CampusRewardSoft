package com.sise.ycj.model;

public class Publish_job {
	private String pId;			//job发布id（11位）
	private String pAccount;			//发布者
	private	String pTitle;			//发布标题
	private String pContent;			//发布内容
	private	String timeLimit;			//任务期限
	private	int jobLevel;			//任务级别
	private	float price;			//价格
	private	String pTime;			//发布时间
	private	int isComplish;			//完成情况
	private	int isDelete;			//是否删除
	private Student_status student_status;
	
	public String getPId() {
		return pId;
	}
	public void setPId(String pId) {
		this.pId = pId;
	}
	
	public String getpAccount() {
		return pAccount;
	}
	public void setpAccount(String pAccount) {
		this.pAccount = pAccount;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public String getTimeLimit() {
		return timeLimit;
	}
	public void setTimeLimit(String timeLimit) {
		this.timeLimit = timeLimit;
	}
	public int getJobLevel() {
		return jobLevel;
	}
	public void setJobLevel(int jobLevel) {
		this.jobLevel = jobLevel;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getpTime() {
		return pTime;
	}
	public void setpTime(String pTime) {
		this.pTime = pTime;
	}
	public int getIsComplish() {
		return isComplish;
	}
	public void setIsComplish(int isComplish) {
		this.isComplish = isComplish;
	}
	public int getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
	
	public Student_status getStudent_status() {
		return student_status;
	}
	public void setStudent_status(Student_status student_status) {
		this.student_status = student_status;
	}
	@Override
	public String toString() {
		return "Publish_job [pId=" + pId + ", pAccount=" + pAccount + ", pTitle=" + pTitle + ", pContent=" + pContent
				+ ", timeLimit=" + timeLimit + ", jobLevel=" + jobLevel + ", price=" + price + ", pTime=" + pTime
				+ ", isComplish=" + isComplish + ", isDelete=" + isDelete + "]";
	}
	
	
}
