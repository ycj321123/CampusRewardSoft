package com.sise.ycj.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sise.ycj.model.Goodfriend;
import com.sise.ycj.model.IDCardInfo;
import com.sise.ycj.model.JobPublishImage;
import com.sise.ycj.model.JobTuiJian;
import com.sise.ycj.model.Oder;
import com.sise.ycj.model.Publish_job;
import com.sise.ycj.model.Publish_msg;
import com.sise.ycj.model.Receive_job;
import com.sise.ycj.model.Receive_msg;
import com.sise.ycj.model.School;
import com.sise.ycj.model.Student_status;
import com.sise.ycj.model.User;
import com.sise.ycj.model.UserAndJob;
import com.sise.ycj.model.User_info;
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
import com.sise.ycj.service.impl.GoodfriendService;
import com.sise.ycj.service.impl.IDCardInfoService;
import com.sise.ycj.service.impl.Publish_msgService;
import com.sise.ycj.service.impl.Receive_msgService;
import com.sise.ycj.service.impl.Student_statusService;
import com.sise.ycj.util.ChatTime;
import com.sise.ycj.util.FilterHtmlUtil;
import com.sise.ycj.util.IDCardUtil;
import com.sise.ycj.util.PinyinUtils;
import com.sise.ycj.util.TimeUtil;

@Controller("indexController")
@RequestMapping("/mainIndex")
public class IndexController {

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

	@SuppressWarnings("rawtypes")
	private Map map;

	// 用户登陆进入主界面任务大厅
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Model model, HttpServletRequest request) throws ParseException {

		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		HttpSession session = request.getSession();
		List pjsList = new ArrayList<Object>(); // 存放任务
		User u = (User) session.getAttribute("loginUser"); // 获取登陆用户
		int count = 0;

		// 用户是否被禁
		List<User> t = userService.load(u.getAccount());
		if (!t.isEmpty()) {
			for (User tt : t) {
				if (tt.getRole() == 4)
					return "redirect:/user/login.do";
			}
		}

		Student_status ss = student_statusService.load(u.getAccount()); // 据账号找学籍

		List<Publish_job> asslist = publish_jobService.loadByAssociation(ss.getSchoolName()); // 根据学校查找用户信息和发布的任务
		if (!asslist.isEmpty()) {
			for (Publish_job pjob : asslist) {

				Date now = new Date();
				String time = sdf2.format(now); // 获取当前时间
				String lt = pjob.getTimeLimit(); // 获取任务期限
				String s3 = lt.replaceAll("T", " ");
				Date dt1 = sdf2.parse(time);
				Date dt2 = sdf2.parse(s3);

				if (dt1.getTime() - dt2.getTime() > 0) { // 时间比较 ，判断任务是否过期
					continue;
				} else // 未过期的显示任务
				{
					User_info ui = user_infoService.load(pjob.getpAccount()); // 该学校的用户
					UserAndJob userAndJob = new UserAndJob();
					userAndJob.setUser_info(ui);
					// userAndJob.setPublish_job(pjob);
					userAndJob.setPublish_job(pjob);
					if (pjob.getJobLevel() == 0)
						pjsList.add(userAndJob);
				}
			}
		}
		UserAndJob uj = null;
		List<JobTuiJian> jtj = jobTuiJianService.load();
		for (JobTuiJian j : jtj) {
			if (!jtj.isEmpty() && j.getTest().indexOf(u.getAccount())==-1) {

				Publish_job pj2 = publish_jobService.loadByPid(j.getJobId());
				User_info ui2 = user_infoService.load(pj2.getpAccount());

				if (ss.getSchoolName().equals(j.getToWho()) && pj2.getIsComplish()==0) {
					
					uj=new UserAndJob();
					uj.setUser_info(ui2);
					uj.setPublish_job(pj2);
					break;
				}
			}
		}
		List<Publish_msg> pm = publish_msgService.loadBya1(u.getAccount());
		if (!pm.isEmpty())
			count = 2;
		else
			count = 0;

		model.addAttribute("count", count);
		model.addAttribute("pjsList", pjsList);
		model.addAttribute("jibie", 0);
		model.addAttribute("jtj", uj);
		return "home/index";
	}

	//关闭推建
	@RequestMapping(value = "/guanTuiJian", method = RequestMethod.POST)
	@ResponseBody
	public String guanTuiJian(HttpServletRequest request,@RequestParam("jobId") String jobId){
		
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser"); // 获取登陆用户
		
		Student_status ss= student_statusService.load(u.getAccount());
		List<JobTuiJian> jtj = jobTuiJianService.load();
		for(JobTuiJian j:jtj){
			if(j.getToWho().equals(ss.getSchoolName())){		//关闭这个任务
				j.setTest(j.getTest()+u.getAccount()+",");
				jobTuiJianService.update(j);
			}
		}
		
		return "ok";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.POST)
	public String index(Model model, HttpServletRequest request, @RequestParam("level") int level)
			throws ParseException {

		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		HttpSession session = request.getSession();
		List pjsList = new ArrayList<Object>(); // 存放任务
		User u = (User) session.getAttribute("loginUser"); // 获取登陆用户
		int count = 0;

		// 用户是否被禁
		List<User> t = userService.load(u.getAccount());
		if (!t.isEmpty()) {
			for (User tt : t) {
				if (tt.getRole() == 4)
					return "redirect:/user/login.do";
			}
		}

		Student_status ss = student_statusService.load(u.getAccount()); // 据账号找学籍

		List<Publish_job> asslist = publish_jobService.loadByAssociation(ss.getSchoolName()); // 根据学校查找用户信息和发布的任务
		if (!asslist.isEmpty()) {
			for (Publish_job pjob : asslist) {

				Date now = new Date();
				String time = sdf2.format(now); // 获取当前时间
				String lt = pjob.getTimeLimit(); // 获取任务期限
				String s3 = lt.replaceAll("T", " ");
				Date dt1 = sdf2.parse(time);
				Date dt2 = sdf2.parse(s3);

				if (dt1.getTime() - dt2.getTime() > 0) { // 时间比较 ，判断任务是否过期
					continue;
				} else // 未过期的显示任务
				{
					User_info ui = user_infoService.load(pjob.getpAccount()); // 该学校的用户
					UserAndJob userAndJob = new UserAndJob();
					userAndJob.setUser_info(ui);
					userAndJob.setPublish_job(pjob);
					if (pjob.getJobLevel() == level)
						pjsList.add(userAndJob);
				}
			}
		}
		UserAndJob uj = null;
		List<JobTuiJian> jtj = jobTuiJianService.load();
		for (JobTuiJian j : jtj) {
			if (!jtj.isEmpty() && j.getTest().indexOf(u.getAccount())==-1) {

				Publish_job pj2 = publish_jobService.loadByPid(j.getJobId());
				User_info ui2 = user_infoService.load(pj2.getpAccount());

				if (ss.getSchoolName().equals(j.getToWho()) && pj2.getIsComplish()==0) {
					
					uj=new UserAndJob();
					uj.setUser_info(ui2);
					uj.setPublish_job(pj2);
					break;
				}
			}
		}
		
		List<Publish_msg> pm = publish_msgService.loadBya1(u.getAccount());
		if (!pm.isEmpty())
			count = 2;
		else
			count = 0;

		model.addAttribute("count", count);
		model.addAttribute("pjsList", pjsList);
		model.addAttribute("jibie", level);
		model.addAttribute("jtj", uj);
		return "home/index";
	}

	// 任务大厅 -发布任务
	@RequestMapping(value = "/jobRoom", method = RequestMethod.GET)
	public String jobRoom() {
		return "home/jobRoom";
	}

	@RequestMapping(value = "/jobRoom", method = RequestMethod.POST)
	@ResponseBody
	public String jobRoom(Publish_job publish_job, @RequestParam("deleteNo") String deleteNo,
			@RequestParam("fileAttach") MultipartFile[] fs, HttpServletRequest request) throws IOException {

		String imgs = ""; // 存放图片
		// 获取登陆者
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser");

		IDCardInfo idcard = iDCardInfoService.load(u.getAccount()); // 查找信息
		if (idcard == null || idcard.getIsreal() == 0) { // 没有实名，或者实名不通过
			return "err";
		}

		// 获取要删除的图片并存进list
		String[] strs = deleteNo.split("#");
		List<String> arrList = Arrays.asList(strs);
		List<String> del = new ArrayList<String>(arrList);

		// 图片存放
		for (MultipartFile f : fs) {
			Boolean isdel = false;
			if (f.isEmpty())
				continue;
			// 找出要删除的图片
			for (int i = del.size() - 1; i >= 0; i--) {
				String str = del.get(i);
				if ((f.getOriginalFilename().toString()).equals(str)) {
					del.remove(str);
					isdel = true;
				}
			}
			if (isdel)
				continue; // 要删除的不保存

			// 以日期命名图片
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
			String newfilename = sdf.format(new Date()) + ".jpg";

			File file = new File("E:\\eclipse_files\\project_files\\CampusRewardSoft\\src\\main\\webapp\\images\\job\\"
					+ newfilename);
			FileUtils.copyInputStreamToFile(f.getInputStream(), file);
			imgs = imgs + "#" + newfilename;
		}

		// 获取日期
		long now = System.currentTimeMillis();
		String time = (now % 1000000000) + "" + (now / 100000000) % 100;
		System.out.println("asbdjasd----" + time);
		Publish_job pj = publish_job; // 任务

		// 检测余额和任务价格
		List<User> ulist = userService.load(u.getAccount());
		for (User user : ulist) {
			if (user.getMoney() < publish_job.getPrice()) {
				return "errP";
			}
		}

		pj.setPId(time); // 任务号
		pj.setpAccount(u.getAccount());
		pj.setIsComplish(520);
		if (pj.getTimeLimit().length() < 17) {
			pj.setTimeLimit(pj.getTimeLimit() + ":59");
		}

		JobPublishImage jbi = new JobPublishImage(); // 图片
		jbi.setpId(time);
		jbi.setpImage(imgs);

		// 发布任务扣钱
		for (User user2 : ulist) {
			user2.setMoney(user2.getMoney() - pj.getPrice());
			userService.update(user2);
		}

		// 添加到数据库
		publish_jobService.add(pj); // 添加任务
		jobPublishImageService.add(jbi); // 添加任务图片

		System.out.println(pj.toString());
		System.out.println(jbi.toString());
		return "home/jobRoom";
	}

	// 任务搜索
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(Model model, HttpServletRequest request) throws ParseException {

		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser"); // 获取登陆用户
		Student_status ss = student_statusService.load(u.getAccount()); // 据账号找学籍

		List<Publish_job> list = publish_jobService.load2(ss.getSchoolName());
		List<Publish_job> list2 = new ArrayList<Publish_job>();
		if (!list.isEmpty()) {
			for (Publish_job pjob : list) {

				Date now = new Date();
				String time = sdf2.format(now);
				String lt = pjob.getTimeLimit();
				String s3 = lt.replaceAll("T", " ");
				Date dt1 = sdf2.parse(time);
				Date dt2 = sdf2.parse(s3);

				if (dt1.getTime() - dt2.getTime() > 0) { // 时间比较
					continue;
				}
				list2.add(pjob);
			}
			model.addAttribute("list", list2);
		}
		model.addAttribute("list", list2);
		return "home/search";
	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(@RequestParam("text") String text, Model model, HttpServletRequest request)
			throws ParseException {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser"); // 获取登陆用户
		Student_status ss = student_statusService.load(u.getAccount()); // 据账号找学籍

		List pjsList = new ArrayList<Object>(); // 存放任务
		String txt = "%" + text + "%";
		if (text.equals(""))
			return "home/search";

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("text", txt);
		map.put("schoolName", ss.getSchoolName());
		List<Publish_job> pjlist = publish_jobService.load(map); // 查找任务

		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式

		// 推荐
		List<Publish_job> list = publish_jobService.load2(ss.getSchoolName());
		List<Publish_job> list2 = new ArrayList<Publish_job>();
		if (!list.isEmpty()) {
			for (Publish_job pjob : list) {

				Date now = new Date();
				String time = sdf2.format(now);
				String lt = pjob.getTimeLimit();
				String s3 = lt.replaceAll("T", " ");
				Date dt1 = sdf2.parse(time);
				Date dt2 = sdf2.parse(s3);

				if (dt1.getTime() - dt2.getTime() > 0) { // 时间比较
					continue;
				}
				list2.add(pjob);
			}
			model.addAttribute("list", list2);
		}

		if (!pjlist.isEmpty()) {
			for (Publish_job pjob : pjlist) {

				Date now = new Date();
				String time = sdf2.format(now);
				String lt = pjob.getTimeLimit();
				String s3 = lt.replaceAll("T", " ");
				Date dt1 = sdf2.parse(time);
				Date dt2 = sdf2.parse(s3);

				if (dt1.getTime() - dt2.getTime() > 0) { // 时间比较
					continue;
				}
				User_info ui = user_infoService.load(pjob.getpAccount()); // 用户资料
				UserAndJob userAndJob = new UserAndJob();
				userAndJob.setUser_info(ui);
				userAndJob.setPublish_job(pjob);
				pjsList.add(userAndJob);
			}

		}

		model.addAttribute("text", text);
		model.addAttribute("pjsList", pjsList);
		return "home/search";
	}

	// 聊天页面
	@RequestMapping(value = "/{account}/{pid}/{isto}/chatPage", method = RequestMethod.GET)
	public String chatPage(@PathVariable(value = "account") String account, @PathVariable(value = "pid") String pid,
			@PathVariable(value = "isto") String isto, Model model, HttpServletRequest request) throws ParseException {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser"); // 登陆者

		// 我接受的消息设为已读
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pAccount", account);
		map.put("SendToWho", u.getAccount());
		List<Publish_msg> list = (List<Publish_msg>) publish_msgService.loadByMeR(map);
		for (Publish_msg pp : list) {
			pp.setIsRead(1);
			publish_msgService.update(pp);
		}

		User_info myui = user_infoService.load(u.getAccount()); // 我的资料
		User_info whoui = user_infoService.load(account);

		String me = u.getAccount(); // 发送者
		String SendToWho = account; // 接受者

		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("pAccount", me);
		map2.put("SendToWho", SendToWho);

		List<Publish_msg> chatList0 = publish_msgService.loadByWhoAndWho(map2);
		List<ChatTime> chatList = new ArrayList<ChatTime>();
		ChatTime ct0 = new ChatTime();
		if (!chatList0.isEmpty()) {
			ct0.setPm(chatList0.get(0));
			chatList.add(ct0);
			for (int i = 1; i < chatList0.size(); i++) {
				Publish_msg pm = chatList0.get(i);
				Publish_msg pm2 = chatList0.get(i - 1);
				ChatTime ct = new ChatTime();
				if (TimeUtil.timeSub(pm.getpTime(), pm2.getpTime())) {
					ct.setTime(pm.getpTime());
				} else
					ct.setTime("");
				ct.setPm(pm);
				chatList.add(ct);

			}

			model.addAttribute("chatList", chatList);
		}
		model.addAttribute("chatUser", whoui);
		model.addAttribute("chatPid", pid);
		model.addAttribute("isto", isto);
		model.addAttribute("myui", myui);
		model.addAttribute("pid", pid);
		return "home/chatPage";
	}

	// 消息设置为已读
	@RequestMapping(value = "/msgR", method = RequestMethod.POST)
	@ResponseBody
	public String msgR(HttpServletRequest request, @RequestParam("account") String account) {
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser"); // 登陆者
		// 我接受的消息设为已读
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pAccount", account);
		map.put("SendToWho", u.getAccount());
		List<Publish_msg> list = (List<Publish_msg>) publish_msgService.loadByMeR(map);
		for (Publish_msg pp : list) {
			pp.setIsRead(1);
			publish_msgService.update(pp);
		}
		return "ok";
	}

	// 发送消息
	@RequestMapping(value = "/sendMsgAjax", method = RequestMethod.POST)
	@ResponseBody
	public String sendMsgAjax(@RequestParam("me") String me, @RequestParam("who") String who,
			@RequestParam("msg") String msg, RedirectAttributes ra) {

		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		Date now = new Date();
		String sendTime = sdf2.format(now); // 获取时间

		Publish_msg pm = new Publish_msg();
		pm.setpAccount(me); // 发送者
		pm.setpContent(msg); // 发送内容
		pm.setpTime(sendTime); // 发送时间
		pm.setSendToWho(who); // 发送给谁
		pm.setIsRead(0);

		publish_msgService.add(pm); // 添加到数据库

		return "home/chatPage";
	}

	// 我的消息msg.jsp
	@RequestMapping(value = "/msg", method = RequestMethod.GET)
	public String msg(Model model, HttpServletRequest request) throws ParseException {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser"); // 获取登陆用户

		// 被禁退出
		List<User> t = userService.load(u.getAccount());
		if (!t.isEmpty()) {
			for (User tt : t) {
				if (tt.getRole() == 4)
					return "redirect:/user/login.do";
			}
		}
		List<Object> wholist = new ArrayList<Object>();
		int count = 0;
		List<Publish_msg> pandp = publish_msgService.loadByPAndP(u.getAccount()); // 查找消息
		Set<String> set = new HashSet<String>();
		Map<String, Object> map = new HashMap<String, Object>();
		for (Publish_msg pm : pandp) {

			if (set.contains(pm.getpAccount() + pm.getSendToWho())) {

			} else {
				set.add(pm.getpAccount() + pm.getSendToWho());
				set.add(pm.getSendToWho() + pm.getpAccount());
				User_info ui = null;
				Publish_msg pmsg = null;

				// 发布者是他
				if (!pm.getpAccount().equals(u.getAccount())) {
					ui = user_infoService.load(pm.getpAccount()); // 查找用户资料
					pmsg = publish_msgService.loadByPAndW(pm); // 查找消息
				}
				// 接收者是他
				else if (!pm.getSendToWho().equals(u.getAccount())) {
					ui = user_infoService.load(pm.getSendToWho()); // 查找用户资料
					pmsg = publish_msgService.loadByPAndW(pm); // 查找消息
				} else {
					ui = user_infoService.load(u.getAccount()); // 查找用户资料
					pmsg = publish_msgService.loadByPAndW(pm); // 查找消息
				}

				String text = "";
				// 过滤标记，文本
				if (FilterHtmlUtil.Html2Text(pmsg.getpContent()).length() > 10) {
					text = FilterHtmlUtil.Html2Text(pmsg.getpContent()).substring(0, 10) + "...";
				} else
					text = pmsg.getpContent();

				ChatTime ct = new ChatTime();
				ct.setPm(pmsg);
				ct.setUi(ui);
				ct.setTime(text);
				ct.setTtime(pmsg.getpTime().toString());
				// wholist.add(ct);
				map.put(pmsg.getpTime(), ct);
			}
		}
		List<String> li = new ArrayList<String>();
		for (String key : map.keySet()) {
			li.add(key);
		}
		Collections.sort(li, Collections.reverseOrder()); // 时间排序
		for (String s : li) {
			wholist.add(map.get(s));
		}

		List<Publish_msg> pm = publish_msgService.loadBya1(u.getAccount());
		if (!pm.isEmpty())
			count = 2;
		else
			count = 0;

		model.addAttribute("count", count);
		model.addAttribute("wholist", wholist);
		return "home/msg";
	}

	// 好友
	@SuppressWarnings("null")
	@RequestMapping(value = "/friend", method = RequestMethod.GET)
	public String friend(Model model, HttpServletRequest request) throws ParseException {
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser"); // 获取登陆用户

		List<User> t = userService.load(u.getAccount());
		if (!t.isEmpty()) {
			for (User tt : t) {
				if (tt.getRole() == 4)
					return "redirect:/user/login.do";
			}
		}
		PinyinUtils pyutil = new PinyinUtils();
		List<Goodfriend> gflist = goodfriendService.load(u.getAccount());
		List<Object> strs0 = new ArrayList<Object>();
		List<Object> strs1 = new ArrayList<Object>();
		List<Object> strs2 = new ArrayList<Object>();
		List<Object> strs3 = new ArrayList<Object>();
		List<Object> strs4 = new ArrayList<Object>();
		List<Object> strs5 = new ArrayList<Object>();
		List<Object> strs6 = new ArrayList<Object>();
		List<Object> strs7 = new ArrayList<Object>();
		List<Object> strs8 = new ArrayList<Object>();
		List<Object> strs9 = new ArrayList<Object>();
		List<Object> strs10 = new ArrayList<Object>();
		List<Object> strs11 = new ArrayList<Object>();
		List<Object> strs12 = new ArrayList<Object>();
		List<Object> strs13 = new ArrayList<Object>();
		List<Object> strs14 = new ArrayList<Object>();
		List<Object> strs15 = new ArrayList<Object>();
		List<Object> strs16 = new ArrayList<Object>();
		List<Object> strs17 = new ArrayList<Object>();
		List<Object> strs18 = new ArrayList<Object>();
		List<Object> strs19 = new ArrayList<Object>();
		List<Object> strs20 = new ArrayList<Object>();
		List<Object> strs21 = new ArrayList<Object>();
		List<Object> strs22 = new ArrayList<Object>();
		List<Object> strs23 = new ArrayList<Object>();
		List<Object> strs24 = new ArrayList<Object>();
		List<Object> strs25 = new ArrayList<Object>();
		List<Object> strs26 = new ArrayList<Object>();

		for (Goodfriend gf : gflist) {
			User_info ui = user_infoService.load(gf.getYourAccount());
			String str = pyutil.getAllFirstLetter(ui.getNickname()).substring(0, 1);
			if (str.equals("A") || str.equals("a"))
				strs0.add(ui);
			else if (str.equals("B") || str.equals("b"))
				strs1.add(ui);
			else if (str.equals("C") || str.equals("c"))
				strs2.add(ui);
			else if (str.equals("D") || str.equals("d"))
				strs3.add(ui);
			else if (str.equals("E") || str.equals("e"))
				strs4.add(ui);
			else if (str.equals("F") || str.equals("f"))
				strs5.add(ui);
			else if (str.equals("G") || str.equals("g"))
				strs6.add(ui);
			else if (str.equals("H") || str.equals("h"))
				strs7.add(ui);
			else if (str.equals("I") || str.equals("i"))
				strs8.add(ui);
			else if (str.equals("J") || str.equals("j"))
				strs9.add(ui);
			else if (str.equals("K") || str.equals("k"))
				strs10.add(ui);
			else if (str.equals("L") || str.equals("l"))
				strs11.add(ui);
			else if (str.equals("M") || str.equals("m"))
				strs12.add(ui);
			else if (str.equals("N") || str.equals("n"))
				strs13.add(ui);
			else if (str.equals("O") || str.equals("o"))
				strs14.add(ui);
			else if (str.equals("P") || str.equals("p"))
				strs15.add(ui);
			else if (str.equals("Q") || str.equals("q"))
				strs16.add(ui);
			else if (str.equals("R") || str.equals("r"))
				strs17.add(ui);
			else if (str.equals("S") || str.equals("s"))
				strs18.add(ui);
			else if (str.equals("T") || str.equals("t"))
				strs19.add(ui);
			else if (str.equals("U") || str.equals("u"))
				strs20.add(ui);
			else if (str.equals("V") || str.equals("v"))
				strs21.add(ui);
			else if (str.equals("W") || str.equals("w"))
				strs22.add(ui);
			else if (str.equals("X") || str.equals("x"))
				strs23.add(ui);
			else if (str.equals("Y") || str.equals("y"))
				strs24.add(ui);
			else if (str.equals("Z") || str.equals("z"))
				strs25.add(ui);
			else
				strs25.add(str);
		}
		model.addAttribute("A", strs0);
		model.addAttribute("B", strs1);
		model.addAttribute("C", strs2);
		model.addAttribute("D", strs3);
		model.addAttribute("E", strs4);
		model.addAttribute("F", strs5);
		model.addAttribute("G", strs6);
		model.addAttribute("H", strs7);
		model.addAttribute("I", strs8);
		model.addAttribute("J", strs9);
		model.addAttribute("K", strs10);
		model.addAttribute("L", strs11);
		model.addAttribute("M", strs12);
		model.addAttribute("N", strs13);
		model.addAttribute("O", strs14);
		model.addAttribute("P", strs15);
		model.addAttribute("Q", strs16);
		model.addAttribute("R", strs17);
		model.addAttribute("S", strs18);
		model.addAttribute("T", strs19);
		model.addAttribute("U", strs20);
		model.addAttribute("V", strs21);
		model.addAttribute("W", strs22);
		model.addAttribute("X", strs23);
		model.addAttribute("Y", strs24);
		model.addAttribute("Z", strs25);
		model.addAttribute("aZ", strs26);
		int count = 0;
		List<Publish_msg> pm = publish_msgService.loadBya1(u.getAccount());
		if (!pm.isEmpty())
			count = 2;
		else
			count = 0;

		model.addAttribute("count", count);
		return "home/friend";
	}

	// 点击头像查看信息checkUser.jsp
	@RequestMapping(value = "/{account}/{id}/{isto}/userInfo", method = RequestMethod.GET)
	public String userInfo(@PathVariable(value = "account") String account, @PathVariable(value = "id") String id,
			@PathVariable(value = "isto") String isto, Model model, HttpServletRequest request) throws ParseException {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser"); // 获取登陆用户

		User_info ui = (User_info) user_infoService.load(account);
		Student_status ss = student_statusService.load(account);

		Goodfriend goodfriend = new Goodfriend();
		goodfriend.setMyAccount(u.getAccount());
		goodfriend.setYourAccount(account);
		Goodfriend gr = goodfriendService.loadByYourAccount(goodfriend);

		model.addAttribute("user", ui);
		model.addAttribute("student_status", ss);
		model.addAttribute("gr", gr);
		model.addAttribute("isto", isto);
		model.addAttribute("id", id);
		return "home/userInfo";
	}

	// 好友验证
	@RequestMapping(value = "/{account}/{id}/{isto}/checkUser", method = RequestMethod.GET)
	public String checkUser(@PathVariable(value = "account") String account, @PathVariable(value = "id") String id,
			@PathVariable(value = "isto") String isto, Model model, HttpServletRequest request) throws ParseException {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser"); // 获取登陆用户

		User_info ui = (User_info) user_infoService.load(account);
		Student_status ss = student_statusService.load(account);

		// 对方的
		Goodfriend goodfriend = new Goodfriend();
		goodfriend.setMyAccount(account);
		goodfriend.setYourAccount(u.getAccount());
		Goodfriend gr = goodfriendService.loadByYourAccount(goodfriend);

		model.addAttribute("user", ui);
		model.addAttribute("student_status", ss);
		model.addAttribute("gr", gr);
		model.addAttribute("id", id);
		model.addAttribute("isto", isto);

		return "home/checkUser";
	}

	// 添加好友
	@RequestMapping(value = "/{account}/{id}/{isto}/Addfriend", method = RequestMethod.POST)
	public String Addfriend(@PathVariable(value = "account") String account, @PathVariable(value = "id") String id,
			@PathVariable(value = "isto") String isto, @RequestParam("text") String text, Model model,
			HttpServletRequest request) throws ParseException {
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser"); // 获取登陆用户

		Goodfriend goodfriend = new Goodfriend();
		goodfriend.setMyAccount(u.getAccount());
		goodfriend.setYourAccount(account);
		goodfriend.setIsAgree(0);
		Goodfriend gf1 = goodfriendService.loadByYourAccount(goodfriend);
		if (gf1 != null) {
			gf1.setIsAgree(0);
			goodfriendService.update(gf1);
		} else {
			goodfriendService.add(goodfriend);
		}

		// 官方提示
		Publish_msg pm = new Publish_msg();
		pm.setpAccount("a100000");
		pm.setpContent(text);
		pm.setSendToWho(account);

		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		Date now = new Date();
		String sendTime = sdf2.format(now); // 获取时间

		pm.setpTime(sendTime);

		publish_msgService.add(pm);

		return "redirect:/mainIndex/" + account + "/" + id + "/" + isto + "/userInfo.do";
	}

	// 同意好友申请
	@RequestMapping(value = "/{account}/{id}/{isto}/agreeAdd", method = RequestMethod.GET)
	public String agreeAdd(@PathVariable(value = "account") String account, @PathVariable(value = "id") String id,
			@PathVariable(value = "isto") String isto, Model model, HttpServletRequest request) throws ParseException {
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser"); // 获取登陆用户
		// 更新对方同意
		Goodfriend gf = new Goodfriend();
		gf.setYourAccount(u.getAccount());
		gf.setMyAccount(account);
		Goodfriend gd = goodfriendService.loadByYourAccount(gf);
		gd.setIsAgree(1);
		goodfriendService.update(gd); // 对方更新

		// 我同意
		Goodfriend gf2 = new Goodfriend();
		gf2.setYourAccount(account);
		gf2.setMyAccount(u.getAccount());
		Goodfriend gdd = goodfriendService.loadByYourAccount(gf2);
		if (gdd != null) {
			gdd.setIsAgree(1);
			goodfriendService.update(gdd); // 对方更新
		} else {
			gf2.setIsAgree(1);
			goodfriendService.add(gf2); // 我添加
		}

		return "redirect:/mainIndex/" + account + "/" + id + "/" + isto + "/userInfo.do";
	}

	// 拒绝好友申请
	@RequestMapping(value = "/{account}/{id}/{isto}/nofriend", method = RequestMethod.GET)
	public String nofriend(@PathVariable(value = "account") String account, @PathVariable(value = "id") String id,
			@PathVariable(value = "isto") String isto, Model model, HttpServletRequest request) throws ParseException {
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser"); // 获取登陆用户
		// 更新对方拒绝
		Goodfriend gf = new Goodfriend();
		gf.setYourAccount(u.getAccount());
		gf.setMyAccount(account);
		Goodfriend gd = goodfriendService.loadByYourAccount(gf);
		gd.setIsAgree(2);

		// 官方提示
		Publish_msg pm = new Publish_msg();
		pm.setpAccount("a100000");
		pm.setpContent("<a href=\'/CampusRewardSoft/mainIndex/" + u.getAccount() + "/10086/440/userInfo.do\'>用户："
				+ u.getUsername() + "拒绝了你的申请！</a>");
		pm.setSendToWho(account);

		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		Date now = new Date();
		String sendTime = sdf2.format(now); // 获取时间

		pm.setpTime(sendTime);

		publish_msgService.add(pm);

		goodfriendService.update(gd); // 对方更新

		// a100000

		return "redirect:/mainIndex/" + account + "/" + id + "/" + isto + "/checkUser.do";
	}

	// 删除好友
	@RequestMapping(value = "/{account}/{id}/{isto}/delfriend", method = RequestMethod.GET)
	public String delfriend(@PathVariable(value = "account") String account, @PathVariable(value = "id") String id,
			@PathVariable(value = "isto") String isto, Model model, HttpServletRequest request) throws ParseException {
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser"); // 获取登陆用户

		// 我删除
		Goodfriend goodfriend = new Goodfriend();
		goodfriend.setMyAccount(u.getAccount());
		goodfriend.setYourAccount(account);

		Goodfriend goodfriend1 = goodfriendService.loadByYourAccount(goodfriend);
		if (goodfriend1 != null) {
			goodfriend1.setIsAgree(2); // 不认识
			goodfriend1.setIsdelete(1);
			goodfriendService.update(goodfriend1);
		}
		// 对方删除
		Goodfriend gond = new Goodfriend();
		gond.setMyAccount(account);
		gond.setYourAccount(u.getAccount());

		Goodfriend goodfriend2 = goodfriendService.loadByYourAccount(gond);
		if (goodfriend2 != null) {
			goodfriend2.setIsAgree(2); // 不认识
			goodfriend2.setIsdelete(1);
			goodfriendService.update(goodfriend2);
		}
		// 官方提示
		Publish_msg pm = new Publish_msg();
		pm.setpAccount("a100000");
		pm.setpContent("<a href=\'/CampusRewardSoft/mainIndex/" + u.getAccount()
				+ "/10010/440/userInfo.do\' style=\'color:#339aff\'>用户：" + u.getUsername() + "和你删除了好友关系！</a>");
		pm.setSendToWho(account);

		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		Date now = new Date();
		String sendTime = sdf2.format(now); // 获取时间

		pm.setpTime(sendTime);
		publish_msgService.add(pm);

		return "redirect:/mainIndex/" + account + "/" + id + "/" + isto + "/userInfo.do";
	}

	// 我me.jsp
	@RequestMapping(value = "/me")
	public String me(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser");
		List<User> t = userService.load(u.getAccount());
		if (!t.isEmpty()) {
			for (User tt : t) {
				if (tt.getRole() == 4)
					return "redirect:/user/login.do";
			}
		}

		// 查找个人资料
		User_info ui = (User_info) user_infoService.load(u.getAccount());
		model.addAttribute("user_info", ui);
		int count = 0;
		List<Publish_msg> pm = publish_msgService.loadBya1(u.getAccount());
		if (!pm.isEmpty())
			count = 2;
		else
			count = 0;

		model.addAttribute("count", count);
		return "home/me";
	}

	// 点任务大厅的任务查看
	@RequestMapping(value = "/{pid}/{isto}/jobPage", method = RequestMethod.GET)
	public String jobPage(@PathVariable(value = "pid") String pid, @PathVariable(value = "isto") String isto,
			Model model) throws ParseException {

		Publish_job pj2 = publish_jobService.loadByPid(pid);
		User_info ui = user_infoService.load(pj2.getpAccount()); // 查找用户资料

		UserAndJob uj = new UserAndJob(); // 获取保存的数据
		uj.setPublish_job(pj2);
		uj.setUser_info(ui);

		System.out.println(uj.toString());
		JobPublishImage jpi = jobPublishImageService.load(uj.getPublish_job().getPId()); // 查找任务图片
		List img = new ArrayList<String>();
		String[] strs = {};
		if (jpi != null) {
			strs = jpi.getpImage().split("#");
			int count = 0;
			if (strs != null && !strs.equals("")) {
				for (String s : strs) {
					if (s.equals("") || s == null)
						continue;
					img.add(s);
					count++;
				}
				model.addAttribute("count", count);
				model.addAttribute("img", img);
			}
		}
		Publish_job pj = publish_jobService.loadByPid(uj.getPublish_job().getPId());

		// 时间间隔
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		Date now = new Date();
		String nowTime = sdf2.format(now);
		String ss = pj.getTimeLimit();
		String endTime = ss.replaceAll("T", " ");
		String timeLimit = TimeUtil.getDatePoor(endTime, nowTime);
		model.addAttribute("timeLimit", timeLimit);

		model.addAttribute("pj", pj);
		model.addAttribute("uj", uj);
		model.addAttribute("isto", isto);
		return "home/jobPage";
	}

	// 我的资料
	@RequestMapping(value = "/my_info", method = RequestMethod.GET)
	public String my_info(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser");
		// 查找个人资料
		User_info ui = (User_info) user_infoService.load(u.getAccount());
		model.addAttribute("user_info", ui);

		// 查找学籍
		Student_status ss = (Student_status) student_statusService.load(u.getAccount());
		model.addAttribute("stdent_status", ss);

		System.out.println(ss.toString());
		return "home/my_info";
	}

	@RequestMapping(value = "/my_info", method = RequestMethod.POST)
	public String my_info(@RequestParam("file") MultipartFile fs, HttpServletRequest request) throws IOException {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser");
		// 查找用户资料
		User_info user_info = user_infoService.load(u.getAccount());

		System.out.println(user_info.toString());
		// 以日期命名图片
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
		String newfilename = sdf.format(new Date()) + ".jpg";

		// 文件
		if (!fs.isEmpty()) {
			File file = new File(
					"E:\\eclipse_files\\project_files\\CampusRewardSoft\\src\\main\\webapp\\images\\user_headImage\\"
							+ newfilename);
			System.out.println(file.getName());
			FileUtils.copyInputStreamToFile(fs.getInputStream(), file);
		}
		user_info.setHeadsrc(newfilename);
		// 更新用户资料
		user_infoService.update(user_info);

		return "home/my_info";
	}

	// my_info的ajax请求
	@RequestMapping(value = "/changInfo", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String changInfo(@RequestParam("tkey") String tkey, @RequestParam("tvalue") String tvalue,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser");

		// 查找用户资料
		User_info user_info = user_infoService.load(u.getAccount());

		System.out.println(user_info.toString());
		if (tkey.equals("nickname")) {
			user_info.setNickname(tvalue);
			u.setUsername(tvalue);
		}
		if (tkey.equals("sex")) {
			if (tvalue.equals("男"))
				user_info.setSex(0);
			else
				user_info.setSex(1);
		}
		if (tkey.equals("birthday")) {
			user_info.setBirthday(tvalue);
		}
		if (tkey.equals("addr")) {
			user_info.setAddr(tvalue);
		}
		if (tkey.equals("school")) {
			List s = schoolService.load(tvalue);
			if (s.isEmpty()) {
				return "error";
			} else {
				// 查找学籍
				Student_status ss = student_statusService.load(u.getAccount());
				ss.setSchoolName(tvalue);
				student_statusService.update(ss);
			}
			return tvalue;
		}
		if (tkey.equals("yuanxi")) {
			// 查找学籍
			Student_status ss = student_statusService.load(u.getAccount());
			ss.setYuanXi(tvalue);
			student_statusService.update(ss);
			return tvalue;
		}
		if (tkey.equals("zhuanye")) {
			// 查找学籍
			Student_status ss = student_statusService.load(u.getAccount());
			ss.setZhuanYe(tvalue);
			student_statusService.update(ss);
			return tvalue;
		}
		if (tkey.equals("xueli")) {
			// 查找学籍
			Student_status ss = student_statusService.load(u.getAccount());
			ss.setXueLi(tvalue);
			student_statusService.update(ss);
			return tvalue;
		}
		if (tkey.equals("ruxueyear")) {
			// 查找学籍
			Student_status ss = student_statusService.load(u.getAccount());
			ss.setRuxueYear(tvalue);
			student_statusService.update(ss);
			return tvalue;
		}

		user_infoService.update(user_info);
		userService.update(u);
		return tvalue;
	}

	// 实名认证
	@RequestMapping(value = "/my_IDCard", method = RequestMethod.GET)
	public String my_IDCard(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser");
		IDCardInfo idcard = (IDCardInfo) iDCardInfoService.load(u.getAccount());
		model.addAttribute("idcard", idcard);
		/*
		 * if(idcard.getIsreal()==0){ //后台update model.addAttribute("testPass",
		 * "管理员审核中！"); } if(idcard.getIsreal()==1){ //后台update
		 * model.addAttribute("testPass", "审核通过"); } if(idcard.getIsreal()==2){
		 * //后台update model.addAttribute("testPass", "审核不通过"); }
		 */
		return "home/my_IDCard";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/my_IDCard", method = RequestMethod.POST)
	@ResponseBody
	public String my_IDCard(@RequestParam("realnamevalue") String realnamevalue,
			@RequestParam("idcardvalue") String idcardvalue, HttpServletRequest request) {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser");

		if (!IDCardUtil.isValid(idcardvalue))
			return "error";

		// 查找用户资料
		User_info user_info = user_infoService.load(u.getAccount());
		IDCardInfo iDCardInfo = new IDCardInfo();
		iDCardInfo.setUaccount(u.getAccount());
		iDCardInfo.setRealname(realnamevalue);
		iDCardInfo.setIdcard(idcardvalue);
		user_info.setRealname(realnamevalue);

		map = new HashMap<String, Object>();
		map.put("user_info", user_info);
		map.put("iDCardInfo", iDCardInfo);

		System.out.println(realnamevalue + "---56645--" + idcardvalue);
		return "home/my_IDCard";
	}

	@RequestMapping(value = "/my_IDCardTwo", method = RequestMethod.GET)
	public String my_IDCardTwo() {
		return "home/my_IDCardTwo";
	}

	@RequestMapping(value = "/my_IDCardTwo", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String my_IDCardTwo(@RequestParam("filename1") MultipartFile fs1,
			@RequestParam("filename2") MultipartFile fs2, @RequestParam("filename3") MultipartFile fs3,
			@RequestParam("filename4") MultipartFile fs4, HttpSession session) throws IOException {
		if (fs1.isEmpty() || fs2.isEmpty() || fs3.isEmpty() || fs4.isEmpty()) {
			return "error";
		}

		// 以日期命名图片
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
		String newfilename1 = "stuCardL" + sdf.format(new Date()) + ".jpg";
		String newfilename2 = "stuCardR" + sdf.format(new Date()) + ".jpg";
		String newfilename3 = "idCardL" + sdf.format(new Date()) + ".jpg";
		String newfilename4 = "idCardR" + sdf.format(new Date()) + ".jpg";
		// 文件上传
		if (!fs1.isEmpty() && !fs2.isEmpty() && !fs3.isEmpty() && !fs4.isEmpty()) {
			File file1 = new File(
					"E:\\eclipse_files\\project_files\\CampusRewardSoft\\src\\main\\webapp\\images\\IDCardImage\\"
							+ newfilename1);
			File file2 = new File(
					"E:\\eclipse_files\\project_files\\CampusRewardSoft\\src\\main\\webapp\\images\\IDCardImage\\"
							+ newfilename2);
			File file3 = new File(
					"E:\\eclipse_files\\project_files\\CampusRewardSoft\\src\\main\\webapp\\images\\IDCardImage\\"
							+ newfilename3);
			File file4 = new File(
					"E:\\eclipse_files\\project_files\\CampusRewardSoft\\src\\main\\webapp\\images\\IDCardImage\\"
							+ newfilename4);
			System.out.println(file1.getName() + " 2222" + file2.getName() + "33333" + file3.getName() + "44444"
					+ file4.getName());
			FileUtils.copyInputStreamToFile(fs1.getInputStream(), file1);
			FileUtils.copyInputStreamToFile(fs2.getInputStream(), file2);
			FileUtils.copyInputStreamToFile(fs3.getInputStream(), file3);
			FileUtils.copyInputStreamToFile(fs4.getInputStream(), file4);
		}

		User_info user_info = (User_info) map.get("user_info");
		IDCardInfo iDCardInfo = (IDCardInfo) map.get("iDCardInfo");
		iDCardInfo.setStuCardL(newfilename1);
		iDCardInfo.setStuCardR(newfilename2);
		iDCardInfo.setIdCardL(newfilename3);
		iDCardInfo.setIdCardR(newfilename4);

		IDCardInfo idcard = iDCardInfoService.load(iDCardInfo.getUaccount()); // 查找信息
		if (idcard != null) { // 已提交过实名，重新提交更新
			iDCardInfo.setIsreal(0);
			iDCardInfoService.update(iDCardInfo);
		} else {
			// 未实名过，添加实名认证
			iDCardInfoService.add(iDCardInfo);
			// user_infoService.update(user_info); //后台验证添加
		}
		return "home/my_IDCardTwo";
	}

	// 积分查询
	@RequestMapping(value = "/integration", method = RequestMethod.GET)
	public String integration(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser");
		List<User> uList = userService.load(u.getAccount());
		for (User user : uList) {
			model.addAttribute("me", user);
		}

		return "home/integration";
	}

	// 发布的任务
	@RequestMapping(value = "/myPublishJob", method = RequestMethod.GET)
	public String myPublishJob(HttpServletRequest request, Model model) throws ParseException {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser");
		List<Publish_job> pjlist = publish_jobService.loadByPaccount(u.getAccount()); // 查找任务
		List pjsList = new ArrayList<Object>(); // 用于存放任务
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		if (!pjlist.isEmpty()) {
			for (Publish_job pjob : pjlist) { // 任务遍历
				Receive_job rj = receive_jobService.loadByPid(pjob.getPId());

				UserAndJob userAndJob = new UserAndJob();

				Date now = new Date();
				String time = sdf2.format(now);
				String lt = pjob.getTimeLimit();
				String s3 = lt.replaceAll("T", " ");
				Date dt1 = sdf2.parse(time);
				Date dt2 = sdf2.parse(s3);

				// 任务被接，已完成
				if (pjob.getIsComplish() == 1) {
					userAndJob.setOutTime("进行中");
				}
				// 任务被接，已完成
				else if (pjob.getIsComplish() == 2) {
					userAndJob.setOutTime("已完成");
				}
				// 任务被接，失败
				else if (pjob.getIsComplish() == 3) {
					userAndJob.setOutTime("失败了");
				}
				// 任务审核
				else if (pjob.getIsComplish() == 520) {
					userAndJob.setOutTime("审核中");
				}
				// 任务被接，待验证
				else if (pjob.getIsComplish() == 4) {
					userAndJob.setOutTime("待验证");
				} else if (dt1.getTime() - dt2.getTime() > 0) { // 时间比较
					userAndJob.setOutTime("已过期");
				}
				User_info ui = user_infoService.load(pjob.getpAccount()); // 查找用户资料
				userAndJob.setUser_info(ui);
				userAndJob.setPublish_job(pjob);
				if (pjob.getpTitle().length() > 7) {
					userAndJob.setText(pjob.getpTitle().substring(0, 6) + "...");
				} else
					userAndJob.setText(pjob.getpTitle());

				pjsList.add(userAndJob);
			}
		}
		model.addAttribute("pjsList", pjsList);
		return "home/myPublishJob";
	}

	// 发布的任务管理
	@RequestMapping(value = "/{pid}/{isto}/myJobPage", method = RequestMethod.GET)
	public String myJobPage(HttpServletRequest request, Model model, @PathVariable(value = "pid") String pid,
			@PathVariable(value = "isto") String isto) throws ParseException {

		Publish_job pj2 = publish_jobService.loadByPid(pid);
		User_info ui = user_infoService.load(pj2.getpAccount()); // 查找用户资料

		UserAndJob uj = new UserAndJob(); // 获取保存的数据
		uj.setPublish_job(pj2);
		uj.setUser_info(ui);

		JobPublishImage jpi = jobPublishImageService.load(uj.getPublish_job().getPId()); // 查找任务的图片
		List img = new ArrayList<String>();
		String[] strs = {}; // 存放图片名称数组
		if (jpi != null) {
			strs = jpi.getpImage().split("#");// 获取图片所有名称
			int count = 0; // 图片数量
			if (strs != null && !strs.equals("")) {
				for (String s : strs) {
					if (s.equals("") || s == null)
						continue;
					img.add(s);
					count++;
				}

				model.addAttribute("count", count);
				model.addAttribute("img", img);
			}
		}
		Receive_job rj = receive_jobService.loadByPid(uj.getPublish_job().getPId());

		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		Date now = new Date();
		String time = sdf2.format(now);
		String lt = uj.getPublish_job().getTimeLimit();
		String s3 = lt.replaceAll("T", " ");
		Date dt1 = sdf2.parse(time);
		Date dt2 = sdf2.parse(s3);

		// 时间间隔
		String nowTime = sdf2.format(now);
		String ss = uj.getPublish_job().getTimeLimit();
		String endTime = ss.replaceAll("T", " ");
		String timeLimit = TimeUtil.getDatePoor(endTime, nowTime);
		model.addAttribute("timeLimit", timeLimit);

		// 任务没被接受，过期
		if ((rj == null || rj.equals("")) && (dt1.getTime() - dt2.getTime() > 0)
				&& uj.getPublish_job().getIsComplish() == 0) { // 时间比较
			model.addAttribute("state", "任务过期");

		}
		// 任务没被接受，没过期
		else if ((rj == null || rj.equals(""))
				&& (uj.getPublish_job().getIsComplish() == 0 || uj.getPublish_job().getIsComplish() == 520)
				&& dt1.getTime() - dt2.getTime() < 0) {
			model.addAttribute("state", "撤消发布");
		}
		// 任务被接执行中
		else if (rj != null && !rj.equals("") && uj.getPublish_job().getIsComplish() == 1) {
			model.addAttribute("state", "任务进行中...");
		}
		// 任务被接，已完成
		else if (uj.getPublish_job().getIsComplish() == 2) {
			model.addAttribute("state", "任务已完成!");
		}
		// 任务被接，发布者认为失败
		else if (uj.getPublish_job().getIsComplish() == 3) {
			model.addAttribute("state", "任务失败!!");
		}
		// 任务被接，发布者验证
		else if (rj != null && !rj.equals("") && uj.getPublish_job().getIsComplish() == 4) {
			model.addAttribute("state", "点击验证");
		}
		if (rj != null) {
			User_info rui = user_infoService.load(rj.getrAccount());
			model.addAttribute("rui", rui);
		}
		model.addAttribute("uj", uj);
		model.addAttribute("rj", rj);
		return "home/myJobPage";
	}

	// 点击去验证
	@RequestMapping(value = "/toOderPage", method = RequestMethod.POST)
	@ResponseBody
	public String toOderPage(@RequestParam("pid") String pid, HttpServletRequest request, Model model) {

		Oder oder = oderService.loadByPid(pid); // 据id查找订单
		return oder.getOderid();
	}

	// 删除发布的任务delRJob
	@RequestMapping(value = "/delJob", method = RequestMethod.POST)
	@ResponseBody
	public String delJob(@RequestParam("pid") String pid, Model model) throws ParseException {

		Publish_job pj = publish_jobService.loadByPid(pid);
		pj.setIsDelete(1);
		publish_jobService.update(pj);

		Receive_job rj = receive_jobService.loadByPid(pj.getPId());

		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		Date now = new Date();
		String time = sdf2.format(now);
		String lt = pj.getTimeLimit();
		String s3 = lt.replaceAll("T", " ");
		Date dt1 = sdf2.parse(time);
		Date dt2 = sdf2.parse(s3);
		// 任务没被接受，过期
		if ((rj == null || rj.equals("")) && (dt1.getTime() - dt2.getTime() > 0) && pj.getIsComplish() == 0) { // 时间比较

			List<User> ulist = userService.load(pj.getpAccount());
			for (User user : ulist) {
				user.setMoney(user.getMoney() + pj.getPrice()); // 赏金退回
				userService.update(user);
			}

			Publish_msg pm = new Publish_msg();
			pm.setpAccount("a100000"); // 发送者
			pm.setpContent("过期任务#" + pj.getpTitle() + "#已被删除，赏金已退回。"); // 发送内容
			pm.setpTime(time); // 发送时间
			pm.setSendToWho(pj.getpAccount()); // 发送给谁

			publish_msgService.add(pm); // 添加到数据库
		}
		// 任务没被接受，没过期
		else if ((rj == null || rj.equals("")) && (pj.getIsComplish() == 0 || pj.getIsComplish() == 520)
				&& dt1.getTime() - dt2.getTime() < 0) {

			List<User> ulist = userService.load(pj.getpAccount());
			for (User user : ulist) {
				user.setMoney(user.getMoney() + pj.getPrice()); // 赏金退回
				userService.update(user);
			}

			Publish_msg pm = new Publish_msg();
			pm.setpAccount("a100000"); // 发送者
			pm.setpContent("任务#" + pj.getpTitle() + "#已撤消，赏金已退回。"); // 发送内容
			pm.setpTime(time); // 发送时间
			pm.setSendToWho(pj.getpAccount()); // 发送给谁

			publish_msgService.add(pm); // 添加到数据库
		}

		return "home/myPublishJob";
	}

	// ajax删除接受任务
	@RequestMapping(value = "/delRJob", method = RequestMethod.POST)
	@ResponseBody
	public String delRJob(@RequestParam("pid") String pid, Model model) {

		Receive_job rj = receive_jobService.loadByPid(pid);
		rj.setIsDelete(1);
		receive_jobService.update(rj);

		return "home/myReceiveJob";
	}

	// ajax删除订单
	@RequestMapping(value = "/delOder", method = RequestMethod.POST)
	@ResponseBody
	public String delOder(@RequestParam("oderid") String oderid, Model model) {

		Oder oder = oderService.load(oderid);
		oder.setIsDelete(1);
		oderService.update(oder);

		return "home/myOder";
	}

	// ajax大厅接受任务 、提交任务
	@RequestMapping(value = "/{pid}/{kind}/{isto}/ReceiveJob", method = RequestMethod.POST)
	@ResponseBody
	public String ReceiveJob(@PathVariable(value = "pid") String pid, @PathVariable(value = "kind") String kind,
			@PathVariable(value = "isto") String isto, Model model, HttpServletRequest request) throws ParseException {
		String kind2 = "";
		if (kind.equals("acc"))
			kind2 = "接受任务";
		if (kind.equals("commit"))
			kind2 = "提交任务";

		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser");

		Publish_job pj = publish_jobService.loadByPid(pid); // 查找任务

		Receive_job receive_job = new Receive_job();
		receive_job.setpId(pid); // 设置接受任务
		receive_job.setrAccount(u.getAccount()); // 设置接受者

		if (kind2.equals("接受任务") && pj.getIsComplish() == 0) {
			pj.setIsComplish(1); // 任务进行
			Date now = new Date();
			String time = sdf2.format(now);
			receive_job.setrTime(time); // 设置接受时间

			receive_jobService.add(receive_job); // 添加接受任务

			String sendTime = sdf2.format(now); // 获取时间
			Publish_msg pm = new Publish_msg();
			pm.setpAccount("a100000"); // 发送者
			pm.setpContent("你发布的任务：#" + pj.getpTitle() + "#已被接。"); // 发送内容
			pm.setpTime(sendTime); // 发送时间
			pm.setSendToWho(pj.getpAccount()); // 发送给谁

			publish_msgService.add(pm); // 添加到数据库

		} else if (kind2.equals("提交任务")) {
			pj.setIsComplish(4); // 任务待验证

			Date now = new Date();
			String okTime = sdf2.format(now);
			Receive_job rj = receive_jobService.loadByPid(pid);
			rj.setOkTime(okTime);
			receive_jobService.update(rj);

			String lt = pj.getTimeLimit();
			String s3 = lt.replaceAll("T", " ");
			Date dt1 = sdf2.parse(okTime);
			Date dt2 = sdf2.parse(s3);

			// 超时则扣积分
			if (dt1.getTime() - dt2.getTime() > 0) {
				List<User> ulist = userService.load(u.getAccount());
				for (User user : ulist) {
					user.setCreditIntegral(user.getCreditIntegral() - 2); // 积分-2
					userService.update(user);
				}
			}

			String sendTime = sdf2.format(now); // 获取时间
			Publish_msg pm = new Publish_msg();
			pm.setpAccount("a100000"); // 发送者
			pm.setpContent("你发布的任务：#" + pj.getpTitle() + "#接收者已提交，待验证。"); // 发送内容
			pm.setpTime(sendTime); // 发送时间
			pm.setSendToWho(pj.getpAccount()); // 发送给谁

			publish_msgService.add(pm); // 添加到数据库
		}

		publish_jobService.update(pj); // 更新任务

		return isto;
	}

	// 我接受的任务
	@RequestMapping(value = "/myReceiveJob", method = RequestMethod.GET)
	public String myReceiveJob(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser");

		List<Receive_job> rjlist = receive_jobService.loadByRaccount(u.getAccount()); // 查找任务
		List rjsList = new ArrayList<Object>(); // 用于存放任务
		if (!rjlist.isEmpty()) {
			for (Receive_job rjob : rjlist) { // 任务遍历

				Publish_job pjob = publish_jobService.loadByPidAnd(rjob.getpId()); // 查找发布者

				UserAndJob userAndJob = new UserAndJob();

				// 任务被接，已完成
				if (pjob.getIsComplish() == 1) {
					userAndJob.setOutTime("待提交");
				}
				// 任务被接，已完成
				if (pjob.getIsComplish() == 2) {
					userAndJob.setOutTime("已完成");
				}
				// 任务被接，失败
				else if (pjob.getIsComplish() == 3) {
					userAndJob.setOutTime("失败了");
				}
				// 任务被接，失败
				else if (pjob.getIsComplish() == 4) {
					userAndJob.setOutTime("待确认");
				}
				User_info ui = user_infoService.load(pjob.getpAccount()); // 查找用户资料
				userAndJob.setUser_info(ui);
				userAndJob.setReceive_job(rjob);
				userAndJob.setPublish_job(pjob);
				if (pjob.getpTitle().length() > 7) {
					userAndJob.setText(pjob.getpTitle().substring(0, 6) + "...");
				} else
					userAndJob.setText(pjob.getpTitle());
				rjsList.add(userAndJob);
			}
		}
		model.addAttribute("rjsList", rjsList);
		return "home/myReceiveJob";
	}

	// 我的订单
	@RequestMapping(value = "/myOder", method = RequestMethod.GET)
	public String myOder(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser");

		String oderState = "";
		// List<Oder> list = oderService.loadByAccount(u.getAccount()); //
		// 查找我发布的订单
		List<Oder> allOder = oderService.load(); // 查找所有订单

		List<UserAndJob> prOder = new ArrayList<UserAndJob>(); // 存放UserAndJob
		// prOder=list;
		for (Oder roder : allOder) {
			Receive_job rj = receive_jobService.loadByPid(roder.getPid());
			// 找出我接受和发布的任务的订单
			if (u.getAccount().equals(rj.getrAccount())
					|| u.getAccount().equals(roder.getPublish_job().getpAccount())) {
				UserAndJob uj = new UserAndJob();
				User_info ui = user_infoService.load(rj.getrAccount());
				uj.setOder(roder);
				uj.setReceive_job(rj);
				uj.setUser_info(ui);
				if (roder.getPublish_job().getpTitle().length() > 7) {
					uj.setText(roder.getPublish_job().getpTitle().substring(0, 6) + "...");
				} else
					uj.setText(roder.getPublish_job().getpTitle());

				prOder.add(uj);
			}
		}

		for (UserAndJob ujoder : prOder) {
			// 任务进行中
			/*
			 * if (oder.getPublish_job().getIsComplish() == 1) { oderState =
			 * "进行中"; }
			 */
			// 任务完成
			if (ujoder.getOder().getPublish_job().getIsComplish() == 2) {
				oderState = "交易完成";
			}
			// 任务待确定
			/*
			 * if (oder.getPublish_job().getIsComplish() == 4) { oderState =
			 * "待验证"; }
			 */
			// 任务失败
			if (ujoder.getOder().getPublish_job().getIsComplish() == 3) {
				oderState = "交易失败";
			}
		}
		model.addAttribute("oderState", oderState);
		model.addAttribute("oderList", prOder);
		return "home/myOder";
	}

	// 订单页面信息
	@RequestMapping(value = "/{oderid}/{isto}/oderPage", method = RequestMethod.GET)
	public String oderPage(@PathVariable(value = "oderid") String oderid, @PathVariable(value = "isto") String isto,
			Model model) {

		Oder oder = oderService.load(oderid); // 据id查找订单
		if (oder != null) {
			Receive_job rj = receive_jobService.loadByPid(oder.getPublish_job().getPId()); // 查找任务接受者
			User_info oui = user_infoService.load(oder.getPublish_job().getpAccount());
			User_info rui = user_infoService.load(rj.getrAccount()); // 查询接受者账号
			if (oder.getPublish_job().getpContent().length() > 80) {
				String text = oder.getPublish_job().getpContent().substring(0, 80);
				model.addAttribute("text", text);
			}
			String rtime = oder.getPublish_job().getTimeLimit().replaceAll("T", " ");

			model.addAttribute("rj", rj);
			model.addAttribute("oder", oder);
			model.addAttribute("oui", oui);
			model.addAttribute("rui", rui);
			model.addAttribute("rtime", rtime);
			model.addAttribute("isto", isto);
		}
		return "home/oderPage";
	}

	// oderPageAjax请求
	@RequestMapping(value = "/{pid}/testJob2", method = RequestMethod.POST)
	@ResponseBody
	public String testJob2(@PathVariable(value = "pid") String pid, @RequestParam("result") String result,
			HttpServletRequest request, Model model) {

		Publish_job pj = publish_jobService.loadByPid(pid); // 据id查找任务
		if (result.equals("2")) {
			pj.setIsComplish(2);

			/* 交易成功，增加1信誉积分 */
			Receive_job rj = receive_jobService.loadByPid(pj.getPId()); // 查找任务接受者
			List<User> u = userService.load(rj.getrAccount());
			for (User user : u) {
				user.setCreditIntegral(user.getCreditIntegral() + 1 > 100 ? 100 : user.getCreditIntegral() + 1); // 积分+1
				user.setMoney(user.getMoney() + pj.getPrice());
				userService.update(user);

				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
				Date now = new Date();
				String sendTime = sdf2.format(now); // 获取时间
				Publish_msg pm = new Publish_msg();
				pm.setpAccount("a100000"); // 发送者
				pm.setpContent("你接受的任务#" + pj.getpTitle() + "#已完成，获得的赏金已存入余额。"); // 发送内容
				pm.setpTime(sendTime); // 发送时间
				pm.setSendToWho(user.getAccount()); // 发送给谁

				publish_msgService.add(pm); // 添加到数据库

			}

		}
		if (result.equals("3")) {
			pj.setIsComplish(3);

			/* 交易失败，接收者扣除2信誉积分 */
			Receive_job rj = receive_jobService.loadByPid(pj.getPId()); // 查找任务接受者

			List<User> u = userService.load(rj.getrAccount());
			for (User user : u) {
				user.setCreditIntegral(user.getCreditIntegral() - 2); // 积分-2
				userService.update(user); // 更新

				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
				Date now = new Date();
				String sendTime = sdf2.format(now); // 获取时间
				Publish_msg pm = new Publish_msg();
				pm.setpAccount("a100000"); // 发送者
				pm.setpContent("你接受的任务#" + pj.getpTitle() + "#已失败，扣除2信誉积分。"); // 发送内容
				pm.setpTime(sendTime); // 发送时间
				pm.setSendToWho(user.getAccount()); // 发送给谁

				publish_msgService.add(pm); // 添加到数据库
			}

			// 发布者退钱
			List<User> u2 = userService.load(pj.getpAccount());
			for (User user : u2) {
				user.setMoney(user.getMoney() + pj.getPrice());
				userService.update(user); // 更新

				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
				Date now = new Date();
				String sendTime = sdf2.format(now); // 获取时间
				Publish_msg pm = new Publish_msg();
				pm.setpAccount("a100000"); // 发送者
				pm.setpContent("你发布的任务#" + pj.getpTitle() + "#交易失败，赏金退回。"); // 发送内容
				pm.setpTime(sendTime); // 发送时间
				pm.setSendToWho(user.getAccount()); // 发送给谁

				publish_msgService.add(pm); // 添加到数据库
			}
		}

		publish_jobService.update(pj);

		// 以日期为订单id
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
		String oderid = sdf.format(new Date());
		// 生成订单添加
		Oder oder = new Oder();
		oder.setOderid(oderid);
		oder.setPid(pid);

		oderService.add(oder); // 添加订单

		return pid;
	}

	// oderPageAjax请求
	/*
	 * @RequestMapping(value = "/{oderid}/testJob", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public String testJob(@PathVariable(value = "oderid")
	 * String oderid, @RequestParam("result") String result, HttpServletRequest
	 * request, Model model) {
	 * 
	 * Oder oder = oderService.load(oderid); // 据id查找订单 Publish_job pj =
	 * oder.getPublish_job(); if (result.equals("2")) { pj.setIsComplish(2);
	 * 
	 * // 交易成功，增加1信誉积分 Receive_job rj =
	 * receive_jobService.loadByPid(pj.getPId()); // 查找任务接受者 List<User> u =
	 * userService.load(rj.getrAccount()); for (User user : u) {
	 * user.setCreditIntegral(user.getCreditIntegral() + 1); // 积分+1
	 * userService.update(user); }
	 * 
	 * } if (result.equals("3")) { pj.setIsComplish(3); }
	 * 
	 * publish_jobService.update(pj); return oderid; }
	 */

	// 设置
	@RequestMapping(value = "/softSet", method = RequestMethod.GET)
	public String softSet() {

		return "home/softSet";
	}

	// 退出后进入登陆页面.
	@RequestMapping(value = "/aboutSoft")
	public String aboutSoft() {
		return "home/aboutSoft";
	}

	// 设置-账号与安全
	@RequestMapping(value = "/accountAndSafe")
	public String accountAndSafe(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser");
		List<User> list = userService.load(u.getAccount());
		for (User user : list) {
			model.addAttribute("user", user);
		}

		return "home/accountAndSafe";
	}

	// 设置-账号与安全
	@RequestMapping(value = "/alterAccountPass")
	@ResponseBody
	public String alterAccountPass(@RequestParam("tkey") String tkey, @RequestParam("tvalue") String tvalue,
			HttpServletRequest request) {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser"); // 登陆者；

		List<User> ulist = userService.load(u.getAccount()); // 查找登陆号
		User_info ui = user_infoService.load(u.getAccount()); // 用户信息
		Student_status student_status = (Student_status) student_statusService.load(u.getAccount()); // 学籍
		// List <Receive_msg> rm =receive_msgService.load(u.getAccount());
		// //接受消息
		List<Receive_job> rj = receive_jobService.loadByRaccount(u.getAccount()); // 接受任务
		// List <Publish_msg>pm=publish_msgService.load(u.getAccount()); //发布消息
		List<Publish_job> pj = publish_jobService.loadByPaccount(u.getAccount());
		IDCardInfo idc = iDCardInfoService.load(u.getAccount());
		// Goodfriend gf = goodfriendService.load(u.getAccount());

		List list = userService.load(tvalue); // 查找修改号
		// 修改手机号
		if (tkey.equals("account")) {
			if (!list.isEmpty())
				return "phoneError"; // 账号已存在
			for (User user : ulist) {
				user.setAccount(tvalue);
				/**
				 * 
				 * 
				 * 
				 * 
				 */
				userService.update(user);
			}
		}
		// 修改邮箱
		if (tkey.equals("email")) {
			if (!list.isEmpty())
				return "emailError"; // 账号已存在
			for (User user : ulist) {
				user.setEmail(tvalue);
				userService.update(user);
			}
		}

		return "home/alterAccountPass";
	}

	// 我的钱包
	@RequestMapping(value = "/myMoney")
	public String myMoney(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser");

		model.addAttribute("account", u.getAccount());

		List<User> list = userService.load(u.getAccount());
		for (User user : list) {
			model.addAttribute("user", user);
		}

		return "home/myMoney";
	}

	// 充值界面
	@RequestMapping(value = "/addMoney", method = RequestMethod.GET)
	public String addMoney(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser");

		model.addAttribute("account", u.getAccount());

		List<User> list = userService.load(u.getAccount());
		for (User user : list) {
			model.addAttribute("user", user);
		}

		return "home/addMoney";
	}

	@RequestMapping(value = "/addMoney", method = RequestMethod.POST)
	public String addMoney(HttpServletRequest request, @RequestParam("money") int money) {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser");

		List<User> list = userService.load(u.getAccount());
		for (User user : list) {
			user.setMoney(user.getMoney() + money);
			userService.update(user);
		}

		return "home/addMoney";
	}

	// 设置-账号与安全-修改密码
	@RequestMapping(value = "/change_myPass")
	public String change_myPass(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser");

		model.addAttribute("account", u.getAccount());
		/*
		 * List<User> list = userService.load(u.getAccount()); for (User user :
		 * list) { model.addAttribute("user", user); }
		 */

		return "home/change_myPass";
	}

	// 问题反馈.
	@RequestMapping(value = "/problen", method = RequestMethod.GET)
	public String problen() {

		return "home/problen";
	}

	@RequestMapping(value = "/problen", method = RequestMethod.POST)
	@ResponseBody
	public String problen(HttpServletRequest request, @RequestParam("txt") String txt) {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginUser");

		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		Date now = new Date();
		String sendTime = sdf2.format(now); // 获取时间

		Publish_msg pm = new Publish_msg();
		pm.setpAccount(u.getAccount()); // 发送者
		pm.setpContent("#问题反馈，#" + txt); // 发送内容
		pm.setpTime(sendTime); // 发送时间
		pm.setSendToWho("a100000"); // 发送给谁

		publish_msgService.add(pm); // 添加到数据库
		return "home/problen";
	}

	// 退出后进入登陆页面.
	@RequestMapping(value = "/loginout")
	public String loginout(HttpSession session) {
		// 清除session
		session.invalidate();
		// 返回登陆页面
		return "redirect:/user/login.do";
	}

}
