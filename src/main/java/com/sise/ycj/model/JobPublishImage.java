package com.sise.ycj.model;

public class JobPublishImage {
	private int id;	//自增
	private String pId;		//任务id
	private String pImage;		//任务图片
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public String getpImage() {
		return pImage;
	}
	public void setpImage(String pImage) {
		this.pImage = pImage;
	}
	@Override
	public String toString() {
		return "JobPublishImage [id=" + id + ", pId=" + pId + ", pImage=" + pImage + "]";
	}
	
}
