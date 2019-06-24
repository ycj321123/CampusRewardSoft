package com.sise.ycj.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.sise.ycj.dao.Receive_jobDao;
import com.sise.ycj.model.Receive_job;
import com.sise.ycj.service.IReceive_jobService;

@Service("receive_jobService")
public class Receive_jobService implements IReceive_jobService {

	@Resource
	private Receive_jobDao receive_jobDao;

	public void add(Receive_job receive_job) {
		receive_jobDao.add(receive_job);
	}

	public void delete(String pId) {
		receive_jobDao.delete(pId);
	}

	public void update(Receive_job receive_job) {
		receive_jobDao.update(receive_job);
	}

	public Receive_job loadByPid(String pid) {
		return receive_jobDao.loadByPid(pid);
	}

	public List<Receive_job> loadByRaccount(String rAccount) {
		return receive_jobDao.loadByRaccount(rAccount);
	}

	public List<Receive_job> load() {
		return receive_jobDao.load();
	}

	public List<Receive_job> loadByName(Map map) {
		return receive_jobDao.loadByName(map);
	}

	public int loadCount(Map map) {
		return receive_jobDao.loadCount(map);
	}

}
