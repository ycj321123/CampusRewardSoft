package com.sise.ycj.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sise.ycj.dao.JobTuiJianDao;
import com.sise.ycj.model.JobTuiJian;
import com.sise.ycj.service.IJobTuiJianService;

@Service("jobTuiJianService")
public class JobTuiJianService implements IJobTuiJianService {

	@Resource
	private JobTuiJianDao jobTuiJianDao;
	
	public void add(JobTuiJian jobTuiJian) {
		jobTuiJianDao.add(jobTuiJian);
	}

	public void update(JobTuiJian jobTuiJian) {
		jobTuiJianDao.update(jobTuiJian);
	}

	public List<JobTuiJian>  load() {
		return jobTuiJianDao.load();
	}

}
