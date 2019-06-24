package com.sise.ycj.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.expr.Cast;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sise.ycj.dao.JobPublishImageDao;
import com.sise.ycj.model.IDCardInfo;
import com.sise.ycj.model.JobPublishImage;
import com.sise.ycj.model.JobTuiJian;
import com.sise.ycj.model.Oder;
import com.sise.ycj.model.Page;
import com.sise.ycj.model.Publish_job;
import com.sise.ycj.model.Publish_msg;
import com.sise.ycj.model.Receive_job;
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
import com.sise.ycj.util.ChatTime;
import com.sise.ycj.util.EmailHelper;
import com.sise.ycj.util.FilterHtmlUtil;
import com.sise.ycj.util.TimeUtil;

@Controller("managerController")
@RequestMapping("/admin")
public class ManagerController {
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

	String code = "";

	// 登陆
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {

		return "admin/login";
	}

	// 登陆验证
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String login(@RequestParam("account") String account, @RequestParam("pass") String pass, Model model,
			HttpServletRequest request) {

		List<User> ulist = userService.load(account);
		boolean passTrue = false;
		// 账号存在
		if (!ulist.isEmpty()) {
			for (User user : ulist) {
				// 密码正确
				if (user.getPassword().equals(pass) && user.getRole() == 1) {
					passTrue = true;
					request.getSession().setAttribute("loginAdmin", user);
				}
			}
			// 密码错误
			if (!passTrue) {
				return "err";
			}
		} else { // 账号错误
			return "err";
		}

		model.addAttribute("account", account);
		return "admin/login";
	}

	// 找回密码
	@RequestMapping(value = "/findPass", method = RequestMethod.GET)
	public String findPass() {

		return "admin/findPass";
	}

	// 发送验证码
	@RequestMapping(value = "/sendCode", method = RequestMethod.POST)
	@ResponseBody
	public String sendCode(@RequestParam("email") String email) {

		List<User> ulist = userService.load(email);
		// 账号存在
		if (!ulist.isEmpty()) {
			for (User user : ulist) {
				String subject = "校园赏金"; // 邮箱主题
				String content = "验证码："; // 设置邮箱内容
				code = EmailHelper.getCode(); // 获取验证码
				content += code + " ，1分钟内有效，验证码泄露可能会被盗号，打死不告诉别人！";
				try {
					EmailHelper.sendEmail(email, subject, content);
					break;
				} catch (Exception e) {
					e.printStackTrace();
					return "err";
				}
			}
		} else {
			return "err";
		}
		return "admin/findPass";
	}

	// 找回密码
	@RequestMapping(value = "/findPass", method = RequestMethod.POST)
	@ResponseBody
	public String findPass(@RequestParam("email") String email, @RequestParam("code") String codes) {

		List<User> ulist = userService.load(email);
		// 账号存在
		if (!ulist.isEmpty()) {
			for (User user : ulist) {
				if (user.getRole() == 1) {
					if (codes.equals(code)) {
						return user.getPassword();
					} else
						return "err";
				}
			}
		}
		return "err";
	}

	// 主界面
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginAdmin"); // 登陆者

		if (u == null)
			return "admin/login";

		User_info ui = user_infoService.load(u.getAccount());

		model.addAttribute("ui", ui);
		return "admin/index";
	}

	// 注册管理员
	@RequestMapping(value = "/registerAdmin", method = RequestMethod.GET)
	public String registerAdmin(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginAdmin"); // 登陆者

		if (u == null)
			return "admin/login";

		User_info ui = user_infoService.load(u.getAccount());

		model.addAttribute("ui", ui);
		return "admin/registerAdmin";
	}

	// 个人资料
	@RequestMapping(value = "/myui", method = RequestMethod.GET)
	public String myui(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginAdmin"); // 登陆者

		if (u == null)
			return "admin/login";

		User_info ui = user_infoService.load(u.getAccount());
		Student_status ss = student_statusService.load(u.getAccount());

		model.addAttribute("ui", ui);
		model.addAttribute("ss", ss);
		return "admin/myui";
	}

	// 用户管理
	@RequestMapping(value = "/userManager", method = RequestMethod.GET)
	public String userManager(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginAdmin"); // 登陆者
		if (u == null)
			return "admin/login";
		User_info ui = user_infoService.load(u.getAccount());

		// 分页
		Page page = new Page();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "%%");
		map.put("offSet", 0);
		map.put("pageSize", 10);

		List<User> ulist = userService.load(map); // 总数据
		int total = userService.loadCount(map); // 总条数

		int zys = total / 10;
		zys = total % 10 > 0 ? zys + 1 : zys; // 得总页数
		int cur = 1; // 当前页
		int PageStart = cur - 2 > 0 ? cur - 2 : 1; // 起始页
		int PageEnd = cur + 2 > zys ? zys : (zys < 5 ? zys : cur + 2); // 结束页

		if (cur < 3 && zys >= 5)
			PageEnd = 5;
		if (cur > zys - 2 && zys >= 5)
			PageStart = PageEnd - 4;

		page.setPageOffset(0); // 设置起始页
		page.setDatas(ulist); // 设置数据
		page.setPageIndex(0); // 设置当前页
		page.setPageSize(10); // 设置每页显示条数
		page.setTotalPage(zys); // 设置总页数
		page.setPageStart(PageStart); // 起始页
		page.setPageEnd(PageEnd); // 结束页

		model.addAttribute("page", page);
		model.addAttribute("ui", ui);
		model.addAttribute("cur", cur);

		return "admin/userManager";
	}

	// 用户管理
	@RequestMapping(value = "/userManager", method = RequestMethod.POST)
	public String userManager(HttpServletRequest request, Model model, @RequestParam("name") String name,
			@RequestParam("offSet") int offSet, @RequestParam("pageSize") int pageSize) {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginAdmin"); // 登陆者
		if (u == null)
			return "admin/login";
		User_info ui = user_infoService.load(u.getAccount());

		// 分页
		Page page = new Page();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "%" + name + "%");
		map.put("offSet", (offSet - 1) * 10);
		map.put("pageSize", pageSize);

		List<User> ulist = userService.load(map); // 总数据
		int total = userService.loadCount(map); // 总条数

		int zys = total / 10;
		zys = total % 10 > 0 ? zys + 1 : zys; // 得总页数
		int cur = offSet; // 当前页
		int PageStart = cur - 2 > 0 ? cur - 2 : 1; // 起始页
		int PageEnd = cur + 2 > zys ? zys : (zys < 5 ? zys : cur + 2); // 结束页

		if (cur < 3 && zys >= 5)
			PageEnd = 5;
		if (cur > zys - 2 && zys >= 5)
			PageStart = PageEnd - 4;

		page.setDatas(ulist); // 设置数据
		page.setPageSize(pageSize); // 设置每页显示条数
		page.setTotalPage(zys); // 设置总页数
		page.setPageStart(PageStart); // 起始页
		page.setPageEnd(PageEnd); // 结束页

		model.addAttribute("page", page);
		model.addAttribute("ui", ui);
		model.addAttribute("cur", cur);
		model.addAttribute("name", name);

		return "admin/userManager";
	}

	// 封号解封
	@RequestMapping(value = "/jieHeJin", method = RequestMethod.POST)
	@ResponseBody
	public String jieHeJin(HttpServletRequest req, @RequestParam("account") String account,
			@RequestParam("jin") int jin) {
		List<User> ulist = userService.load(account);

		// 封号
		if (!ulist.isEmpty() && jin == 1)
			for (User u : ulist) {
				u.setRole(4);
				userService.update(u);

				String qqemail = u.getEmail(); // 获取用户邮箱
				String subject = "校园赏金客服"; // 邮箱主题
				String content = "你的账号已被封，详细情况请联系客服！"; // 设置邮箱内容

				try {
					EmailHelper.sendEmail(qqemail, subject, content);
				} catch (Exception e) {
					e.printStackTrace();
					return "home/forget_pass";
				}
			}

		// 解封
		if (!ulist.isEmpty() && jin == 0)
			for (User u : ulist) {
				u.setRole(0);
				userService.update(u);

				String qqemail = u.getEmail(); // 获取用户邮箱
				String subject = "校园赏金客服"; // 邮箱主题
				String content = "你的账号被解封！"; // 设置邮箱内容

				try {
					EmailHelper.sendEmail(qqemail, subject, content);
				} catch (Exception e) {
					e.printStackTrace();
					return "home/forget_pass";
				}
			}
		return "err";
	}

	// 用户学籍管理
	@RequestMapping(value = "/studentStatesManager", method = RequestMethod.GET)
	public String studentStatesManager(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginAdmin"); // 登陆者
		if (u == null)
			return "admin/login";
		User_info ui = user_infoService.load(u.getAccount());

		// 分页
		Page page = new Page();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "%%");
		map.put("offSet", 0);
		map.put("pageSize", 10);

		List<Student_status> ulist = student_statusService.loadByName(map); // 总数据
		int total = student_statusService.loadCount(map); // 总条数

		int zys = total / 10;
		zys = total % 10 > 0 ? zys + 1 : zys; // 得总页数
		int cur = 1; // 当前页
		int PageStart = cur - 2 > 0 ? cur - 2 : 1; // 起始页
		int PageEnd = cur + 2 > zys ? zys : (zys < 5 ? zys : cur + 2); // 结束页

		if (cur < 3 && zys >= 5)
			PageEnd = 5;
		if (cur > zys - 2 && zys >= 5)
			PageStart = PageEnd - 4;

		page.setPageOffset(0); // 设置起始页
		page.setDatas(ulist); // 设置数据
		page.setPageIndex(0); // 设置当前页
		page.setPageSize(10); // 设置每页显示条数
		page.setTotalPage(zys); // 设置总页数
		page.setPageStart(PageStart); // 起始页
		page.setPageEnd(PageEnd); // 结束页

		model.addAttribute("page", page);
		model.addAttribute("ui", ui);
		model.addAttribute("cur", cur);

		return "admin/studentStatesManager";
	}

	// 用户学籍管理
	@RequestMapping(value = "/studentStatesManager", method = RequestMethod.POST)
	public String studentStatesManager(HttpServletRequest request, Model model, @RequestParam("name") String name,
			@RequestParam("offSet") int offSet, @RequestParam("pageSize") int pageSize) {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginAdmin"); // 登陆者
		if (u == null)
			return "admin/login";
		User_info ui = user_infoService.load(u.getAccount());

		// 分页
		Page page = new Page();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "%" + name + "%");
		map.put("offSet", (offSet - 1) * 10);
		map.put("pageSize", pageSize);

		List<Student_status> ulist = student_statusService.loadByName(map); // 总数据
		int total = student_statusService.loadCount(map); // 总条数

		int zys = total / 10;
		zys = total % 10 > 0 ? zys + 1 : zys; // 得总页数
		int cur = offSet; // 当前页
		int PageStart = cur - 2 > 0 ? cur - 2 : 1; // 起始页
		int PageEnd = cur + 2 > zys ? zys : (zys < 5 ? zys : cur + 2); // 结束页

		if (cur < 3 && zys >= 5)
			PageEnd = 5;
		if (cur > zys - 2 && zys >= 5)
			PageStart = PageEnd - 4;

		page.setDatas(ulist); // 设置数据
		page.setPageSize(pageSize); // 设置每页显示条数
		page.setTotalPage(zys); // 设置总页数
		page.setPageStart(PageStart); // 起始页
		page.setPageEnd(PageEnd); // 结束页

		model.addAttribute("page", page);
		model.addAttribute("ui", ui);
		model.addAttribute("cur", cur);
		model.addAttribute("name", name);

		return "admin/studentStatesManager";
	}

	// 用户资料
	@RequestMapping(value = "/user_InfoManager", method = RequestMethod.GET)
	public String user_InfoManager(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginAdmin"); // 登陆者
		if (u == null)
			return "admin/login";
		User_info ui = user_infoService.load(u.getAccount());

		// 分页
		Page page = new Page();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "%%");
		map.put("offSet", 0);
		map.put("pageSize", 10);

		List<User_info> ulist = user_infoService.loadByName(map); // 总数据
		int total = user_infoService.loadCount(map); // 总条数

		int zys = total / 10;
		zys = total % 10 > 0 ? zys + 1 : zys; // 得总页数
		int cur = 1; // 当前页
		int PageStart = cur - 2 > 0 ? cur - 2 : 1; // 起始页
		int PageEnd = cur + 2 > zys ? zys : (zys < 5 ? zys : cur + 2); // 结束页

		if (cur < 3 && zys >= 5)
			PageEnd = 5;
		if (cur > zys - 2 && zys >= 5)
			PageStart = PageEnd - 4;

		page.setPageOffset(0); // 设置起始页
		page.setDatas(ulist); // 设置数据
		page.setPageIndex(0); // 设置当前页
		page.setPageSize(10); // 设置每页显示条数
		page.setTotalPage(zys); // 设置总页数
		page.setPageStart(PageStart); // 起始页
		page.setPageEnd(PageEnd); // 结束页

		model.addAttribute("page", page);
		model.addAttribute("ui", ui);
		model.addAttribute("cur", cur);

		return "admin/user_InfoManager";
	}

	// 用户资料
	@RequestMapping(value = "/user_InfoManager", method = RequestMethod.POST)
	public String user_InfoManager(HttpServletRequest request, Model model, @RequestParam("name") String name,
			@RequestParam("offSet") int offSet, @RequestParam("pageSize") int pageSize) {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginAdmin"); // 登陆者
		if (u == null)
			return "admin/login";
		User_info ui = user_infoService.load(u.getAccount());

		// 分页
		Page page = new Page();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "%" + name + "%");
		map.put("offSet", (offSet - 1) * 10);
		map.put("pageSize", pageSize);

		List<User_info> ulist = user_infoService.loadByName(map); // 总数据
		int total = user_infoService.loadCount(map); // 总条数

		int zys = total / 10;
		zys = total % 10 > 0 ? zys + 1 : zys; // 得总页数
		int cur = offSet; // 当前页
		int PageStart = cur - 2 > 0 ? cur - 2 : 1; // 起始页
		int PageEnd = cur + 2 > zys ? zys : (zys < 5 ? zys : cur + 2); // 结束页

		if (cur < 3 && zys >= 5)
			PageEnd = 5;
		if (cur > zys - 2 && zys >= 5)
			PageStart = PageEnd - 4;

		page.setDatas(ulist); // 设置数据
		page.setPageSize(pageSize); // 设置每页显示条数
		page.setTotalPage(zys); // 设置总页数
		page.setPageStart(PageStart); // 起始页
		page.setPageEnd(PageEnd); // 结束页

		model.addAttribute("page", page);
		model.addAttribute("ui", ui);
		model.addAttribute("cur", cur);
		model.addAttribute("name", name);

		return "admin/user_InfoManager";
	}

	// 任务管理
	@RequestMapping(value = "/jobManager", method = RequestMethod.GET)
	public String jobManager(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginAdmin"); // 登陆者
		if (u == null)
			return "admin/login";
		User_info ui = user_infoService.load(u.getAccount());

		// 分页
		Page page = new Page();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "%%");
		map.put("offSet", 0);
		map.put("pageSize", 10);

		List<Publish_job> ulist = publish_jobService.loadByName(map); // 总数据
		int total = publish_jobService.loadCount(map); // 总条数

		int zys = total / 10;
		zys = total % 10 > 0 ? zys + 1 : zys; // 得总页数
		int cur = 1; // 当前页
		int PageStart = cur - 2 > 0 ? cur - 2 : 1; // 起始页
		int PageEnd = cur + 2 > zys ? zys : (zys < 5 ? zys : cur + 2); // 结束页

		if (cur < 3 && zys >= 5)
			PageEnd = 5;
		if (cur > zys - 2 && zys >= 5)
			PageStart = PageEnd - 4;

		page.setPageOffset(0); // 设置起始页
		page.setDatas(ulist); // 设置数据
		page.setPageIndex(0); // 设置当前页
		page.setPageSize(10); // 设置每页显示条数
		page.setTotalPage(zys); // 设置总页数
		page.setPageStart(PageStart); // 起始页
		page.setPageEnd(PageEnd); // 结束页

		model.addAttribute("page", page);
		model.addAttribute("ui", ui);
		model.addAttribute("cur", cur);

		model.addAttribute("ui", ui);
		return "admin/jobManager";
	}

	// 任务管理
	@RequestMapping(value = "/jobManager", method = RequestMethod.POST)
	public String jobManager(HttpServletRequest request, Model model, @RequestParam("name") String name,
			@RequestParam("offSet") int offSet, @RequestParam("pageSize") int pageSize) {
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginAdmin"); // 登陆者
		if (u == null)
			return "admin/login";
		User_info ui = user_infoService.load(u.getAccount());

		// 分页
		Page page = new Page();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "%" + name + "%");
		map.put("offSet", (offSet - 1) * 10);
		map.put("pageSize", pageSize);

		List<Publish_job> ulist = publish_jobService.loadByName(map); // 总数据
		int total = publish_jobService.loadCount(map); // 总条数

		int zys = total / 10;
		zys = total % 10 > 0 ? zys + 1 : zys; // 得总页数
		int cur = offSet; // 当前页
		int PageStart = cur - 2 > 0 ? cur - 2 : 1; // 起始页
		int PageEnd = cur + 2 > zys ? zys : (zys < 5 ? zys : cur + 2); // 结束页

		if (cur < 3 && zys >= 5)
			PageEnd = 5;
		if (cur > zys - 2 && zys >= 5)
			PageStart = PageEnd - 4;

		page.setDatas(ulist); // 设置数据
		page.setPageSize(pageSize); // 设置每页显示条数
		page.setTotalPage(zys); // 设置总页数
		page.setPageStart(PageStart); // 起始页
		page.setPageEnd(PageEnd); // 结束页

		model.addAttribute("page", page);
		model.addAttribute("ui", ui);
		model.addAttribute("cur", cur);
		model.addAttribute("name", name);
		return "admin/jobManager";
	}

	// 任务内容查看
	@RequestMapping(value = "/jobPass", method = RequestMethod.POST)
	@ResponseBody
	public String jobPass(HttpServletRequest request, @RequestParam("pid") String pid, @RequestParam("pass") int pass) {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginAdmin"); // 登陆者

		Publish_job pj = publish_jobService.loadByPid(pid);

		if (pass == 0) {
			pj.setIsComplish(250);
			pj.setIsDelete(1);
			publish_jobService.update(pj);

			// 官方提示
			Publish_msg pm = new Publish_msg();
			pm.setpAccount(u.getAccount());
			pm.setpContent("你发布的任务:#" + pj.getpTitle() + "#,内容：" + pj.getpContent() + ",审核不通过，已被删除！");
			pm.setSendToWho(pj.getpAccount());

			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
			Date now = new Date();
			String sendTime = sdf2.format(now); // 获取时间

			pm.setpTime(sendTime);

			publish_msgService.add(pm);
		}
		if (pass == 1) {
			pj.setIsComplish(0);
			publish_jobService.update(pj);
		}
		return "";
	}

	// 任务内容查看
	@RequestMapping(value = "/lookText", method = RequestMethod.POST)
	@ResponseBody
	public Map lookText(@RequestParam("pid") String pid) {

		Publish_job pj = publish_jobService.loadByPid(pid);
		JobPublishImage ji = jobPublishImageService.load(pid);

		List img = new ArrayList<String>();
		String[] strs = {};
		if (ji != null) {
			strs = ji.getpImage().split("#");
			int count = 0;
			if (strs != null && !strs.equals("")) {
				for (String s : strs) {
					if (s.equals("") || s == null)
						continue;
					img.add(s);
					count++;
				}
			}
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pj", pj);
		map.put("count", ji);
		map.put("img", img);

		return map;
	}

	// 任务发布表
	@RequestMapping(value = "/jobPublishManager", method = RequestMethod.GET)
	public String jobPublishManager(HttpServletRequest request, Model model) throws ParseException {
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginAdmin"); // 登陆者
		if (u == null)
			return "admin/login";
		User_info ui = user_infoService.load(u.getAccount());

		// 分页
		Page page = new Page();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "%%");
		map.put("offSet", 0);
		map.put("pageSize", 10);

		List<Publish_job> ulist = publish_jobService.loadByNameTwo(map); // 总数据
		int total = publish_jobService.loadCountTwo(map); // 总条数

		List<Object> pjsList = new ArrayList<Object>(); // 用于存放任务
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		for (Publish_job pjob : ulist) {
			UserAndJob userAndJob = new UserAndJob();
			Date now = new Date();
			String time = sdf2.format(now);
			String lt = pjob.getTimeLimit();
			String s3 = lt.replaceAll("T", " ");
			Date dt1 = sdf2.parse(time);
			Date dt2 = sdf2.parse(s3);

			if (dt1.getTime() - dt2.getTime() > 0) { // 时间比较
				userAndJob.setOutTime("已过期");
			}
			// 任务被接，已完成
			else if (pjob.getIsComplish() == 1) {
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
			// 任务被接，待验证
			else if (pjob.getIsComplish() == 4) {
				userAndJob.setOutTime("待验证");
			}
			userAndJob.setPublish_job(pjob);
			pjsList.add(userAndJob);
		}

		int zys = total / 10;
		zys = total % 10 > 0 ? zys + 1 : zys; // 得总页数
		int cur = 1; // 当前页
		int PageStart = cur - 2 > 0 ? cur - 2 : 1; // 起始页
		int PageEnd = cur + 2 > zys ? zys : (zys < 5 ? zys : cur + 2); // 结束页

		if (cur < 3 && zys >= 5)
			PageEnd = 5;
		if (cur > zys - 2 && zys >= 5)
			PageStart = PageEnd - 4;

		page.setPageOffset(0); // 设置起始页
		page.setDatas(pjsList); // 设置数据
		page.setPageIndex(0); // 设置当前页
		page.setPageSize(10); // 设置每页显示条数
		page.setTotalPage(zys); // 设置总页数
		page.setPageStart(PageStart); // 起始页
		page.setPageEnd(PageEnd); // 结束页

		model.addAttribute("page", page);
		model.addAttribute("ui", ui);
		model.addAttribute("cur", cur);

		model.addAttribute("ui", ui);
		return "admin/jobPublishManager";
	}

	// 任务推荐
	@RequestMapping(value = "/jobTuiJianManager", method = RequestMethod.GET)
	public String jobTuiJianManager(HttpServletRequest request, Model model) throws ParseException {
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginAdmin"); // 登陆者
		if (u == null)
			return "admin/login";
		User_info ui = user_infoService.load(u.getAccount());

		// 分页
		Page page = new Page();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "%%");
		map.put("offSet", 0);
		map.put("pageSize", 10);

		List<Publish_job> ulist = publish_jobService.loadByNameTwo(map); // 总数据
		int total = 0; // 总条数

		List<Object> pjsList = new ArrayList<Object>(); // 用于存放任务
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		for (Publish_job pjob : ulist) {
			UserAndJob userAndJob = new UserAndJob();
			Date now = new Date();
			String time = sdf2.format(now);
			String lt = pjob.getTimeLimit();
			String s3 = lt.replaceAll("T", " ");
			Date dt1 = sdf2.parse(time);
			Date dt2 = sdf2.parse(s3);

			if (dt1.getTime() - dt2.getTime() < 0 && pjob.getIsComplish() == 0) { // 时间比较
				userAndJob.setOutTime("未被接");
				userAndJob.setPublish_job(pjob);
				pjsList.add(userAndJob);
				total++;
			}
		}

		int zys = total / 10;
		zys = total % 10 > 0 ? zys + 1 : zys; // 得总页数
		int cur = 1; // 当前页
		int PageStart = cur - 2 > 0 ? cur - 2 : 1; // 起始页
		int PageEnd = cur + 2 > zys ? zys : (zys < 5 ? zys : cur + 2); // 结束页

		if (cur < 3 && zys >= 5)
			PageEnd = 5;
		if (cur > zys - 2 && zys >= 5)
			PageStart = PageEnd - 4;

		page.setPageOffset(0); // 设置起始页
		page.setDatas(pjsList); // 设置数据
		page.setPageIndex(0); // 设置当前页
		page.setPageSize(10); // 设置每页显示条数
		page.setTotalPage(zys); // 设置总页数
		page.setPageStart(PageStart); // 起始页
		page.setPageEnd(PageEnd); // 结束页

		model.addAttribute("page", page);
		model.addAttribute("ui", ui);
		model.addAttribute("cur", cur);

		model.addAttribute("ui", ui);
		return "admin/jobTuiJianManager";
	}

	// 任务推荐
	@RequestMapping(value = "/jobTuiJianManager", method = RequestMethod.POST)
	public String jobTuiJianManager(HttpServletRequest request, Model model, @RequestParam("name") String name,
			@RequestParam("offSet") int offSet, @RequestParam("pageSize") int pageSize) throws ParseException {
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginAdmin"); // 登陆者
		if (u == null)
			return "admin/login";
		User_info ui = user_infoService.load(u.getAccount());

		// 分页
		Page page = new Page();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "%" + name + "%");
		map.put("offSet", (offSet - 1) * 10);
		map.put("pageSize", pageSize);

		List<Publish_job> ulist = publish_jobService.loadByNameTwo(map); // 总数据
		int total = 0; // 总条数

		List<Object> pjsList = new ArrayList<Object>(); // 用于存放任务
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		for (Publish_job pjob : ulist) {
			UserAndJob userAndJob = new UserAndJob();
			Date now = new Date();
			String time = sdf2.format(now);
			String lt = pjob.getTimeLimit();
			String s3 = lt.replaceAll("T", " ");
			Date dt1 = sdf2.parse(time);
			Date dt2 = sdf2.parse(s3);

			if (dt1.getTime() - dt2.getTime() < 0 && pjob.getIsComplish() == 0) { // 时间比较
				userAndJob.setOutTime("未被接");
				userAndJob.setPublish_job(pjob);
				pjsList.add(userAndJob);
				total++;
			}
		}

		int zys = total / 10;
		zys = total % 10 > 0 ? zys + 1 : zys; // 得总页数
		int cur = 1; // 当前页
		int PageStart = cur - 2 > 0 ? cur - 2 : 1; // 起始页
		int PageEnd = cur + 2 > zys ? zys : (zys < 5 ? zys : cur + 2); // 结束页

		if (cur < 3 && zys >= 5)
			PageEnd = 5;
		if (cur > zys - 2 && zys >= 5)
			PageStart = PageEnd - 4;

		page.setPageOffset(0); // 设置起始页
		page.setDatas(pjsList); // 设置数据
		page.setPageIndex(0); // 设置当前页
		page.setPageSize(10); // 设置每页显示条数
		page.setTotalPage(zys); // 设置总页数
		page.setPageStart(PageStart); // 起始页
		page.setPageEnd(PageEnd); // 结束页

		model.addAttribute("page", page);
		model.addAttribute("ui", ui);
		model.addAttribute("cur", cur);
		model.addAttribute("name", name);
		model.addAttribute("ui", ui);
		return "admin/jobTuiJianManager";
	}

	//任务推荐加入数据库
	@RequestMapping(value = "/setTuiJian", method = RequestMethod.POST)
	@ResponseBody
	public String setTuiJian(@RequestParam("jobId") String jobId){
		
		Publish_job pj= publish_jobService.loadByPid(jobId);	//找出发布者
		Student_status ss= student_statusService.load(pj.getpAccount());	//找出学籍
		
		JobTuiJian jtj=new JobTuiJian();
		
		jtj.setIsShow(1);
		jtj.setJobId(jobId);
		jtj.setToWho(ss.getSchoolName());
		jobTuiJianService.add(jtj);
		
		return "ok";
	}

	// 任务发布表
	@RequestMapping(value = "/jobPublishManager", method = RequestMethod.POST)
	public String jobPublishManager(HttpServletRequest request, Model model, @RequestParam("name") String name,
			@RequestParam("offSet") int offSet, @RequestParam("pageSize") int pageSize) throws ParseException {
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginAdmin"); // 登陆者
		if (u == null)
			return "admin/login";
		User_info ui = user_infoService.load(u.getAccount());

		// 分页
		Page page = new Page();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "%" + name + "%");
		map.put("offSet", (offSet - 1) * 10);
		map.put("pageSize", pageSize);

		List<Publish_job> ulist = publish_jobService.loadByNameTwo(map); // 总数据
		int total = publish_jobService.loadCountTwo(map); // 总条数

		List<Object> pjsList = new ArrayList<Object>(); // 用于存放任务
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		for (Publish_job pjob : ulist) {
			UserAndJob userAndJob = new UserAndJob();
			Date now = new Date();
			String time = sdf2.format(now);
			String lt = pjob.getTimeLimit();
			String s3 = lt.replaceAll("T", " ");
			Date dt1 = sdf2.parse(time);
			Date dt2 = sdf2.parse(s3);

			if (dt1.getTime() - dt2.getTime() > 0) { // 时间比较
				userAndJob.setOutTime("已过期");
			}
			// 任务被接，已完成
			else if (pjob.getIsComplish() == 1) {
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
			// 任务被接，待验证
			else if (pjob.getIsComplish() == 4) {
				userAndJob.setOutTime("待验证");
			}
			userAndJob.setPublish_job(pjob);
			pjsList.add(userAndJob);
		}

		int zys = total / 10;
		zys = total % 10 > 0 ? zys + 1 : zys; // 得总页数
		int cur = offSet; // 当前页
		int PageStart = cur - 2 > 0 ? cur - 2 : 1; // 起始页
		int PageEnd = cur + 2 > zys ? zys : (zys < 5 ? zys : cur + 2); // 结束页

		if (cur < 3 && zys >= 5)
			PageEnd = 5;
		if (cur > zys - 2 && zys >= 5)
			PageStart = PageEnd - 4;

		page.setDatas(pjsList); // 设置数据
		page.setPageSize(pageSize); // 设置每页显示条数
		page.setTotalPage(zys); // 设置总页数
		page.setPageStart(PageStart); // 起始页
		page.setPageEnd(PageEnd); // 结束页

		model.addAttribute("page", page);
		model.addAttribute("ui", ui);
		model.addAttribute("cur", cur);
		model.addAttribute("name", name);
		return "admin/jobPublishManager";
	}

	// 任务接收表
	@RequestMapping(value = "/jobReceiveManager", method = RequestMethod.GET)
	public String jobReceiveManager(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginAdmin"); // 登陆者
		if (u == null)
			return "admin/login";
		User_info ui = user_infoService.load(u.getAccount());

		// 分页
		Page page = new Page();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "%%");
		map.put("offSet", 0);
		map.put("pageSize", 10);

		List<Receive_job> ulist = receive_jobService.loadByName(map); // 总数据
		int total = receive_jobService.loadCount(map); // 总条数
		List<Object> pjsList = new ArrayList<Object>(); // 用于存放任务

		for (Receive_job rjob : ulist) {
			Publish_job pjob = publish_jobService.loadByPid(rjob.getpId());

			UserAndJob uj = new UserAndJob();
			uj.setPublish_job(pjob);
			uj.setReceive_job(rjob);
			pjsList.add(uj);
		}

		int zys = total / 10;
		zys = total % 10 > 0 ? zys + 1 : zys; // 得总页数
		int cur = 1; // 当前页
		int PageStart = cur - 2 > 0 ? cur - 2 : 1; // 起始页
		int PageEnd = cur + 2 > zys ? zys : (zys < 5 ? zys : cur + 2); // 结束页

		if (cur < 3 && zys >= 5)
			PageEnd = 5;
		if (cur > zys - 2 && zys >= 5)
			PageStart = PageEnd - 4;

		page.setPageOffset(0); // 设置起始页
		page.setDatas(pjsList); // 设置数据
		page.setPageIndex(0); // 设置当前页
		page.setPageSize(10); // 设置每页显示条数
		page.setTotalPage(zys); // 设置总页数
		page.setPageStart(PageStart); // 起始页
		page.setPageEnd(PageEnd); // 结束页

		model.addAttribute("page", page);
		model.addAttribute("ui", ui);
		model.addAttribute("cur", cur);

		return "admin/jobReceiveManager";
	}

	// 任务接收表
	@RequestMapping(value = "/jobReceiveManager", method = RequestMethod.POST)
	public String jobReceiveManager(HttpServletRequest request, Model model, @RequestParam("name") String name,
			@RequestParam("offSet") int offSet, @RequestParam("pageSize") int pageSize) {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginAdmin"); // 登陆者
		if (u == null)
			return "admin/login";
		User_info ui = user_infoService.load(u.getAccount());

		// 分页
		Page page = new Page();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "%" + name + "%");
		map.put("offSet", (offSet - 1) * 10);
		map.put("pageSize", pageSize);

		List<Receive_job> ulist = receive_jobService.loadByName(map); // 总数据
		int total = receive_jobService.loadCount(map); // 总条数

		List<Object> pjsList = new ArrayList<Object>(); // 用于存放任务

		for (Receive_job rjob : ulist) {
			Publish_job pjob = publish_jobService.loadByPid(rjob.getpId());

			UserAndJob uj = new UserAndJob();
			uj.setPublish_job(pjob);
			uj.setReceive_job(rjob);
			pjsList.add(uj);
		}

		int zys = total / 10;
		zys = total % 10 > 0 ? zys + 1 : zys; // 得总页数
		int cur = offSet; // 当前页
		int PageStart = cur - 2 > 0 ? cur - 2 : 1; // 起始页
		int PageEnd = cur + 2 > zys ? zys : (zys < 5 ? zys : cur + 2); // 结束页

		if (cur < 3 && zys >= 5)
			PageEnd = 5;
		if (cur > zys - 2 && zys >= 5)
			PageStart = PageEnd - 4;

		page.setDatas(pjsList); // 设置数据
		page.setPageSize(pageSize); // 设置每页显示条数
		page.setTotalPage(zys); // 设置总页数
		page.setPageStart(PageStart); // 起始页
		page.setPageEnd(PageEnd); // 结束页

		model.addAttribute("page", page);
		model.addAttribute("ui", ui);
		model.addAttribute("cur", cur);
		model.addAttribute("name", name);

		return "admin/jobReceiveManager";
	}

	// 据手机号查看用户
	@RequestMapping(value = "/lookUserInfo", method = RequestMethod.POST)
	@ResponseBody
	public User_info lookUserInfo(@RequestParam("account") String account) {

		User_info ui = user_infoService.load(account);
		return ui;
	}

	// 订单管理
	@RequestMapping(value = "/oderManager", method = RequestMethod.GET)
	public String oderManager(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginAdmin"); // 登陆者
		if (u == null)
			return "admin/login";
		User_info ui = user_infoService.load(u.getAccount());

		// 分页
		Page page = new Page();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "%%");
		map.put("offSet", 0);
		map.put("pageSize", 10);

		List<Oder> ulist = oderService.loadByName(map); // 总数据
		List<Object> olist = new ArrayList<Object>(); // 总数据
		int total = oderService.loadCount(map); // 总条数

		for (Oder o : ulist) {
			Receive_job rj = receive_jobService.loadByPid(o.getPid());
			UserAndJob uj = new UserAndJob();
			uj.setOder(o);
			uj.setReceive_job(rj);
			olist.add(uj);
		}

		int zys = total / 10;
		zys = total % 10 > 0 ? zys + 1 : zys; // 得总页数
		int cur = 1; // 当前页
		int PageStart = cur - 2 > 0 ? cur - 2 : 1; // 起始页
		int PageEnd = cur + 2 > zys ? zys : (zys < 5 ? zys : cur + 2); // 结束页

		if (cur < 3 && zys >= 5)
			PageEnd = 5;
		if (cur > zys - 2 && zys >= 5)
			PageStart = PageEnd - 4;

		page.setPageOffset(0); // 设置起始页
		page.setDatas(olist); // 设置数据
		page.setPageIndex(0); // 设置当前页
		page.setPageSize(10); // 设置每页显示条数
		page.setTotalPage(zys); // 设置总页数
		page.setPageStart(PageStart); // 起始页
		page.setPageEnd(PageEnd); // 结束页

		model.addAttribute("page", page);
		model.addAttribute("ui", ui);
		model.addAttribute("cur", cur);

		return "admin/oderManager";
	}

	// 任务接收表
	@RequestMapping(value = "/oderManager", method = RequestMethod.POST)
	public String oderManager(HttpServletRequest request, Model model, @RequestParam("name") String name,
			@RequestParam("offSet") int offSet, @RequestParam("pageSize") int pageSize) {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginAdmin"); // 登陆者
		if (u == null)
			return "admin/login";
		User_info ui = user_infoService.load(u.getAccount());

		// 分页
		Page page = new Page();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "%" + name + "%");
		map.put("offSet", (offSet - 1) * 10);
		map.put("pageSize", pageSize);

		List<Oder> ulist = oderService.loadByName(map); // 总数据
		List<Object> olist = new ArrayList<Object>(); // 总数据
		int total = oderService.loadCount(map); // 总条数

		for (Oder o : ulist) {
			Receive_job rj = receive_jobService.loadByPid(o.getPid());
			UserAndJob uj = new UserAndJob();
			uj.setOder(o);
			uj.setReceive_job(rj);
			olist.add(uj);
		}

		int zys = total / 10;
		zys = total % 10 > 0 ? zys + 1 : zys; // 得总页数
		int cur = offSet; // 当前页
		int PageStart = cur - 2 > 0 ? cur - 2 : 1; // 起始页
		int PageEnd = cur + 2 > zys ? zys : (zys < 5 ? zys : cur + 2); // 结束页

		if (cur < 3 && zys >= 5)
			PageEnd = 5;
		if (cur > zys - 2 && zys >= 5)
			PageStart = PageEnd - 4;

		page.setDatas(olist); // 设置数据
		page.setPageSize(pageSize); // 设置每页显示条数
		page.setTotalPage(zys); // 设置总页数
		page.setPageStart(PageStart); // 起始页
		page.setPageEnd(PageEnd); // 结束页

		model.addAttribute("page", page);
		model.addAttribute("ui", ui);
		model.addAttribute("cur", cur);
		model.addAttribute("name", name);

		return "admin/oderManager";
	}

	// 消息管理msg.jsp
	@RequestMapping(value = "/msg", method = RequestMethod.GET)
	public String msg(HttpServletRequest request, Model model) {

		// 重新登陆
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginAdmin"); // 登陆者
		if (u == null)
			return "admin/login";
		User_info ui = user_infoService.load(u.getAccount());

		List<Object> wholist = new ArrayList<Object>();
		List<Publish_msg> pandp = publish_msgService.loadBya1(u.getAccount()); // 查找消息
		Set<String> set = new HashSet<String>();
		int count = 0;
		for (Publish_msg pm : pandp) {

			set.add(pm.getpAccount() + pm.getSendToWho());
			set.add(pm.getSendToWho() + pm.getpAccount());
			User_info ui2 = null;
			Publish_msg pmsg = null;
			ui2 = user_infoService.load(pm.getpAccount()); // 查找用户资料
			pmsg = publish_msgService.loadByPAndW(pm); // 查找消息
			String text = "";
			// 过滤标记，文本
			if (FilterHtmlUtil.Html2Text(pmsg.getpContent()).length() > 35) {
				text = FilterHtmlUtil.Html2Text(pmsg.getpContent()).substring(0, 35) + "...";
			} else
				text = pmsg.getpContent();
			ChatTime ct = new ChatTime();
			ct.setPm(pm);
			ct.setUi(ui2);
			ct.setTime(text);
			ct.setTtime(pmsg.getpTime().toString());
			wholist.add(ct);
			count++;
		}

		model.addAttribute("wholist", wholist);
		model.addAttribute("ui", ui);
		model.addAttribute("count", count);
		return "admin/msg";
	}

	// 查看消息
	@RequestMapping(value = "/lookMsg", method = RequestMethod.POST)
	@ResponseBody
	public Publish_msg lookMsg(@RequestParam("msgid") int msgid) {

		Publish_msg pm = (Publish_msg) publish_msgService.loadById(msgid);
		return pm;
	}

	// 发送消息or邮件
	@RequestMapping(value = "/sendMsg", method = RequestMethod.POST)
	@ResponseBody
	public String sendMsg(@RequestParam("who") String who, @RequestParam("txt") String txt,
			@RequestParam("mark") String mark) {

		if (mark.equals("发送通知")) {

			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
			Date now = new Date();
			String sendTime = sdf2.format(now); // 获取时间
			List<User> u = userService.load(who);

			// 账号不存在
			if (u.isEmpty()) {
				return "err";
			} else {
				for (User user : u) {
					if (!user.getAccount().equals(who)) {
						return "err";
					}
				}
			}
			Publish_msg pm = new Publish_msg();
			pm.setpAccount("a100000"); // 发送者
			pm.setpContent("#通知#" + txt); // 发送内容
			pm.setpTime(sendTime); // 发送时间
			pm.setSendToWho(who); // 发送给谁

			publish_msgService.add(pm); // 添加到数据库
		}

		else if (mark.equals("发送邮件")) {

			List<User> u = userService.load(who);

			// 账号不存在
			if (u.isEmpty()) {
				return "err";
			}
			String qqemail = who; // 获取用户邮箱
			String subject = "校园赏金客服"; // 邮箱主题
			String content = txt; // 设置邮箱内容

			try {
				EmailHelper.sendEmail(qqemail, subject, content);
			} catch (Exception e) {
				e.printStackTrace();
				return "home/forget_pass";
			}
		}
		return "";
	}

	// 信誉积分管理
	@RequestMapping(value = "/Chat", method = RequestMethod.GET)
	public String Cast(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginAdmin"); // 登陆者
		if (u == null)
			return "admin/login";
		User_info ui = user_infoService.load(u.getAccount());

		// 分页
		Page<User> page = new Page<User>();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offSet", 0);
		map.put("pageSize", 5);

		List<User> ulist = userService.loadCreditIntegral(map); // 总数据
		int total = userService.loadCount2(map); // 总条数

		int zys = total / 5;
		zys = total % 5 > 0 ? zys + 1 : zys; // 得总页数
		int cur = 1; // 当前页
		int PageStart = cur - 2 > 0 ? cur - 2 : 1; // 起始页
		int PageEnd = cur + 2 > zys ? zys : (zys < 5 ? zys : cur + 2); // 结束页

		if (cur < 3 && zys >= 5)
			PageEnd = 5;
		if (cur > zys - 2 && zys >= 5)
			PageStart = PageEnd - 4;

		page.setPageOffset(0); // 设置起始页
		page.setDatas(ulist); // 设置数据
		page.setPageIndex(0); // 设置当前页
		page.setPageSize(10); // 设置每页显示条数
		page.setTotalPage(zys); // 设置总页数
		page.setPageStart(PageStart); // 起始页
		page.setPageEnd(PageEnd); // 结束页

		model.addAttribute("page", page);
		model.addAttribute("ui", ui);
		model.addAttribute("cur", cur);

		return "admin/Chat";
	}

	// 信誉积分管理
	@RequestMapping(value = "/Chat", method = RequestMethod.POST)
	public String Cast(HttpServletRequest request, Model model, @RequestParam("offSet") int offSet,
			@RequestParam("pageSize") int pageSize) {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginAdmin"); // 登陆者
		if (u == null)
			return "admin/login";
		User_info ui = user_infoService.load(u.getAccount());

		// 分页
		Page<User> page = new Page<User>();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offSet", (offSet - 1) * 5);
		map.put("pageSize", pageSize);

		List<User> ulist = userService.loadCreditIntegral(map); // 总数据
		int total = userService.loadCount2(map); // 总条数

		int zys = total / 5;
		zys = total % 5 > 0 ? zys + 1 : zys; // 得总页数
		int cur = offSet; // 当前页
		int PageStart = cur - 2 > 0 ? cur - 2 : 1; // 起始页
		int PageEnd = cur + 2 > zys ? zys : (zys < 5 ? zys : cur + 2); // 结束页

		if (cur < 3 && zys >= 5)
			PageEnd = 5;
		if (cur > zys - 2 && zys >= 5)
			PageStart = PageEnd - 4;

		page.setDatas(ulist); // 设置数据
		page.setPageSize(pageSize); // 设置每页显示条数
		page.setTotalPage(zys); // 设置总页数
		page.setPageStart(PageStart); // 起始页
		page.setPageEnd(PageEnd); // 结束页

		model.addAttribute("page", page);
		model.addAttribute("ui", ui);
		model.addAttribute("cur", cur);

		return "admin/Chat";
	}

	// 扣积分
	@RequestMapping(value = "/koujifen", method = RequestMethod.POST)
	@ResponseBody
	public String koujifen(Model model, @RequestParam("name") String name, @RequestParam("jifen") int jifen,
			@RequestParam("nn") int nn) {

		List<User> u = userService.load(name);

		if (u.isEmpty()) {
			return "err";
		}
		for (User user : u) {
			if (nn == 0)
				user.setCreditIntegral(user.getCreditIntegral() - jifen); // 原来基础上扣积分
			else if (nn == 1)
				user.setCreditIntegral(user.getCreditIntegral() + jifen > 100 ? 100 : user.getCreditIntegral() + jifen); // 原来基础上加积分
			else {
				user.setLoginLimit(TimeUtil.plusDay2(jifen));

				String qqemail = user.getEmail(); // 获取用户邮箱
				String subject = "校园赏金客服"; // 邮箱主题
				String content = "你的账号被禁" + jifen + "天，详细情况请联系客服。"; // 设置邮箱内容

				try {
					EmailHelper.sendEmail(qqemail, subject, content);
				} catch (Exception e) {
					e.printStackTrace();
					return "home/forget_pass";
				}
			}

			userService.update(user);
		}

		return "";
	}

	// 其他，实名认证审核
	@RequestMapping(value = "/other", method = RequestMethod.GET)
	public String other(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loginAdmin"); // 登陆者
		if (u == null)
			return "admin/login";
		User_info ui = user_infoService.load(u.getAccount());

		List<IDCardInfo> idlist = iDCardInfoService.load(); // 查找所有实名未审核的
		List<Object> list = new ArrayList<Object>();
		if (!idlist.isEmpty()) {
			for (IDCardInfo idcard : idlist) {
				User_info pui = user_infoService.load(idcard.getUaccount()); // 个人信息
				ChatTime ct = new ChatTime();
				ct.setIdcard(idcard);
				ct.setUi(pui);
				list.add(ct);
			}

		}

		model.addAttribute("list", list);
		model.addAttribute("ui", ui);

		return "admin/other";
	}

	// 实名认证通过或不通过
	@RequestMapping(value = "/checkIDCard", method = RequestMethod.POST)
	@ResponseBody
	public String checkIDCard(@RequestParam("no") int no, @RequestParam("ac") String ac) {

		// 不通过
		if (no == 0) {
			IDCardInfo idlist = iDCardInfoService.load(ac); // 查找
			idlist.setIsreal(2);

			User_info ui = user_infoService.load(ac);
			ui.setRealname("");

			iDCardInfoService.update(idlist);
			user_infoService.update(ui); // 更新资料

			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
			Date now = new Date();
			String sendTime = sdf2.format(now); // 获取时间

			Publish_msg pm = new Publish_msg();
			pm.setpAccount("a100000"); // 发送者
			pm.setpContent("#通知#你的实名认证不通过。"); // 发送内容
			pm.setpTime(sendTime); // 发送时间
			pm.setSendToWho(ac); // 发送给谁

			publish_msgService.add(pm); // 添加到数据库

		}
		// 通过
		if (no == 1) {
			IDCardInfo idlist = iDCardInfoService.load(ac); // 查找
			idlist.setIsreal(1);

			User_info ui = user_infoService.load(ac);
			ui.setRealname(idlist.getRealname());

			iDCardInfoService.update(idlist);
			user_infoService.update(ui); // 更新资料
		}

		return "";
	}

	// 退出后进入登陆页面.
	@RequestMapping(value = "/loginout")
	public String loginout(HttpSession session) {
		// 清除session
		session.invalidate();
		// 返回登陆页面
		return "redirect:/admin/login.do";
	}
}
