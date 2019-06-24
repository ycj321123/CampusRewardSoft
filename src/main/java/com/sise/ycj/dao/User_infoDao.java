package com.sise.ycj.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.sise.ycj.model.User_info;

@Repository("user_infoDao")
public class User_infoDao extends BaseDao {
	// 添加用户资料
	public void add(User_info user_info) {
		getSqlSessionTemplate().insert(User_info.class.getName() + ".addUser_info", user_info);
	}

	// 删除用户资料
	public void delete(String u_account) {
		getSqlSessionTemplate().delete(User_info.class.getName() + ".deleteUser_info", u_account);
	}

	// 修改用户资料
	public void update(User_info user_info) {
		getSqlSessionTemplate().update(User_info.class.getName() + ".updateUser_infoByU_account", user_info);
	}

	// 据id查看用户资料
	public User_info load(String u_account) {
		return (User_info) getSqlSessionTemplate().selectOne(User_info.class.getName() + ".getUser_infoByU_account",
				u_account);
	}

	public List<User_info> loadByName(Map map) {
		return getSqlSessionTemplate().selectList(User_info.class.getName() + ".getUser_infoByName", map);
	}

	public int loadCount(Map map) {
		return getSqlSessionTemplate().selectOne(User_info.class.getName() + ".getCount",
				map);
	}

	// 查找用户资料
	public List<User_info> load() {
		return getSqlSessionTemplate().selectList(User_info.class.getName() + ".getUser_info", "");
	}

}
