package com.sise.ycj.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sise.ycj.dao.Receive_msgDao;
import com.sise.ycj.model.Receive_msg;
import com.sise.ycj.service.IReceive_msgService;

@Service("receive_msgService")
public class Receive_msgService implements IReceive_msgService {

	@Resource
	private Receive_msgDao receive_msgDao;
	
	public void add(Receive_msg receive_msg) {
		receive_msgDao.add(receive_msg);
	}

	public void delete(String rAccount) {
		receive_msgDao.delete(rAccount);
	}

	public void update(Receive_msg receive_msg) {
		receive_msgDao.update(receive_msg);
	}

	public Receive_msg load(String rAccount) {
		return receive_msgDao.load(rAccount);
	}

	public List<Receive_msg> load() {
		return receive_msgDao.load();
	}

}
