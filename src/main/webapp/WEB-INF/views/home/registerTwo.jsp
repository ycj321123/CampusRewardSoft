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


<title>注册页面</title>
<style type="text/css">
html {
	font-size: 100px;
}

body, .mainView {
	font-size: 0.12rem;
	padding: 0;
	margin: 0;
}

html, body {
	overflow-y: auto;
}

.form_u {
	margin-top: 0.44rem;
	width: 100%;
	text-align: center;
}

.selected {
	width: 90%;
	height: 0.42rem;
	border: none;
	border-bottom: 1px solid #ccc;
	text-indent: 0.1rem;
	font-size: 0.18rem;
}

.form_u input:FOCUS {
	outline: none;
}

.submit_btn {
	margin-top: 0.8rem;
	width: 90%;
	height: 0.35rem;
	border-radius: 0.5rem;
	border: none;
	background: #339aff;
}

.navigationBar {
	width: 100%;
	margin-top: 0.1rem;
}

.navigationBar .title_bar {
	color: #000;
	float: left;
	margin-left: 0.2rem;
	width: auto;
	text-decoration: none;
	font-size: 0.28rem;
}

/*错误信息提示*/
.alert_txt {
	position: fixed;
	margin-left: 25%;
	border-radius: 20px;
	background: #f0f0f0;
	text-align: center;
	font-size: 0.15rem;
	/*内容垂直居中*/
	display: -moz-box; /*兼容Firefox*/
	display: -webkit-box; /*兼容FSafari、Chrome*/
	-moz-box-align: center; /*兼容Firefox*/
	-webkit-box-align: center; /*兼容FSafari、Chrome */
	-moz-box-pack: center; /*兼容Firefox*/
	-webkit-box-pack: center; /*兼容FSafari、Chrome */
}
</style>
</head>
<body id="body">
	<div class="navigationBar">
		<!-- a href="register.do" class="title_bar" id="backHistory"> &lt; </a-->
	</div>
	<!--主视图 -->
	<div class="mainView">
		<div
			style="margin-left: 0.2rem; font-size: 0.3rem; margin-top: 0.54rem; height: 0.44rem;">
			<b>填写学籍资料</b>
		</div>
		<!-- 错位信息提示框 -->
		<div id="alert_txt" class="alert_txt" style="display: none;">${error}</div>
		<input type="hidden" value="${error }" id="error">
		<!-- 表单 -->
		<div class="form_us">
			<sf:form action="registerTwo.do" modelAttribute="Student_status"
				method="post" class="form_u">
				<input class="selected" type="text" placeholder="请输入学校名称"
					id="schoolName" name="schoolName" value="${sname }" required>

				<input class="selected" type="text" placeholder="输入院系" id="yuanXi"
					name="yuanXi">
					
				<input class="selected" type="text" placeholder="输入专业" id="zhuanYe"
					name="zhuanYe">

				<input class="selected" type="text" placeholder="输入入学年份"
					id="ruxueYear" name="ruxueYear">

				<input type="submit" value="下一步" class="submit_btn" id="submit">

			</sf:form>
		</div>

	</div>

	<script type="text/javascript" src="${ctx}/js/app_softkey.js"></script>

	<script type="text/javascript">
		
	</script>

</body>
<script>
	autoSize();

	window.onresize = function() {

		autoSize();

	}

	function autoSize() {

		// 获取当前浏览器的视窗宽度，放在w中

		var w = document.documentElement.clientWidth;

		// 计算实际html font-size大小

		var size = w * 100 / 375;

		// 获取当前页面中的html标签

		var html = document.querySelector('html');

		// 设置字体大小样式

		html.style.fontSize = size + 'px';

	}
</script>
<script type="text/javascript">
	//设置错误提示框样式
	function codefans() {
		// 获取可见区域宽,高
		var h = document.body.offsetHeight;
		var w = document.body.offsetWidth;

		alert_txt.style.top = (h / 6 * 2.5) + "px";
		alert_txt.style.left = 0 + "px";
		alert_txt.style.padding = (h / 48) + "px";
		alert_txt.style.width = (w / 2) + "px";
		alert_txt.style.display = "";
	}

	// 隐藏错误提示框
	function codehide() {
		alert_txt.style.display = "none";
	}
	if ($("#error").val().trim().length > 0) {
		setTimeout("codefans()", 0);
		setTimeout("codehide()", 2000);
	}

</script>
</html>