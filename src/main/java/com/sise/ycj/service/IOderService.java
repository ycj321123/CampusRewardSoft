package com.sise.ycj.service;

import java.util.List;
import java.util.Map;

import com.sise.ycj.model.Oder;

public interface IOderService {
	public void delete(String oderid);

	public void update(Oder oder);

	public Oder load(String oderid);

	public void add(Oder oder);

	public List<Oder> load();

	// 据用户查看订单
	public List<Oder> loadByAccount(String account);

	// 据pid查看订单
	public Oder loadByPid(String pid);

	// 据账号查找订单getOder
	public List<Oder> loadByName(Map map);

	// 据账号查找订单getOder
	public int loadCount(Map map);
}
