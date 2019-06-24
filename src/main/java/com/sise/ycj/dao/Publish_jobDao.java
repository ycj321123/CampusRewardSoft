package com.sise.ycj.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import com.sise.ycj.dao.BaseDao;
import com.sise.ycj.model.Publish_job;

@Repository("publish_jobDao")
public class Publish_jobDao extends BaseDao {

	// 添加发布的任务
	public void add(Publish_job publish_job) {
		getSqlSessionTemplate().insert(Publish_job.class.getName() + ".addPublish_job", publish_job);
	}

	// 删除发布的任务
	public void delete(String pId) {
		getSqlSessionTemplate().delete(Publish_job.class.getName() + ".deletePublish_job", pId);
	}

	// 修改发布的任务updateUserByAccount
	public void update(Publish_job publish_job) {
		getSqlSessionTemplate().update(Publish_job.class.getName() + ".updatePublish_jobByPaccount", publish_job);
	}

	// 据id查看发布的任务
	public Publish_job loadByPid(String pId) {
		return (Publish_job) getSqlSessionTemplate().selectOne(Publish_job.class.getName() + ".getPublish_jobByPid",
				pId);
	}

	// 据id查看发布的任务(不管任务删除)
	public Publish_job loadByPidAnd(String pId) {
		return (Publish_job) getSqlSessionTemplate().selectOne(Publish_job.class.getName() + ".getPublish_jobByPidAnd",
				pId);
	}

	// 据账号查找发布的任务
	public List<Publish_job> loadByPaccount(String paccount) {
		return getSqlSessionTemplate().selectList(Publish_job.class.getName() + ".getPublish_jobByPaccount", paccount);
	}

	// 据任务级别查找发布的任务
	public List<Publish_job> loadByJobLevel(Publish_job publish_job) {
		return getSqlSessionTemplate().selectList(Publish_job.class.getName() + ".getPublish_jobByLevel", publish_job);
	}

	// 据任务级别查找发布的任务
	public List<Publish_job> load(Map map) {
		return getSqlSessionTemplate().selectList(Publish_job.class.getName() + ".getPublish_jobByPandT", map);
	}

	// 查找发布的任务
	public List loadByAssociation(String schoolName) {
		return getSqlSessionTemplate().selectList(Publish_job.class.getName() + ".getPublish_jobIndex", schoolName);
	}

	// 查找发布的任务
	public List<Publish_job> load2(String school) {
		return getSqlSessionTemplate().selectList(Publish_job.class.getName() + ".getPublish_job", school);
	}

	// 查找发布的任务
	public List<Publish_job> loadByName(Map map) {
		return getSqlSessionTemplate().selectList(Publish_job.class.getName() + ".getPublish_jobByName", map);
	}

	// 查找发布的任务
	public int loadCount(Map map) {
		return getSqlSessionTemplate().selectOne(Publish_job.class.getName() + ".getCount", map);
	}

	// 查找发布的任务
	public List<Publish_job> loadByNameTwo(Map map) {
		return getSqlSessionTemplate().selectList(Publish_job.class.getName() + ".getPublish_jobByNameTwo", map);
	}

	// 查找发布的任务
	public int loadCountTwo(Map map) {
		return getSqlSessionTemplate().selectOne(Publish_job.class.getName() + ".getCountTwo", map);
	}
}
