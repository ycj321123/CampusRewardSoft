<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<script type="text/javascript" src="${ctx}/js/jquery-3.3.1.js"></script>
<title>设置</title>
<style type="text/css">
html {
	font-size: 100px;
}

div {
	box-sizing: border-box;
}

body, .input, i, a {
	padding: 0;
	margin: 0;
	text-decoration: none;
	outline: none;
	font-size: 0.12rem;
}

body {
	background: #fff;
}

/*top固定在顶端*/
.header>.top {
	position: fixed;
	left: 0;
	top: 0;
	z-index: 10;
	height: 0.44rem;
	background: #379AFF;
	font-size: 0.14rem;
	color: white;
	width: 100%;
	text-align: center;
	padding-left: 0.17rem;
	padding-right: 0.17rem;
	text-align: center;
}

.header:after {
	content: "";
	display: block;
	clear: both;
}

.top>.address {
	float: left;
	font-size: 0.3rem;
	font-weight: lighter;
	color: #555;
}

.content {
	overflow: scroll;
	margin-top: 0.44rem;
}

.cell {
	padding-left: 0.12rem;
	padding-right: 0.17rem;
	background: white;
	margin-left: 0.1rem;
	margin-right: 0.1rem;
}

.content {
	margin-bottom: 0.5rem;
}

.selects {
	display: block;
	width: 80%;
	height: 0.44rem;
	font-size: 0.16rem;
	color: #555;
	position: relative;
	margin: auto;
	padding: 0 0 0 0;
	line-height: 0.44rem;
}

input {
	height: 0.4rem;
	line-height: 0.5rem;
	width: 100%;
	border: none;
	font-size: 0.15rem;
	outline: none;
}
</style>
</head>
<body>
	<div class="header">
		<div class="top">
			<div class="address" onclick="tome();">&lt;</div>
			<div class="selects">
				<div class="selects_head">
					<span class='selected'>修改密码 </span>
				</div>
			</div>
		</div>
	</div>

	<div class="content" style="margin-top: 0.44rem; padding-top: 0px;">
		<input type="hidden" id="hid" value="${ account}">
		<div class="cell"
			style="padding-top: 0px; border-bottom: 1px solid #ccc; margin-top: 0.1rem;">
			<input type="password" id="newpass" placeholder="请输入新密码">
		</div>

		<div class="cell"
			style="padding-top: 0px; border-bottom: 1px solid #ccc; margin-top: 0.1rem;">
			<input type="password" id="repass" placeholder="请再次输入新密码">
		</div>

		<div onclick="alertPass()" class="cell"
			style="border-radius: 0.5rem; height: 0.4rem; padding-top: 0px; background: #399aff; margin-top: 0.5rem;"
			id="cellSoft">
			<div style="width: 100%;">
				<div
					style="margin-left: 0.1rem !important; text-align: center; font-size: 0.15rem; line-height: 0.4rem;">
					确认修改</div>
			</div>
		</div>
	</div>

</body>

<script type="text/javascript">
	function alertPass() {
		if ($("#newpass").val().trim().length <= 0) {
			alert("密码不允许为空！");
		} else if ($("#newpass").val() != $("#repass").val()) {
			alert("两次密码不一致！");
		}else{
			if(confirm("修改后将重新登陆，确认修改吗？")){
				var password=$("#repass").val();
				var account=$("#hid").val();
				$.ajax({
					type : "POST",
					url : "${ctx}/user/change_pass.do",
					data :{password:password,account:account},
					dataType : "text",
					success : function(data) {
						console.log(data);
						window.location.href="loginout.do";
					},
					error : function(e) {
						alert("错误！！");
					}
				});		
			}
			else{}
		}
	}

	function tome() {
		window.location.href = "accountAndSafe.do";
	}

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


</html>
