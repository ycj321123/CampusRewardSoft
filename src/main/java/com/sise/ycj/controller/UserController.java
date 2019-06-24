package com.sise.ycj.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sise.ycj.model.Student_status;
import com.sise.ycj.model.User;
import com.sise.ycj.model.User_info;
import com.sise.ycj.service.ISchoolService;
import com.sise.ycj.service.IStudent_statusService;
import com.sise.ycj.service.IUserService;
import com.sise.ycj.service.IUser_infoService;
import com.sise.ycj.util.EmailHelper;

@Controller("userController")
@RequestMapping("/user")
public class UserController {
	@Resource(name = "userService")
	private IUserService userService;

	@Resource(name = "schoolService")
	private ISchoolService schoolService;

	@Resource(name = "user_infoService")
	private IUser_infoService user_infoService;

	@Resource(name = "student_statusService")
	private IStudent_statusService student_statusService;

	String error_info = ""; // 存放错误信息
	String code = ""; // 存放验证码
	Map<String, Object> map = new HashMap<String, Object>();

	// 用户登陆
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {

		return "home/login";
	}

	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(User user, Model model, HttpServletRequest request, HttpServletResponse response)
			throws ParseException {
		// 查询账户
		List u = userService.load(user.getAccount());
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式

		// 登陆验证
		if (!u.isEmpty()) {
			for (int i = 0; i < u.size(); i++) {
				User t = (User) u.get(i);

				if (!t.getLoginLimit().equals("0")) {

					Date now = new Date();
					String time = sdf2.format(now);
					Date dt1 = sdf2.parse(time);
					Date dt2 = sdf2.parse(t.getLoginLimit());
					if (dt2.getTime() - dt1.getTime() > 0) {
						error_info = "你的账号已被禁止登陆！" + t.getLoginLimit() + "后才能登陆！";
						model.addAttribute("error_alert", error_info);
						model.addAttribute("login_info", user);

						return "home/login";
					}
				}
				if (t.getPassword().equals(user.getPassword()) && t.getRole() != 4) {
					error_info = "";

					// 验证成功后添加到session
					request.getSession().setAttribute("loginUser", t);
					// 如果是客户端跳转，需要添加redirect:
					return "redirect:/mainIndex/index.do";
				}

			}
		}

		// 返回错误信息
		error_info = "账号或密码错误！";
		model.addAttribute("error_alert", error_info);
		model.addAttribute("login_info", user);

		return "home/login";
	}

	// 用户注册1
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register() {

		return "home/register";
	}

	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(User user, Model model, RedirectAttributes ra) {

		List u = userService.load(user.getAccount()); // 查账号
		List u2 = userService.load(user.getEmail()); // 查邮箱

		// 检验手机号和邮箱是否存在
		if (!u.isEmpty() || !u2.isEmpty()) {
			model.addAttribute("success", "1");
			model.addAttribute(user);
			return "home/register";
		}

		ra.addFlashAttribute("user", user); // 把值传给下一页面
		return "redirect:/user/registerTwo.do";
	}

	// 用户注册2
	@RequestMapping(value = "/registerTwo", method = RequestMethod.GET)
	public String register2(@ModelAttribute("user") User user, Model model) {
		// 存放传过来的user值
		if (user != null && !user.equals(""))
			map.put("user", user);
		return "home/registerTwo";
	}

	@RequestMapping(value = "/registerTwo", method = RequestMethod.POST)
	public String register2(Student_status student_status, Model model) {

		// 查找学校
		List sname = schoolService.load(student_status.getSchoolName());
		// 是否有该学校
		if (sname.isEmpty()) {
			model.addAttribute("error", "没有该学校！");
			model.addAttribute("sname", student_status.getSchoolName());
			return "home/registerTwo";
		}
		map.put("student_status", student_status);
		return "redirect:/user/registerThree.do";
	}

	// 用户注册3
	@RequestMapping(value = "/registerThree", method = RequestMethod.GET)
	public String register3() {
		User u = (User) map.get("user"); // 获取保存的用户信息
		Student_status s = (Student_status) map.get("student_status"); // 获取学籍信息
		return "home/registerThree";
	}

	@RequestMapping(value = "/registerThree", method = RequestMethod.POST)
	public String register3(User_info user_info, @RequestParam("file") MultipartFile fs, HttpServletRequest req)
			throws IOException {
		User u = (User) map.get("user"); // 获取保存的用户信息
		Student_status s = (Student_status) map.get("student_status"); // 获取学籍信息

		// 添加用户
		userService.add(u);
		System.out.println("44444" + u.getAccount() + "asdfe阿斯顿发生" + s.getSchoolName());

		// 添加学籍
		List list = userService.load(u.getAccount());
		if (!list.isEmpty()) {
			for (int i = 0; i < list.size(); i++) {
				User t = (User) list.get(i);
				// 设置用户
				s.setUaccount(t.getAccount());

				user_info.setUaccount(t.getAccount());
				user_info.setNickname(t.getUsername());
				System.out.println("用户name：" + t.getUsername());
			}
		}
		student_statusService.add(s);

		// 以日期命名图片
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
		String newfilename = sdf.format(new Date()) + ".jpg";

		// 文件上传
		if (!fs.isEmpty()) {
			File file = new File(
					"E:\\eclipse_files\\project_files\\CampusRewardSoft\\src\\main\\webapp\\images\\user_headImage\\"
							+ newfilename);
			System.out.println(file.getName());
			FileUtils.copyInputStreamToFile(fs.getInputStream(), file);
		} else {
			newfilename = "20190131152230643.jpg";
		}
		user_info.setHeadsrc(newfilename);
		System.out.println(user_info.getHeadsrc());
		// 添加用户资料
		user_infoService.add(user_info);

		return "redirect:/mainIndex/index.do";
	}

	// 用户找回密码
	@RequestMapping(value = "/forget_pass", method = RequestMethod.GET)
	public String forgetPass() {
		return "home/forget_pass";
	}

	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/forget_pass", method = RequestMethod.POST)
	public String forgetPass(Model model, @RequestParam("account") String account,
			@RequestParam("testcode") String testcode, @RequestParam("hid") String hid, RedirectAttributes ra) {
		String result = "账号不存在或验证码错误！"; // 返回结果信息

		model.addAttribute("account", account); // 设置账号
		model.addAttribute("testcode", testcode); // 设置验证码
		model.addAttribute("hid", hid); // 设置隐藏的值

		// 查询用户
		List u = userService.load(account);

		// 账号存在则发送邮件
		if (!u.isEmpty() && hid.equals("123")) {
			for (int i = 0; i < u.size(); i++) {
				User user = (User) u.get(i); // 获取用户
				String qqemail = user.getEmail(); // 获取用户邮箱
				String subject = "校园赏金"; // 邮箱主题
				String content = "验证码："; // 设置邮箱内容
				code = EmailHelper.getCode(); // 获取验证码
				content += code + " ，1分钟内有效，验证码泄露可能会被盗号，打死不告诉别人！";
				try {
					EmailHelper.sendEmail(qqemail, subject, content);
					break;
				} catch (Exception e) {
					result = "<b>发送失败！</b><br/><br/>可能邮箱不可用或不存在";
					model.addAttribute("result", result);
					e.printStackTrace();
					return "home/forget_pass";
				}
			}
			return "home/forget_pass";
		}

		// 验证码正确则跳转
		if (testcode.equals(code) && hid.equals("")) {
			code = "";
			model.addAttribute("result", "验证通过");
			ra.addFlashAttribute("account", account);
			return "redirect:/user/change_pass.do";
		}
		// 验证失败
		model.addAttribute("result", result);
		return "home/forget_pass";
	}

	// 用户修改密码
	@RequestMapping(value = "/change_pass", method = RequestMethod.GET)
	public String changePass(@ModelAttribute("account") String account) {
		System.out.println("12345679845  " + account);
		return "home/change_pass";
	}

	@RequestMapping(value = "/change_pass", method = RequestMethod.POST)
	public String changePass(@RequestParam("password") String password, @RequestParam("account") String account,
			Model model) {
		if (account.equals("")) {
			model.addAttribute("error", "账号不存在！");
			return "home/change_pass";
		}
		List<User> users = userService.load(account);

		if (!users.isEmpty()) {
			for (User u : users) {
				// 设置新密码
				u.setPassword(password);
				userService.update(u);
			}
			return "home/login";
		}
		model.addAttribute("error", "修改异常！");
		return "home/change_pass";
	}

	// 协议
	@RequestMapping(value = "/agreement", method = RequestMethod.GET)
	public String agreement() {

		return "home/agreement";
	}

}
