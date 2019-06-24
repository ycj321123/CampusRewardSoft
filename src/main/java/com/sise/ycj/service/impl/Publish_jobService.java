package com.sise.ycj.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sise.ycj.dao.Publish_jobDao;
import com.sise.ycj.model.Publish_job;
import com.sise.ycj.service.IPublish_jobService;

@Service("publish_jobService")
public class Publish_jobService implements IPublish_jobService {

	@Resource
	private Publish_jobDao publish_jobDao;
	public void add(Publish_job publish_job) {
		publish_jobDao.add(publish_job);
	}

	public void delete(String pId) {
		publish_jobDao.delete(pId);
	}

	public void update(Publish_job publish_job) {
		publish_jobDao.update(publish_job);
	}

	public Publish_job loadByPid(String pId) {
		return publish_jobDao.loadByPid(pId);
	}

	public List<Publish_job> loadByPaccount(String paccount) {
		return publish_jobDao.loadByPaccount(paccount);
	}

	public List<Publish_job> load2(String school) {
		return publish_jobDao.load2(school);
	}

	public List<Publish_job> loadByJobLevel(Publish_job publish_job) {
		
		return publish_jobDao.loadByJobLevel(publish_job);
	}

	public List<Publish_job> load(Map map) {
		return publish_jobDao.load(map);
	}

	public List loadByAssociation(String schoolName) {
		return publish_jobDao.loadByAssociation(schoolName);
	}

	public Publish_job loadByPidAnd(String pId) {
		return publish_jobDao.loadByPidAnd(pId);
	}

	public List<Publish_job> loadByName(Map map) {
		return publish_jobDao.loadByName(map);
	}

	public int loadCount(Map map) {
		return publish_jobDao.loadCount(map);
	}

	public List<Publish_job> loadByNameTwo(Map map) {
		return publish_jobDao.loadByNameTwo(map);
	}

	public int loadCountTwo(Map map) {
		return publish_jobDao.loadCountTwo(map);
	}

}
