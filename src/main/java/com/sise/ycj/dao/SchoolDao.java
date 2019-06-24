package com.sise.ycj.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sise.ycj.model.School;

@Repository("schoolDao")
public class SchoolDao extends BaseDao{
	
		public void add(School school) {
			getSqlSessionTemplate().insert(School.class.getName()+".addSchool", school);
		}

		public void delete(String s_name) {
			getSqlSessionTemplate().delete(School.class.getName()+".deleteSchoolByS_name", s_name);
		}

		public void update(School school) {
			getSqlSessionTemplate().update(School.class.getName()+".updateSchoolByS_name", school);
		}

		public List<School> load(String s_name) {
			return getSqlSessionTemplate().selectList("com.sise.ycj.model.School.getSchoolByS_name",s_name);
		}
		
		public List<School> loadList() {
			return getSqlSessionTemplate().selectList("com.sise.ycj.model.School.getSchoolList","");
		}
}
