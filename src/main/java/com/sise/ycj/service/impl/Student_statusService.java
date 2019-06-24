package com.sise.ycj.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sise.ycj.dao.Student_statusDao;
import com.sise.ycj.model.Student_status;
import com.sise.ycj.service.IStudent_statusService;

@Service("student_statusService")
public class Student_statusService implements IStudent_statusService{
	
	@Resource
	private Student_statusDao student_statusDao;

	public void add(Student_status student_status) {
		student_statusDao.add(student_status);
	}

	public void delete(String u_account) {
		student_statusDao.delete(u_account);
	}

	public void update(Student_status student_status) {
		student_statusDao.update(student_status);
	}

	public Student_status load(String u_account) {
		return student_statusDao.load(u_account);
	}

	public List<Student_status> loadList() {
		return student_statusDao.loadList();
	}

	public List<Student_status> loadSchool(String schoolName) {
		return student_statusDao.loadSchool(schoolName);
	}

	public List<Student_status> loadByName(Map map) {
		return student_statusDao.loadByName(map);
	}

	public int loadCount(Map map) {
		return student_statusDao.loadCount(map);
	}
	
}
