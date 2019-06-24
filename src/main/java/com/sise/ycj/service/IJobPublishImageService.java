package com.sise.ycj.service;

import java.util.List;

import com.sise.ycj.model.JobPublishImage;
public interface IJobPublishImageService {

	// 添加任务图片
	public void add(JobPublishImage jobPublishImage);

	// 删除任务图片
	public void delete(String pId);

	// 修改任务图片updateUserByAccount
	public void update(JobPublishImage jobPublishImage);

	// 据id查看任务图片
	public JobPublishImage load(String pId);

	// 据账号查找任务图片
	public List<JobPublishImage> load();

}
