package com.sise.ycj.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sise.ycj.dao.UserDao;
import com.sise.ycj.model.User;
import com.sise.ycj.service.IUserService;

@Service("userService")
public class UserService implements IUserService {

	@Resource
	private UserDao userDao;

	public void delete(String account) {
		userDao.delete(account);
	}

	public void update(User user) {
		userDao.update(user);
	}

	public User load(int id) {
		return userDao.load(id);
	}

	public void add(User user) {
		userDao.add(user);
	}

	public List<User> load(String account) {
		return userDao.load(account);
	}

	// 获取用户
	public List<User> load(Map map) {
		return userDao.load(map);
	}

	public int loadCount(Map map) {
		return userDao.loadCount(map);
	}

	public int loadCount2(Map map) {
		return userDao.loadCount2(map);
	}

	public List<User> loadByCreditIntegral() {
		return userDao.loadByCreditIntegral();
	}

	public List<User> loadCreditIntegral(Map map) {
		return userDao.loadCreditIntegral(map);
	}
}
