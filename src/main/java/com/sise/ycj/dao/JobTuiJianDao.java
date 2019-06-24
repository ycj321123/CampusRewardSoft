package com.sise.ycj.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.sise.ycj.dao.BaseDao;
import com.sise.ycj.model.JobTuiJian;

@Repository("jobTuiJianDao")
public class JobTuiJianDao extends BaseDao {

	// 添加
	public void add(JobTuiJian jobTuiJian) {
		getSqlSessionTemplate().insert(JobTuiJian.class.getName() + ".addJobTuiJian", jobTuiJian);
	}

	// 修改
	public void update(JobTuiJian jobTuiJian) {
		getSqlSessionTemplate().update(JobTuiJian.class.getName() + ".updateJobTuiJian", jobTuiJian);
	}

	// 查看
	public List<JobTuiJian> load() {
		return getSqlSessionTemplate().selectList("com.sise.ycj.model.JobTuiJian.getJobTuiJian", "");
	}

}
