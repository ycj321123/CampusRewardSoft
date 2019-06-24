package com.sise.ycj.service;

import java.util.List;
import java.util.Map;

import com.sise.ycj.model.User_info;

public interface IUser_infoService {
	
	public void add(User_info user_info);

	public void delete(String u_account) ;

	public void update(User_info user_info); 

	public User_info load(String u_account) ;
	
	public List<User_info> load() ;

	public List<User_info> loadByName(Map map);

	public int loadCount(Map map);
}
