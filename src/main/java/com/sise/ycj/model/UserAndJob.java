package com.sise.ycj.model;

import java.util.List;

public class UserAndJob {
	private User_info user_info;
	private Publish_job publish_job;
	private Receive_job receive_job;
	private String outTime;
	private Oder oder;
	private String text;
	
	public User_info getUser_info() {
		return user_info;
	}
	public void setUser_info(User_info user_info) {
		this.user_info = user_info;
	}
	public Publish_job getPublish_job() {
		return publish_job;
	}
	public void setPublish_job(Publish_job publish_job) {
		this.publish_job = publish_job;
	}
	
	public Receive_job getReceive_job() {
		return receive_job;
	}
	public void setReceive_job(Receive_job receive_job) {
		this.receive_job = receive_job;
	}
	public String getOutTime() {
		return outTime;
	}
	public void setOutTime(String outTime) {
		this.outTime = outTime;
	}
	
	
	public Oder getOder() {
		return oder;
	}
	public void setOder(Oder oder) {
		this.oder = oder;
	}
	
	
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	@Override
	public String toString() {
		return "UserAndJob [user_info=" + user_info + ", publish_job=" + publish_job + ", outTime=" + outTime
				+ ", getUser_info()=" + getUser_info() + ", getPublish_job()=" + getPublish_job() + ", getOutTime()="
				+ getOutTime() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
		
}
