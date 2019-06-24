package com.sise.ycj.service;

import java.util.List;
import java.util.Map;

import com.sise.ycj.model.Student_status;

public interface IStudent_statusService {
	
		// 添加用户学籍
		public void add(Student_status student_status) ;

		// 删除用户学籍
		public void delete(String u_account);

		// 修改用户学籍
		public void update(Student_status student_status) ;

		// 据u_id查看用户学籍
		public Student_status load(String u_account) ;

		// 据学校查看用户学籍
		public List<Student_status> loadSchool(String schoolName);
		
		public List<Student_status> loadList() ;

		public List<Student_status> loadByName(Map map) ;

		public int loadCount(Map map);
}
