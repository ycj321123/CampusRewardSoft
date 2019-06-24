package com.sise.ycj.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sise.ycj.dao.GoodfriendDao;
import com.sise.ycj.dao.UserDao;
import com.sise.ycj.model.Goodfriend;
import com.sise.ycj.model.User;
import com.sise.ycj.service.IGoodfriendService;
import com.sise.ycj.service.IUserService;

@Service("goodfriendService")
public class GoodfriendService implements IGoodfriendService{
	
	@Resource
	private GoodfriendDao goodfriendDao;

	public void add(Goodfriend goodfriend) {
		goodfriendDao.add(goodfriend);
	}

	public void delete(String yourAccount) {
		goodfriendDao.delete(yourAccount);
	}

	public void update(Goodfriend goodfriend) {
		goodfriendDao.update(goodfriend);
	}

	public List<Goodfriend> load(String myAccount) {
		return goodfriendDao.load(myAccount);
	}

	public List<Goodfriend> load() {
		return goodfriendDao.load();
	}

	public Goodfriend loadByYourAccount(Goodfriend goodfriend) {
		return goodfriendDao.loadByYourAccount(goodfriend);
	}

	
}
