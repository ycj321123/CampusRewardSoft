package com.sise.ycj.service;

import java.util.List;

import com.sise.ycj.model.School;

public interface ISchoolService {
	
	//添加学校
	public void add(School school);

	//删除学校
	public void delete(String s_name) ;

	//更新学校
	public void update(School school); 

	//查找学校
	public List<School> load(String s_name) ;
	
	//查找学校列表
	public List<School> loadList() ;

}
