package com.sise.ycj.model;

public class Publish_msg {
	private int pMsgid; 		//消息发布id （自增）   
	private String pAccount;			//消息发布者id
	private String pContent;			//消息内容
	private String pTime;			//发布时间
	private int isDelete;			//是否删除
	private String pFile;
	private String SendToWho;
	private int isRead;
	
	public int getpMsgid() {
		return pMsgid;
	}
	public void setpMsgid(int pMsgid) {
		this.pMsgid = pMsgid;
	}
	public String getpAccount() {
		return pAccount;
	}
	public void setpAccount(String pAccount) {
		this.pAccount = pAccount;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public String getpTime() {
		return pTime;
	}
	public void setpTime(String pTime) {
		this.pTime = pTime;
	}
	public int getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
	public String getpFile() {
		return pFile;
	}
	public void setpFile(String pFile) {
		this.pFile = pFile;
	}
	public String getSendToWho() {
		return SendToWho;
	}
	public void setSendToWho(String sendToWho) {
		SendToWho = sendToWho;
	}
	public int getIsRead() {
		return isRead;
	}
	public void setIsRead(int isRead) {
		this.isRead = isRead;
	}

	
}
