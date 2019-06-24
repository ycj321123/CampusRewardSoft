package com.sise.ycj.dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.sise.ycj.dao.BaseDao;
import com.sise.ycj.model.Receive_msg;

@Repository("receive_msgDao")
public class Receive_msgDao extends BaseDao {

	//添加接收的消息
	public void add(Receive_msg receive_msg) {
		getSqlSessionTemplate().insert(Receive_msg.class.getName()+".addReceive_msg", receive_msg);
	}

	//删除接收的消息
	public void delete(String rAccount) {
		getSqlSessionTemplate().delete(Receive_msg.class.getName()+".deleteReceive_msg", rAccount);
	}

	//修改接收的消息updateUserByAccount
	public void update(Receive_msg receive_msg) {
		getSqlSessionTemplate().update(Receive_msg.class.getName()+".updateReceive_msgByPaccount", receive_msg);
	}

	//据id查看接收的消息
	public Receive_msg load(String rAccount) {
		return (Receive_msg)getSqlSessionTemplate().selectOne(Receive_msg.class.getName()+".getReceive_msgByRaccount", rAccount);
	}
	
	//据账号查找接收的消息
	public List<Receive_msg> load() {
		return getSqlSessionTemplate().selectList(Receive_msg.class.getName()+".getReceive_msg", "");
	}

}
