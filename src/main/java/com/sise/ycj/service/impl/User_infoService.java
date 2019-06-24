package com.sise.ycj.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sise.ycj.dao.User_infoDao;
import com.sise.ycj.model.User_info;
import com.sise.ycj.service.IUser_infoService;

@Service("user_infoService")
public class User_infoService implements IUser_infoService{
	
	@Resource
	private User_infoDao user_infoDao;

	public void delete(String u_account) {
		user_infoDao.delete(u_account);
	}

	public void update(User_info user_info) {
		user_infoDao.update(user_info);
	}

	public User_info load(String u_account) {
		return user_infoDao.load(u_account);
	}

	public void add(User_info user_info) {
		user_infoDao.add(user_info);
	}
	public List<User_info> load() {
		return user_infoDao.load();
	}
	public List<User_info> loadByName(Map map) {
		return user_infoDao.loadByName(map);
	}

	public int loadCount(Map map) {
		return user_infoDao.loadCount(map);
	}
}
