package com.sise.ycj.dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.sise.ycj.dao.BaseDao;
import com.sise.ycj.model.JobPublishImage;

@Repository("jobPublishImageDao")
public class JobPublishImageDao extends BaseDao {

	//添加任务图片
	public void add(JobPublishImage jobPublishImage) {
		getSqlSessionTemplate().insert(JobPublishImage.class.getName()+".addJobPublishImage", jobPublishImage);
	}

	//删除任务图片
	public void delete(String pId) {
		getSqlSessionTemplate().delete(JobPublishImage.class.getName()+".deletePId", pId);
	}

	//修改任务图片updateUserByAccount
	public void update(JobPublishImage jobPublishImage) {
		getSqlSessionTemplate().update(JobPublishImage.class.getName()+".updateJobPublishImageByPId", jobPublishImage);
	}

	//据id查看任务图片
	public JobPublishImage load(String pId) {
		return (JobPublishImage)getSqlSessionTemplate().selectOne("com.sise.ycj.model.JobPublishImage.getJobPublishImageByPId", pId);
	}
	
	//据账号查找任务图片
	public List<JobPublishImage> load() {
		return getSqlSessionTemplate().selectList("com.sise.ycj.model.JobPublishImage.getJobPublishImage", "");
	}

}
