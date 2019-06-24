package com.sise.ycj.service;

import java.util.List;

import com.sise.ycj.model.Publish_job;
import com.sise.ycj.model.Receive_job;
import com.sise.ycj.model.Receive_msg;

public interface IReceive_msgService {

	// 添加接收的消息
	public void add(Receive_msg receive_msg);

	// 删除接收的消息
	public void delete(String rAccount);

	// 修改接收的消息updateUserByAccount
	public void update(Receive_msg receive_msg);

	// 据id查看接收的消息
	public Receive_msg load(String rAccount);

	// 据账号查找接收的消息
	public List<Receive_msg> load();
}
