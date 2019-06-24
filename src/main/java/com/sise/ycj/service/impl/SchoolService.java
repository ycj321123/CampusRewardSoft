package com.sise.ycj.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sise.ycj.dao.SchoolDao;
import com.sise.ycj.model.School;
import com.sise.ycj.service.ISchoolService;


@Service("schoolService")
public class SchoolService implements ISchoolService{
	
	@Resource
	private SchoolDao schoolDao;

	public void add(School school) {
		schoolDao.add(school);
	}

	public void delete(String s_name) {
		schoolDao.delete(s_name);
	}

	public void update(School school) {
		schoolDao.update(school);
	}

	public List<School> load(String s_name) {
		return schoolDao.load(s_name);
	}

	public List<School> loadList() {
		return schoolDao.loadList();
	}

	
}
