package com.sise.ycj.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import com.sise.ycj.dao.BaseDao;
import com.sise.ycj.model.Receive_job;

@Repository("receive_jobDao")
public class Receive_jobDao extends BaseDao {

	// 添加接收的任务
	public void add(Receive_job receive_job) {
		getSqlSessionTemplate().insert(Receive_job.class.getName() + ".addReceive_job", receive_job);
	}

	// 删除接收的任务
	public void delete(String pId) {
		getSqlSessionTemplate().delete(Receive_job.class.getName() + ".deleteReceive_job", pId);
	}

	// 修改接收的任务updateUserByAccount
	public void update(Receive_job receive_job) {
		getSqlSessionTemplate().update(Receive_job.class.getName() + ".updateReceive_jobByPid", receive_job);
	}

	// 据id查看接收的任务
	public Receive_job loadByPid(String pid) {
		return (Receive_job) getSqlSessionTemplate().selectOne(Receive_job.class.getName() + ".getReceive_jobByPid",
				pid);
	}

	// 据账号查找接收的任务
	public List<Receive_job> loadByRaccount(String rAccount) {
		return getSqlSessionTemplate().selectList(Receive_job.class.getName() + ".getReceive_jobByRaccount", rAccount);
	}

	// 查找接收的任务
	public List<Receive_job> load() {
		return getSqlSessionTemplate().selectList(Receive_job.class.getName() + ".getReceive_job", "");
	}

	// 查找接收的任务
	public List<Receive_job> loadByName(Map map) {
		return getSqlSessionTemplate().selectList(Receive_job.class.getName() + ".getReceive_jobByName", map);
	}

	// 查找接收的任务
	public int loadCount(Map map) {
		return getSqlSessionTemplate().selectOne(Receive_job.class.getName() + ".getCount", map);
	}
}
