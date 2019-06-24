package com.sise.ycj.service;

import java.util.List;
import java.util.Map;

import com.sise.ycj.model.Publish_job;
import com.sise.ycj.model.Receive_job;

public interface IReceive_jobService {

	// 添加接收的任务
	public void add(Receive_job receive_job);

	// 删除接收的任务
	public void delete(String pId);

	// 修改接收的任务updateUserByAccount
	public void update(Receive_job receive_job);

	// 据id查看接收的任务
	public Receive_job loadByPid(String pid);

	// 据账号查找接收的任务
	public List<Receive_job> loadByRaccount(String rAccount);

	// 查找接收的任务
	public List<Receive_job> load();

	// 查找接收的任务
	public List<Receive_job> loadByName(Map map);

	// 查找接收的任务
	public int loadCount(Map map);
}
