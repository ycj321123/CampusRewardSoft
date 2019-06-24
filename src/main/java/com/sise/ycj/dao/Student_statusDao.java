package com.sise.ycj.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.sise.ycj.model.Student_status;

@Repository("student_statusDao")
public class Student_statusDao extends BaseDao {

	// 添加用户学籍
	public void add(Student_status studentStatus) {
		getSqlSessionTemplate().insert(Student_status.class.getName() + ".addStudent_status", studentStatus);
	}

	// 删除用户学籍
	public void delete(String u_account) {
		getSqlSessionTemplate().delete(Student_status.class.getName() + ".deleteStudent_statusByU_account", u_account);
	}

	// 修改用户学籍
	public void update(Student_status student_status) {
		getSqlSessionTemplate().update(Student_status.class.getName() + ".updateStudent_status", student_status);
	}

	// 查看用户学籍
	public Student_status load(String uaccount) {
		return (Student_status) getSqlSessionTemplate()
				.selectOne("com.sise.ycj.model.Student_status.getStudent_statusByU_account", uaccount);
	}

	// 据学校查看用户学籍
	public List<Student_status> loadSchool(String schoolName) {
		return getSqlSessionTemplate().selectList("com.sise.ycj.model.Student_status.getStudent_statusBySchool_name",
				schoolName);
	}

	// 据账号查找用户学籍getStudent_statusByName
	public List<Student_status> loadList() {
		return getSqlSessionTemplate().selectList("com.sise.ycj.model.Student_status.getStudent_statusList", "");
	}

	public List<Student_status> loadByName(Map map) {
		return getSqlSessionTemplate().selectList("com.sise.ycj.model.Student_status.getStudent_statusByName", map);
	}

	public int loadCount(Map map) {
		return getSqlSessionTemplate().selectOne("com.sise.ycj.model.Student_status.getStudent_statusCount", map);
	}
}
