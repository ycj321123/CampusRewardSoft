package com.sise.ycj.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sise.ycj.dao.Publish_jobDao;
import com.sise.ycj.dao.Publish_msgDao;
import com.sise.ycj.model.Publish_msg;
import com.sise.ycj.service.IPublish_msgService;

@Service("publish_msgService")
public class Publish_msgService implements IPublish_msgService {

	@Resource
	private Publish_msgDao publish_msgDao;
	
	public void add(Publish_msg publish_msg) {
		publish_msgDao.add(publish_msg);
	}

	public void delete(String pAccount) {
		publish_msgDao.delete(pAccount);
	}

	public void update(Publish_msg publish_msg) {
		publish_msgDao.update(publish_msg);
	}

	public Publish_msg load(String pAccount) {
		return publish_msgDao.load(pAccount);
	}

	public List<Publish_msg> load() {
		return publish_msgDao.load();
	}

	public List<Publish_msg> loadByWhoAndWho(Map<String, Object> map) {
		return publish_msgDao.loadByWhoAndWho(map);
	}

	public List<Publish_msg> loadByPAndP(String account) {
		return publish_msgDao.loadByPAndP(account);
	}

	public Publish_msg loadByPAndW(Publish_msg pm) {
		return publish_msgDao.loadByPAndW(pm);
	}

	public List<Publish_msg> loadBya1(String account) {
		return publish_msgDao.loadBya1(account);
	}

	public Publish_msg loadById(int msgid) {
		return publish_msgDao.loadById(msgid);
	}

	public List<Publish_msg> loadByMeR(Map<String, Object> map) {
		return publish_msgDao.loadByMeR(map);
	}

}
