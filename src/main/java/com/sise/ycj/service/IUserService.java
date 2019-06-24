package com.sise.ycj.service;

import java.util.List;
import java.util.Map;

import com.sise.ycj.model.User;

public interface IUserService {

	// 添加用户
	public void add(User user);

	// 删除用户
	public void delete(String account);

	// 修改用户
	public void update(User user);

	// 据id查找用户
	public User load(int id);

	// 据账号查找用户
	public List<User> load(String account);

	public List<User> load(Map map);

	// 获取条数
	public int loadCount(Map map);

	// 获取条数
	public int loadCount2(Map map);

	public List<User> loadByCreditIntegral();

	public List<User> loadCreditIntegral(Map map);
}
