package com.sise.ycj.model;

public class Oder {
	private String oderid;		//订单id（11位）
	private String pid;		//任务发布id(11)
	private int isDelete;
	private Publish_job publish_job;
	
	public String getOderid() {
		return oderid;
	}
	public void setOderid(String oderid) {
		this.oderid = oderid;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	
	public int getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
	public Publish_job getPublish_job() {
		return publish_job;
	}
	
	public void setPublish_job(Publish_job publish_job) {
		this.publish_job = publish_job;
	}
	
	
}
