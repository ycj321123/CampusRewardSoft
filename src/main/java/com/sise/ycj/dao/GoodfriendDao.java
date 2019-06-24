package com.sise.ycj.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import com.sise.ycj.model.Goodfriend;

@Repository("goodfriendDao")
public class GoodfriendDao extends BaseDao {

	// 添加好友
	public void add(Goodfriend goodfriend) {
		getSqlSessionTemplate().insert(Goodfriend.class.getName() + ".addGoodfriend", goodfriend);
	}

	// 删除好友
	public void delete(String yourAccount) {
		getSqlSessionTemplate().delete(Goodfriend.class.getName() + ".deleteGoodfriend", yourAccount);
	}

	// 修改好友updateUserByAccount
	public void update(Goodfriend goodfriend) {
		getSqlSessionTemplate().update(Goodfriend.class.getName() + ".updateGoodfriendByMyaccount", goodfriend);
	}

	// 据id查看好友
	public List<Goodfriend> load(String myAccount) {
		return getSqlSessionTemplate().selectList(Goodfriend.class.getName() + ".getGoodfriendByMyAccount",
				myAccount);
	}

	// 据id查看好友
	public Goodfriend loadByYourAccount(Goodfriend goodfriend) {
		return (Goodfriend) getSqlSessionTemplate().selectOne(Goodfriend.class.getName() + ".getGoodfriendByYourAccount",
				goodfriend);
	}

	// 据账号查找好友
	public List<Goodfriend> load() {
		return getSqlSessionTemplate().selectList(Goodfriend.class.getName() + ".getGoodfriend", "");
	}

}
