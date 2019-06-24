package com.sise.ycj.util;

import com.sise.ycj.model.IDCardInfo;
import com.sise.ycj.model.Publish_msg;
import com.sise.ycj.model.User_info;

public class ChatTime {
	private Publish_msg pm;
	private String time;
	private User_info ui;
	private String ttime;
	private IDCardInfo idcard;
	public Publish_msg getPm() {
		return pm;
	}
	public void setPm(Publish_msg pm) {
		this.pm = pm;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public User_info getUi() {
		return ui;
	}
	public void setUi(User_info ui) {
		this.ui = ui;
	}
	public String getTtime() {
		return ttime;
	}
	public void setTtime(String ttime) {
		this.ttime = ttime;
	}
	public IDCardInfo getIdcard() {
		return idcard;
	}
	public void setIdcard(IDCardInfo idcard) {
		this.idcard = idcard;
	}

	
}
