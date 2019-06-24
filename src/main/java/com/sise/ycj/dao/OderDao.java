package com.sise.ycj.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.sise.ycj.dao.BaseDao;
import com.sise.ycj.model.Oder;

@Repository("oderDao")
public class OderDao extends BaseDao {

	// 添加
	public void add(Oder oder) {
		getSqlSessionTemplate().insert(Oder.class.getName() + ".addOder", oder);
	}

	// 删除订单
	public void delete(String oderid) {
		getSqlSessionTemplate().delete(Oder.class.getName() + ".updateOderByOderid", oderid);
	}

	// 修改订单
	public void update(Oder oder) {
		getSqlSessionTemplate().update(Oder.class.getName() + ".updateOderByOderid", oder);
	}

	// 据id查看订单
	public Oder load(String oderid) {
		return (Oder) getSqlSessionTemplate().selectOne(Oder.class.getName() + ".getOderByOderid", oderid);
	}

	// 据用户查看订单
	public List<Oder> loadByAccount(String account) {
		return getSqlSessionTemplate().selectList(Oder.class.getName() + ".getOderByAccount", account);
	}

	// 据pid查看订单
	public Oder loadByPid(String pid) {
		return (Oder) getSqlSessionTemplate().selectOne(Oder.class.getName() + ".getOderByPid", pid);
	}

	// 据账号查找订单
	public List<Oder> load() {
		return getSqlSessionTemplate().selectList(Oder.class.getName() + ".getOder", "");
	}

	// 据账号查找订单getOder
	public List<Oder> loadByName(Map map) {
		return getSqlSessionTemplate().selectList(Oder.class.getName() + ".getOderByName", map);
	}

	// 据账号查找订单getOder
	public int loadCount(Map map) {
		return getSqlSessionTemplate().selectOne(Oder.class.getName() + ".getCount", map);
	}

}
