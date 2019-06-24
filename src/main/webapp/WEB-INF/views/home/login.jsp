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
<script type="text/javascript" src="${ctx}/js/jquery-3.3.1.js"></script>


<link rel="stylesheet" type="text/css"
	href="${ctx}/css/register_login_style.css" />
<title>登陆页面</title>
<style type="text/css">
</style>
</head>
<body id="body">

	<!--导航栏 -->
	<div class="navigationBar">
		<div class="title_bar"></div>
	</div>

	<!--主视图 -->
	<div class="mainView">
		<div style="margin-left: 6%; font-size: 1.7rem; padding-top: 3%;">
			<b>请输入账号密码</b>
		</div>

		<!-- 错位信息提示框 -->
		<div id="alert_txt" class="alert_txt" style="display: none;"></div>
		<input type="hidden" value="${error_alert}" id="hidinfo" />
		<!-- 表单 -->
		<div class="form_us">
			<sf:form action="login.do" modelAttribute="user" method="post"
				class="form_u" onSubmit="return check_all0(this);">
				<input class="input" type="text" placeholder="请输入手机号/邮箱账号"
					id="account" name="account" oninput="change(this)"
					value="${login_info.getAccount()}">

				<input type="password" class="input" placeholder="请输入密码"
					id="password" name="password" oninput="change(this)"
					value="${login_info.getPassword()}">

				<input type="submit" value="登陆" class="submit_btn" id="submit"
					disabled="disabled">

			</sf:form>
		</div>

		<div class="to_lr">
			<a href="register.do" class="to_l">免费注册！</a> <a href="forget_pass.do"
				class="to_r"> 忘记密码?</a>
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

<script type="text/javascript" src="${ctx}/js/app_softkey.js"></script>
</body>
<script type="text/javascript" src="${ctx}/js/login_redister.js"></script>
<script type="text/javascript">
	var h = document.body.clientHeight;
	//改变按钮样式
	function change(a) {
		var content = a.value + a.value + "";
		if (content != "") {
			document.getElementById("submit").disabled = false;
			document.getElementById("submit").style.background = "#5CACEE";
		} else {
			document.getElementById("submit").style.background = "#C7C7C7";
			document.getElementById("submit").disabled = true;
		}
	}
	if (document.getElementById("hidinfo").value.trim().length > 0) {
		alert_txt = document.getElementById("alert_txt");
		alert_txt.innerHTML = document.getElementById("hidinfo").value;
		setTimeout("codefans()", 0);
		setTimeout("codehide()", 2000);
	}

	//返回键半秒内点两次退出
	document.addEventListener('plusready', function(a) {
            var first = null;
            plus.key.addEventListener('backbutton', function() {
                    //首次按键，提示‘再按一次退出应用’
                    if (!first) {
                        first = new Date().getTime();
                        console.log('再按一次退出应用');//用自定义toast提示最好
                        setTimeout(function() {
                            first = null;
                        }, 500);
                    } else {
                        if (new Date().getTime() - first < 500) {
                            plus.runtime.quit();
                        }
                    }
                }, false);
        });
</script>

</html>