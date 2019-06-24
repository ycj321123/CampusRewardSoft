package com.sise.ycj.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.sise.ycj.dao.BaseDao;
import com.sise.ycj.model.User;

@Repository("userDao")
public class UserDao extends BaseDao {

	// 添加用户
	public void add(User user) {
		getSqlSessionTemplate().insert(User.class.getName() + ".addUser", user);
	}

	// 删除用户
	public void delete(String account) {
		getSqlSessionTemplate().delete(User.class.getName() + ".deleteUser", account);
	}

	// 修改用户updateUserByAccount
	public void update(User user) {
		getSqlSessionTemplate().update(User.class.getName() + ".updateUserByAccount", user);
	}

	// 据id查看用户
	public User load(int id) {
		return (User) getSqlSessionTemplate().selectOne("com.sise.ycj.model.User.getUserById", id);
	}

	// 获取用户getCount
	public List<User> load(Map map) {
		return getSqlSessionTemplate().selectList("com.sise.ycj.model.User.getUser", map);
	}

	// 获取条数
	public int loadCount(Map map) {
		return getSqlSessionTemplate().selectOne("com.sise.ycj.model.User.getCount", map);
	}

	// 据账号查找用户
	public List<User> load(String account) {
		return getSqlSessionTemplate().selectList("com.sise.ycj.model.User.getUserByAccount", account);
	}

	// 获取条数
	public int loadCount2(Map map) {
		return getSqlSessionTemplate().selectOne("com.sise.ycj.model.User.getCount2", map);
	}
	public List<User> loadByCreditIntegral() {
		return getSqlSessionTemplate().selectList("com.sise.ycj.model.User.getUserByCreditIntegral", "");
	}

	public List<User> loadCreditIntegral(Map map) {
		return getSqlSessionTemplate().selectList("com.sise.ycj.model.User.loadCreditIntegral", map);
	}

}
