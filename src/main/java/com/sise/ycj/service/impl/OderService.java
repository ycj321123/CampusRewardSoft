package com.sise.ycj.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.sise.ycj.dao.OderDao;
import com.sise.ycj.model.Oder;
import com.sise.ycj.service.IOderService;

@Service("oderService")
public class OderService implements IOderService{
	
	@Resource
	private OderDao oderDao;

	public void delete(String oderid) {
		oderDao.delete(oderid);
	}

	public void update(Oder oder) {
		oderDao.update(oder);
	}

	public Oder load(String oderid) {
		return oderDao.load(oderid);
	}

	public void add(Oder oder) {
		oderDao.add(oder);
	}
	public List<Oder> load() {
		return oderDao.load();
	}

	public List<Oder> loadByAccount(String account) {
		return oderDao.loadByAccount(account);
	}

	public Oder loadByPid(String pid) {
		return oderDao.loadByPid(pid);
	}

	public List<Oder> loadByName(Map map) {
		return oderDao.loadByName(map);
	}

	public int loadCount(Map map) {
		return oderDao.loadCount(map);
	}
}
