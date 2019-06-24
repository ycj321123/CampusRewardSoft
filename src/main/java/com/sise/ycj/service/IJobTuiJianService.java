package com.sise.ycj.service;

import java.util.List;

import com.sise.ycj.model.JobTuiJian;

public interface IJobTuiJianService {

	// 添加
	public void add(JobTuiJian jobTuiJian);

	// 修改
	public void update(JobTuiJian jobTuiJian);

	// 查看
	public List<JobTuiJian>  load();
}
