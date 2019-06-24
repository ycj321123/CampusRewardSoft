package com.sise.ycj.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import com.sise.ycj.dao.BaseDao;
import com.sise.ycj.model.Publish_msg;

@Repository("publish_msgDao")
public class Publish_msgDao extends BaseDao {

	// 添加发布的消息
	public void add(Publish_msg publish_msg) {
		getSqlSessionTemplate().insert(Publish_msg.class.getName() + ".addPublish_msg", publish_msg);
	}

	// 删除发布的消息
	public void delete(String pAccount) {
		getSqlSessionTemplate().delete(Publish_msg.class.getName() + ".deletePublish_msg", pAccount);
	}

	// 修改发布的消息updateUserByAccount
	public void update(Publish_msg publish_msg) {
		getSqlSessionTemplate().update(Publish_msg.class.getName() + ".updatePublish_msgByPaccount", publish_msg);
	}

	// 据id查看发布的消息
	public Publish_msg load(String pAccount) {
		return (Publish_msg) getSqlSessionTemplate()
				.selectOne(Publish_msg.class.getName() + ".getPublish_msgByPaccount", pAccount);
	}

	// 据账号查找发布的消息
	public List<Publish_msg> load() {
		return getSqlSessionTemplate().selectList(Publish_msg.class.getName() + ".getPublish_msg", "");
	}

	public List<Publish_msg> loadByPAndP(String account) {
		return getSqlSessionTemplate().selectList(Publish_msg.class.getName() + ".getPublish_msgByPandP", account);
	}

	public Publish_msg loadByPAndW(Publish_msg pm) {
		return getSqlSessionTemplate().selectOne(Publish_msg.class.getName() + ".getPublish_msgByPandW", pm);
	}

	// 查找发布的消息
	public List<Publish_msg> loadByWhoAndWho(Map<String, Object> map) {
		return getSqlSessionTemplate().selectList(Publish_msg.class.getName() + ".getPublish_msgByPaccountAndWho", map);
	}

	// 根据id查找发布的消息
	public Publish_msg loadById(int pMsgid) {
		return getSqlSessionTemplate().selectOne(Publish_msg.class.getName() + ".getPublish_msgById", pMsgid);
	}

	public List<Publish_msg> loadByMeR(Map<String, Object> map) {
		return getSqlSessionTemplate().selectList(Publish_msg.class.getName() + ".getPublish_msgByMeR", map);
	}

	public List<Publish_msg> loadBya1(String account) {
		return getSqlSessionTemplate().selectList(Publish_msg.class.getName() + ".getPublish_msgBya1", account);
	}
}
