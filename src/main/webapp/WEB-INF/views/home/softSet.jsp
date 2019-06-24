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
	background: rgb(240, 240, 240);
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
	padding-top: 0.17rem;
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
.footer {
	position: fixed;
	width: 100%;
	left: 0;
	bottom: 0;
	z-index: 5;
	height: 0.44rem;
	background: #fff;
	display: flex;
	flex-flow: row;
	justify-content: space-around;
	line-height: 0.44rem;
	font-size: 0.15rem;
	color: #555;
	margin-bottom: 0.2rem;
}

</style>
</head>
<body>
	<div class="header">
		<div class="top">
			<div class="address" onclick="tome();">&lt;</div>
			<div class="selects">
				<div class="selects_head">
					<span class='selected'>设置 </span>
				</div>
			</div>
		</div>
	</div>

	<div class="content" style="margin-top: 0.44rem; padding-top: 0px;">
		<div class="cell"
			style="height: 0.5rem; padding-top: 0px; margin-top: 0.1rem;border-bottom: 1px solid #ccc;"
			id="cellAccount">
			<div
				style="margin-left: 0.1rem !important; font-size: 0.15rem; float: left; line-height: 0.5rem;">
				账号与安全</div>
			<div
				style="float: right; font-size: 0.2rem; color: #ccc; line-height: 0.5rem;">
				>
			</div>
		</div>

		<div class="cell"
			style="height: 0.5rem; padding-top: 0px; border-bottom: 1px solid #ccc; margin-top: 0.1rem;"
			id="cellProblem">
			<div style="width: 100%;">
				<div
					style="margin-left: 0.1rem !important; font-size: 0.15rem; float: left; line-height: 0.5rem;">
					问题反馈</div>
			</div>
			<div
				style="float: right; font-size: 0.2rem; color: #ccc; line-height: 0.5rem;">
				>
			</div>
		</div>

		<div class="cell"
			style="height: 0.5rem; padding-top: 0px; border-bottom: 1px solid #ccc;"
			id="cellKeFu">
			<a>
				<span style="width: 100%;">
					<span
						style="margin-left: 0.1rem !important; font-size: 0.15rem; float: left; line-height: 0.5rem;">
						联系客服</span>
				</span>
				<span
					style="float: right; font-size: 0.2rem; color: #ccc; line-height: 0.5rem;">
					>
				</span>
			</a>
		</div>

		<div class="cell"
			style="height: 0.5rem; padding-top: 0px; border-bottom: 1px solid #ccc; margin-top: 0.1rem;" id="cellSoft">
			<div style="width: 100%;">
				<div
					style="margin-left: 0.1rem !important; font-size: 0.15rem; float: left; line-height: 0.5rem;">
					关于校园赏金</div>
			</div>
			<div
				style="float: right; font-size: 0.16rem; font-weight: lighter; color: #ccc; line-height: 0.5rem;">				
				版本1.0.0
				<div style="float: right; font-size: 0.2rem;">&nbsp;&nbsp;></div>
			</div>
		</div>
	</div>
	
	<div class="footer">
		退出当前账号
	</div>
	
</body>

<script type="text/javascript">
	function tome(){
		window.location.href="me.do";
	}

	//点击账号与安全
	$("#cellAccount").click(function(){
		window.location.href="accountAndSafe.do";
	});
	//点击问题反馈
	$("#cellProblem").click(function(){
		window.location.href="problen.do";
	});
	//点击联系客服
	$("#cellKeFu").click(function(){
		window.location.href="tel:15627933457";
	});
	//点击关于软件
	$("#cellSoft").click(function(){
		window.location.href="aboutSoft.do";
	});
	//点击退出登陆
	$(".footer").click(function(){
		window.location.href="loginout.do";
	});
	
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
