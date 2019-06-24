package com.sise.ycj.service;

import java.util.List;
import java.util.Map;

import com.sise.ycj.model.Publish_job;
import com.sise.ycj.model.Publish_msg;

public interface IPublish_msgService {

	// 添加发布的消息
	public void add(Publish_msg publish_msg);

	// 删除发布的消息
	public void delete(String pAccount);

	// 修改发布的消息updateUserByAccount
	public void update(Publish_msg publish_msg);

	// 据id查看发布的消息
	public Publish_msg load(String pAccount);

	// 据账号查找发布的消息
	public List<Publish_msg> load();

	public List<Publish_msg> loadByPAndP(String account);

	public Publish_msg loadByPAndW(Publish_msg pm);

	// 查找发布的消息
	public List<Publish_msg> loadByWhoAndWho(Map<String, Object> map);

	public List<Publish_msg> loadBya1(String account);

	// 根据id查找发布的消息
	public Publish_msg loadById(int msgid);
	
	public List<Publish_msg> loadByMeR(Map<String, Object> map) ;
	
}
