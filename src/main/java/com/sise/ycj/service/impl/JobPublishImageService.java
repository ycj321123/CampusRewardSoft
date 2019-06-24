package com.sise.ycj.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.sise.ycj.dao.JobPublishImageDao;
import com.sise.ycj.model.JobPublishImage;
import com.sise.ycj.service.IJobPublishImageService;

@Service("jobPublishImageService")
public class JobPublishImageService implements IJobPublishImageService{
	
	@Resource
	private JobPublishImageDao jobPublishImageDao;

	public void add(JobPublishImage jobPublishImage) {
		jobPublishImageDao.add(jobPublishImage);
	}

	public void delete(String pId) {
		jobPublishImageDao.delete(pId);
	}

	public void update(JobPublishImage jobPublishImage) {
		jobPublishImageDao.update(jobPublishImage);
	}

	public JobPublishImage load(String pId) {
		return jobPublishImageDao.load(pId);
	}

	public List<JobPublishImage> load() {
		return jobPublishImageDao.load();
	}

	
}
