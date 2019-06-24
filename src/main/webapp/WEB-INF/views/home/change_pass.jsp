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
<title>修改密码</title>
<style type="text/css">	
.form_u {
	margin-top: 15% !important;
}

.form_u .input input {
	margin-top: 0% !important;
	border: none;
	width: 60% !important;
	font-size: 1rem !important;
	background: rgba(0, 0, 0, 0) !important;
}

.submit_btn {
	background: #5CACEE !important;
}

.form_u .input .txt {
	width: 40%;
	color: #272727;
	float: right;
	text-align: right;
}

.form_u .input .txt a {
	border-radius: 4em;
	font-size: 0.8rem;
	padding: 0.3rem;
	background: #379AFF;
	color: #fff;
}

.info_tip {
	margin-left: 6%;
	width: 88%;
	font-size: 1.1rem;
	margin-top: 5%;
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

.is_ok {
	border-radius: 4rem;
	background: #379AFF;
	font-size: 0.8rem;
	border: none;
}

.ok_btn, .is_ok:focus {
	outline: none;
}
</style>
</head>
<body id="body">
	<!--导航栏 -->
	<div class="navigationBar">
		<a href="forget_pass.do" class="title_bar">×</a>
	</div>

	<!--主视图 -->
	<div class="mainView">
		<div style="margin-left: 6%; font-size: 1.7rem; padding-top: 3%;">
			<b>修改密码</b>
		</div>

		<!-- 错位信息提示框 -->
		<div id="alert_txt" class="alert_txt" style="display: none;">错位信息提示</div>

		<div class="info_tip">
			<b>修改密码后将返回登陆界面</b>
		</div>

		<!-- 表单 -->
		<div class="form_us">
			<sf:form class="form_u" action="change_pass.do" method="post"
				onSubmit="return check_all3(this);" id="form_u">
				<div class="input">
					<span class="txt"></span><input type="password"
						placeholder="请输入新密码" id="password" name="password" />
				</div>
				<div class="input">
					<input type="password" placeholder="再次输入新密码" id="repassword"
						name="repassword" />
				</div>
				<input type="hidden" value="${account }" id="account" name="account" />
				<input type="submit" value="修改密码" class="submit_btn">
			</sf:form>
		</div>


	</div>
	<script type="text/javascript" src="${ctx}/js/login_redister.js"></script>
	<script type="text/javascript" src="${ctx}/js/app_softkey.js"></script>
	
	<script type="text/javascript">
	document.addEventListener('plusready', function() {
	    var webview = plus.webview.currentWebview();    
	    plus.key.addEventListener('backbutton', function() {
	        webview.canBack(function(e) {
	            if(e.canBack) {
	            	//返回上一历史页
	                //webview.back();	
	            	window.location.href="forget_pass.do";
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