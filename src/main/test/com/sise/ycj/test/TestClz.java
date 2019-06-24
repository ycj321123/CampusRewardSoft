package com.sise.ycj.test;

import static org.junit.Assert.assertEquals;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.Test;

import com.sise.ycj.controller.IndexController;
import com.sise.ycj.model.Publish_job;
import com.sise.ycj.model.Publish_msg;
import com.sise.ycj.model.User;
import com.sise.ycj.service.IGoodfriendService;
import com.sise.ycj.service.IIDCardInfoService;
import com.sise.ycj.service.IJobPublishImageService;
import com.sise.ycj.service.IJobTuiJianService;
import com.sise.ycj.service.IOderService;
import com.sise.ycj.service.IPublish_jobService;
import com.sise.ycj.service.IPublish_msgService;
import com.sise.ycj.service.IReceive_jobService;
import com.sise.ycj.service.IReceive_msgService;
import com.sise.ycj.service.ISchoolService;
import com.sise.ycj.service.IStudent_statusService;
import com.sise.ycj.service.IUserService;
import com.sise.ycj.service.IUser_infoService;

public class TestClz {
	@Resource(name = "userService")
	private IUserService userService;

	@Resource(name = "schoolService")
	private ISchoolService schoolService;

	@Resource(name = "user_infoService")
	private IUser_infoService user_infoService;

	@Resource(name = "student_statusService")
	private IStudent_statusService student_statusService;

	@Resource(name = "iDCardInfoService")
	private IIDCardInfoService iDCardInfoService;

	@Resource(name = "publish_jobService")
	private IPublish_jobService publish_jobService;

	@Resource(name = "jobPublishImageService")
	private IJobPublishImageService jobPublishImageService;

	@Resource(name = "receive_jobService")
	private IReceive_jobService receive_jobService;

	@Resource(name = "receive_msgService")
	private IReceive_msgService receive_msgService;

	@Resource(name = "publish_msgService")
	private IPublish_msgService publish_msgService;

	@Resource(name = "goodfriendService")
	private IGoodfriendService goodfriendService;

	@Resource(name = "oderService")
	private IOderService oderService;

	@Resource(name = "jobTuiJianService")
	private IJobTuiJianService jobTuiJianService;

	
	@Test
	public void testUser() { //测试用户
		User u=new User();
		u.setAccount("15611011222");
		u.setEmail("110110@qq.com");
		u.setPassword("111");
		u.setUsername("阿三");
		userService.add(u);
		u.setUsername("阿四");
		userService.update(u);
	}
	
	@Test
	public void testJob() { //测试任务
		Publish_job pj= new Publish_job();
		pj.setpAccount("15611011222");
		pj.setpContent("测试");
		pj.setPrice(2);
		pj.setpTime(new Date().toString());
		pj.setTimeLimit("2020-10-10 13:12:10");
		publish_jobService.add(pj);
		pj.setpContent("测试2");
		publish_jobService.update(pj);
	}
		
	@Test
	public void testMsg() { //测试消息
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		Date now = new Date();
		String sendTime = sdf2.format(now); // 获取时间
		Publish_msg pm = new Publish_msg();
		pm.setpAccount("15627933457"); // 发送者
		pm.setpContent("hello"); // 发送内容
		pm.setpTime(sendTime); // 发送时间
		pm.setSendToWho("15611011222"); // 发送给谁
		pm.setIsRead(0);
		publish_msgService.add(pm);
		assertEquals("ok", "ok");
	}

}
