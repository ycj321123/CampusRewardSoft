package com.sise.ycj.service;

import java.util.List;
import java.util.Map;

import com.sise.ycj.model.Publish_job;

public interface IPublish_jobService {

	// 添加发布的任务
	public void add(Publish_job publish_job);

	// 删除发布的任务
	public void delete(String pId);

	// 修改发布的任务updateUserByAccount
	public void update(Publish_job publish_job);

	// 据id查看发布的任务
	public Publish_job loadByPid(String pid);

	// 据id查看发布的任务(不管删除)
	public Publish_job loadByPidAnd(String pId);

	// 据账号查找发布的任务
	public List<Publish_job> loadByPaccount(String pAccount);

	// 据任务级别查找发布的任务
	public List<Publish_job> loadByJobLevel(Publish_job publish_job);

	public List<Publish_job> load(Map map);

	// 查找发布的任务
	public List loadByAssociation(String schoolName);

	// 查找发布的任务
	public List<Publish_job> load2(String school);

	// 查找发布的任务
	public List<Publish_job> loadByName(Map map);

	// 查找发布的任务
	public int loadCount(Map map);

	// 查找发布的任务
	public List<Publish_job> loadByNameTwo(Map map);

	// 查找发布的任务
	public int loadCountTwo(Map map);
}
