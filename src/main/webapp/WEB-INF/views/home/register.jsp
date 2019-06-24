<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@include file="/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${ctx}/css/register_login_style.css" />
<script type="text/javascript" src="${ctx}/js/jquery-3.3.1.js"></script>
<title>注册页面</title>
<style type="text/css">
.form_u {
	margin-top: 0% !important;
}

.form_u .input input {
	margin-top: 0% !important;
	border: none;
	width: 66% !important;
	font-size: 1rem !important;
	background: rgba(0, 0, 0, 0) !important;
}

.submit_btn {
	background: #5CACEE !important;
	margin-top: 15% !important;
}

.form_u .input .txt {
	width: 26%;
	font-size: 1rem;
	color: #272727;
	float: left;
}

/*协议*/
.agreement {
	margin-left: 6%;
	margin-right: 5%;
	float: left;
	margin-top: 1.5%;
}

.agreement, .agreement a {
	font-size: 0.7rem;
}

.tabBar {
	margin-top: 15%;
}

.navigationBar .title_bar {
	color: #000;
	float: left;
	margin-left: 6%;
	width: auto;
}
</style>
</head>
<body id="body">
	<!--导航栏 -->
	<div class="navigationBar">
		<a href="login.do" class="title_bar" id="backHistory">×</a>
	</div>

	<!--主视图 -->
	<div class="mainView">
		<div style="margin-left: 6%; font-size: 1.7rem; padding-top: 3%;">
			<b>用户注册</b>
		</div>

		<!-- 错位信息提示框 -->
		<div id="alert_txt" class="alert_txt" style="display: none;"></div>
		<input type="hidden" value="${success}" id="hidinfo" />
		<!-- 表单 -->
		<div class="form_us">
			<sf:form action="register.do" method="post" modelAttribute="user"
				class="form_u" onSubmit="return check_all(this);">
				<div class="input">
					<span class="txt">昵称 </span><input type="text" placeholder="不能超过6个"
						id="username" name="username" value="" maxlength="6"/>
				</div>
				<div class="input">
					<span class="txt">手机号 </span><input type="text"
						placeholder="请填写手机号" id="account" name="account" value="" />
				</div>
				<div class="input">
					<span class="txt">邮箱</span> <input type="text" placeholder="请填写邮箱"
						id="email" name="email" value="" />
				</div>
				<div class="input">
					<span class="txt">密码 </span><input type="password"
						placeholder="填写密码" id="password" name="password" value="" />
				</div>
				<input type="submit" value="下一步" class="submit_btn" id="submit_btn">
			</sf:form>
			<span class="agreement">点击上面的"下一步"按钮,即表示你同意<a
				href="agreement.do">&lt;&lt;校园赏金软件使用条款和隐私政策&gt;&gt;</a></span>
		</div>

		<!-- 第三方登陆 -->
		<div class="tabBar" id="tab_bar">
			<div class="other_login">
				<span class="line"></span> <span class="txt">其他登陆</span> <span
					class="line"></span>
			</div>

			<div class="o_img">
				<a class="qq"><img src="${ctx}/images/qq.gif"
					style="width: 16.666%" /></a> <a class="wechat"><img
					src="${ctx}/images/WeChat.gif" style="width: 16.666%" /></a> <a
					class="xlwb"><img src="${ctx}/images/xlwb.gif"
					style="width: 16.666%" /></a>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${ctx}/js/login_redister.js"></script>
	<script type="text/javascript" src="${ctx}/js/app_softkey.js"></script>
	<script type="text/javascript">
		alert_txt = document.getElementById("alert_txt");

		//注册失败不跳转
		if (document.getElementById("hidinfo").value.trim().length == 1) {
			alert_txt.innerHTML = "手机号或邮箱已被注册!";
			setTimeout("codefans()", 0);
			setTimeout("codehide()", 2000);
		}

		//点返回键返回上一级
		document.addEventListener('plusready', function() {
			var webview = plus.webview.currentWebview();
			plus.key.addEventListener('backbutton', function() {
				webview.canBack(function(e) {
					if (e.canBack) {
						window.location.href="login.do";
					} else {
						webview.close(); //hide,quit
						//plus.runtime.quit();
					}
				})
			});
		});
	</script>

</body>
</html>