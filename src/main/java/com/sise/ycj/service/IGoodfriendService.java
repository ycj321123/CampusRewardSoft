package com.sise.ycj.service;

import java.util.List;

import com.sise.ycj.model.Goodfriend;

public interface IGoodfriendService {
	// 添加好友
	public void add(Goodfriend goodfriend);

	// 删除好友
	public void delete(String yourAccount);

	// 修改好友
	public void update(Goodfriend goodfriend);

	// 据id查看好友
	public List<Goodfriend> load(String myAccount);

	// 据id查看好友
	public Goodfriend loadByYourAccount(Goodfriend goodfriend);

	// 据账号查找好友
	public List<Goodfriend> load();
}
