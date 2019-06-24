<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN" id="html0">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<script type="text/javascript" src="${ctx}/js/jquery-3.3.1.js"></script>
<title>好友</title>
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
	background: rgb(240,240,240,240);
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
	line-height: 0.44rem;
}

.header:after {
	content: "";
	display: block;
	clear: both;
}

.top>.address {
	float: left;
}

.top .input {
	padding: 0.03rem;
	width: auto;
	height: 0.44rem;
	background: transparent;
	border: none;
	margin-left: -0.25rem;
	padding-bottom: -0.5rem;
}

/*清除ie的默认选择框样式清除，隐藏下拉箭头
select::-ms-expand { display: none; }
*/
.search>i {
	position: absolute;
	left: 0.83rem;
	z-index: 10;
	color: gray;
}

.top>.xx {
	position: absolute;
	left: 3.1rem;
	top: 0.08rem;
	z-index: 5;
	color: gray;
	font-size: 0.14rem;
}

.top>.sm {
	position: absolute;
	left: 3.35rem;
	top: 0rem;
	z-index: 5;
	color: white;
	font-size: 0.28rem;
	margin-left: 0.1rem;
}

.top>i {
	font-size: 0.35rem;
	color: white;
	margin-top: 0.1rem;
}

/*内容*/
.content {
	overflow: scroll;
	margin-top: 0.44rem;
}

.cell {
	padding-left: 0.12rem;
	padding-right: 0.17rem;
	background: white;
	padding-top: 0.12rem;
	padding-bottom: 0.12rem;
	float: left;
	width: 100%;
	border-bottom: 1px solid #ccc;
}

/*页脚样式*/
.footer {
	position: fixed;
	width: 100%;
	left: 0;
	bottom: 0;
	z-index: 5;
	height: 0.55rem;
	background: #fff;
	display: flex;
	flex-flow: row;
	justify-content: space-around;
	line-height: 0.24rem;
	border-top: 0.01rem solid #ccc;
}

.footer>.option {
	width: 25%;
	text-align: center;
}

.content {
	margin-bottom: 0.5rem;
}

.footer {
	
}

.footer i {
	font-size: 0.15rem;
}

.footer>.option>div {
	font-size: 0.1rem;
}

.footer>.option>.list2 {
	color: #379AFF;
}

.selects {
	display: block;
	width: 70%;
	height: 0.44rem;
	font-size: 0.16rem;
	color: #555;
	position: relative;
	margin: auto;
	padding: 0 0 0 0;
}

.selects .selected {
	position: relative;
	height: 0.44rem;
	padding-bottom: 0.05rem;
}

.selects_other {
	position: fixed;
	left: 0;
	top: 0.44rem;
	width: 100%;
	display: none;
	z-index: 999;
	border-top: 1px solid #ccc;
	top: 0.44rem;
	overflow: scroll;
}

.selects_other>a {
	border: 1px solid #ccc;
	border-top: none;
	display: block;
	width: 100%;
	padding: 0rem 0;
	height: 0.44rem;
	font-size: 0.18rem;
	background-color: #FFF;
	color: #555;
}
</style>
</head>
<body>
	<div class="header">
		<div class="top">
			<div class="selects">
				<div class="selects_head">我的好友</div>
			</div>

		</div>

	</div>

	<div class="content">
		<c:forEach items="${A}" var="A" varStatus="s">
		<c:if test="${s.first }"><div class="cell" style="background: #CCC; font-size: 0.1rem;float: left;width: 100%;padding: 0.05rem;border-bottom: 1px solid #aaa;">A</div></c:if>
			<div class="cell"
				onclick="toChatPage('${A.getUaccount()}')"
				style="border-bottom: 1px solid #aaa;">
				<div style="width: 100%; height: 0.5rem;">
					<div
						style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
						<img
							src="${ctx}/images/user_headImage/${A.getHeadsrc()}"
							style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
					</div>
					<div class="user-info"
						style="height: 0.48rem; float: left; margin-left: 0.12rem;">
						<span
							style="font-size: 0.16rem; float: left; font-weight: bolder; line-height: 0.48rem;">${A.getNickname()}</span><br />
					</div>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach items="${B}" var="A" varStatus="s">
		<c:if test="${s.first }"><div class="cell" style="background: #CCC; font-size: 0.1rem;float: left;width: 100%;padding: 0.05rem;border-bottom: 1px solid #aaa;">B</div></c:if>
			<div class="cell"
				onclick="toChatPage('${A.getUaccount()}')"
				style="border-bottom: 1px solid #aaa;">
				<div style="width: 100%; height: 0.5rem;">
					<div
						style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
						<img
							src="${ctx}/images/user_headImage/${A.getHeadsrc()}"
							style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
					</div>
					<div class="user-info"
						style="height: 0.48rem; float: left; margin-left: 0.12rem;">
						<span
							style="font-size: 0.16rem; float: left; font-weight: bolder; line-height: 0.48rem;">${A.getNickname()}</span><br />
					</div>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach items="${C}" var="A" varStatus="s">
		<c:if test="${s.first }"><div class="cell" style="background: #CCC; font-size: 0.1rem;float: left;width: 100%;padding: 0.05rem;border-bottom: 1px solid #aaa;">C</div></c:if>
			<div class="cell"
				onclick="toChatPage('${A.getUaccount()}')"
				style="border-bottom: 1px solid #aaa;">
				<div style="width: 100%; height: 0.5rem;">
					<div
						style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
						<img
							src="${ctx}/images/user_headImage/${A.getHeadsrc()}"
							style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
					</div>
					<div class="user-info"
						style="height: 0.48rem; float: left; margin-left: 0.12rem;">
						<span
							style="font-size: 0.16rem; float: left; font-weight: bolder; line-height: 0.48rem;">${A.getNickname()}</span><br />
					</div>
				</div>
			</div>
		</c:forEach>

		<c:forEach items="${D}" var="A" varStatus="s">
		<c:if test="${s.first }"><div class="cell" style="background: #CCC; font-size: 0.1rem;float: left;width: 100%;padding: 0.05rem;border-bottom: 1px solid #aaa;">D</div></c:if>
			<div class="cell"
				onclick="toChatPage('${A.getUaccount()}')"
				style="border-bottom: 1px solid #aaa;">
				<div style="width: 100%; height: 0.5rem;">
					<div
						style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
						<img
							src="${ctx}/images/user_headImage/${A.getHeadsrc()}"
							style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
					</div>
					<div class="user-info"
						style="height: 0.48rem; float: left; margin-left: 0.12rem;">
						<span
							style="font-size: 0.16rem; float: left; font-weight: bolder; line-height: 0.48rem;">${A.getNickname()}</span><br />
					</div>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach items="${E}" var="A" varStatus="s">
		<c:if test="${s.first }"><div class="cell" style="background: #CCC; font-size: 0.1rem;float: left;width: 100%;padding: 0.05rem;border-bottom: 1px solid #aaa;">E</div></c:if>
			<div class="cell"
				onclick="toChatPage('${A.getUaccount()}')"
				style="border-bottom: 1px solid #aaa;">
				<div style="width: 100%; height: 0.5rem;">
					<div
						style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
						<img
							src="${ctx}/images/user_headImage/${A.getHeadsrc()}"
							style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
					</div>
					<div class="user-info"
						style="height: 0.48rem; float: left; margin-left: 0.12rem;">
						<span
							style="font-size: 0.16rem; float: left; font-weight: bolder;line-height: 0.48rem;">${A.getNickname()}</span><br />
					</div>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach items="${F}" var="A" varStatus="s">
		<c:if test="${s.first }"><div class="cell" style="background: #CCC; font-size: 0.1rem;float: left;width: 100%;padding: 0.05rem;border-bottom: 1px solid #aaa;">F</div></c:if>
			<div class="cell"
				onclick="toChatPage('${A.getUaccount()}')"
				style="border-bottom: 1px solid #aaa;">
				<div style="width: 100%; height: 0.5rem;">
					<div
						style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
						<img
							src="${ctx}/images/user_headImage/${A.getHeadsrc()}"
							style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
					</div>
					<div class="user-info"
						style="height: 0.48rem; float: left; margin-left: 0.12rem;">
						<span
							style="font-size: 0.16rem; float: left; font-weight: bolder;line-height: 0.48rem;">${A.getNickname()}</span><br />
					</div>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach items="${G}" var="A" varStatus="s">
		<c:if test="${s.first }"><div class="cell" style="background: #CCC; font-size: 0.1rem;float: left;width: 100%;padding: 0.05rem;border-bottom: 1px solid #aaa;">G</div></c:if>
			<div class="cell"
				onclick="toChatPage('${A.getUaccount()}')"
				style="border-bottom: 1px solid #aaa;">
				<div style="width: 100%; height: 0.5rem;">
					<div
						style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
						<img
							src="${ctx}/images/user_headImage/${A.getHeadsrc()}"
							style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
					</div>
					<div class="user-info"
						style="height: 0.48rem; float: left; margin-left: 0.12rem;">
						<span
							style="font-size: 0.16rem; float: left; font-weight: bolder;line-height: 0.48rem;">${A.getNickname()}</span><br />
					</div>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach items="${H}" var="A" varStatus="s">
		<c:if test="${s.first }"><div class="cell" style="background: #CCC; font-size: 0.1rem;float: left;width: 100%;padding: 0.05rem;border-bottom: 1px solid #aaa;">H</div></c:if>
			<div class="cell"
				onclick="toChatPage('${A.getUaccount()}')"
				style="border-bottom: 1px solid #aaa;">
				<div style="width: 100%; height: 0.5rem;">
					<div
						style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
						<img
							src="${ctx}/images/user_headImage/${A.getHeadsrc()}"
							style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
					</div>
					<div class="user-info"
						style="height: 0.48rem; float: left; margin-left: 0.12rem;">
						<span
							style="font-size: 0.16rem; float: left; font-weight: bolder;line-height: 0.48rem;">${A.getNickname()}</span><br />
					</div>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach items="${I}" var="A" varStatus="s">
		<c:if test="${s.first }"><div class="cell" style="background: #CCC; font-size: 0.1rem;float: left;width: 100%;padding: 0.05rem;border-bottom: 1px solid #aaa;">I</div></c:if>
			<div class="cell"
				onclick="toChatPage('${A.getUaccount()}')"
				style="border-bottom: 1px solid #aaa;">
				<div style="width: 100%; height: 0.5rem;">
					<div
						style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
						<img
							src="${ctx}/images/user_headImage/${A.getHeadsrc()}"
							style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
					</div>
					<div class="user-info"
						style="height: 0.48rem; float: left; margin-left: 0.12rem;">
						<span
							style="font-size: 0.16rem; float: left; font-weight: bolder;line-height: 0.48rem;">${A.getNickname()}</span><br />
					</div>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach items="${J}" var="A" varStatus="s">
		<c:if test="${s.first }"><div class="cell" style="background: #CCC; font-size: 0.1rem;float: left;width: 100%;padding: 0.05rem;border-bottom: 1px solid #aaa;">J</div></c:if>
			<div class="cell"
				onclick="toChatPage('${A.getUaccount()}')"
				style="border-bottom: 1px solid #aaa;">
				<div style="width: 100%; height: 0.5rem;">
					<div
						style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
						<img
							src="${ctx}/images/user_headImage/${A.getHeadsrc()}"
							style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
					</div>
					<div class="user-info"
						style="height: 0.48rem; float: left; margin-left: 0.12rem;">
						<span
							style="font-size: 0.16rem; float: left; font-weight: bolder;line-height: 0.48rem;">${A.getNickname()}</span><br />
					</div>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach items="${K}" var="A" varStatus="s">
		<c:if test="${s.first }"><div class="cell" style="background: #CCC; font-size: 0.1rem;float: left;width: 100%;padding: 0.05rem;border-bottom: 1px solid #aaa;">K</div></c:if>
			<div class="cell"
				onclick="toChatPage('${A.getUaccount()}')"
				style="border-bottom: 1px solid #aaa;">
				<div style="width: 100%; height: 0.5rem;">
					<div
						style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
						<img
							src="${ctx}/images/user_headImage/${A.getHeadsrc()}"
							style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
					</div>
					<div class="user-info"
						style="height: 0.48rem; float: left; margin-left: 0.12rem;">
						<span
							style="font-size: 0.16rem; float: left; font-weight: bolder;line-height: 0.48rem;">${A.getNickname()}</span><br />
					</div>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach items="${L}" var="A" varStatus="s">
		<c:if test="${s.first }"><div class="cell" style="background: #CCC; font-size: 0.1rem;float: left;width: 100%;padding: 0.05rem;border-bottom: 1px solid #aaa;">L</div></c:if>
			<div class="cell"
				onclick="toChatPage('${A.getUaccount()}')"
				style="border-bottom: 1px solid #aaa;">
				<div style="width: 100%; height: 0.5rem;">
					<div
						style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
						<img
							src="${ctx}/images/user_headImage/${A.getHeadsrc()}"
							style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
					</div>
					<div class="user-info"
						style="height: 0.48rem; float: left; margin-left: 0.12rem;">
						<span
							style="font-size: 0.16rem; float: left; font-weight: bolder;line-height: 0.48rem;">${A.getNickname()}</span><br />
					</div>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach items="${M}" var="A" varStatus="s">
		<c:if test="${s.first }"><div class="cell" style="background: #CCC; font-size: 0.1rem;float: left;width: 100%;padding: 0.05rem;border-bottom: 1px solid #aaa;">M</div></c:if>
			<div class="cell"
				onclick="toChatPage('${A.getUaccount()}')"
				style="border-bottom: 1px solid #aaa;">
				<div style="width: 100%; height: 0.5rem;">
					<div
						style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
						<img
							src="${ctx}/images/user_headImage/${A.getHeadsrc()}"
							style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
					</div>
					<div class="user-info"
						style="height: 0.48rem; float: left; margin-left: 0.12rem;">
						<span
							style="font-size: 0.16rem; float: left; font-weight: bolder;line-height: 0.48rem;">${A.getNickname()}</span><br />
					</div>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach items="${N}" var="A" varStatus="s">
		<c:if test="${s.first }"><div class="cell" style="background: #CCC; font-size: 0.1rem;float: left;width: 100%;padding: 0.05rem;border-bottom: 1px solid #aaa;">N</div></c:if>
			<div class="cell"
				onclick="toChatPage('${A.getUaccount()}')"
				style="border-bottom: 1px solid #aaa;">
				<div style="width: 100%; height: 0.5rem;">
					<div
						style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
						<img
							src="${ctx}/images/user_headImage/${A.getHeadsrc()}"
							style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
					</div>
					<div class="user-info"
						style="height: 0.48rem; float: left; margin-left: 0.12rem;">
						<span
							style="font-size: 0.16rem; float: left; font-weight: bolder;line-height: 0.48rem;">${A.getNickname()}</span><br />
					</div>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach items="${O}" var="A" varStatus="s">
		<c:if test="${s.first }"><div class="cell" style="background: #CCC; font-size: 0.1rem;float: left;width: 100%;padding: 0.05rem;border-bottom: 1px solid #aaa;">O</div></c:if>
			<div class="cell"
				onclick="toChatPage('${A.getUaccount()}')"
				style="border-bottom: 1px solid #aaa;">
				<div style="width: 100%; height: 0.5rem;">
					<div
						style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
						<img
							src="${ctx}/images/user_headImage/${A.getHeadsrc()}"
							style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
					</div>
					<div class="user-info"
						style="height: 0.48rem; float: left; margin-left: 0.12rem;">
						<span
							style="font-size: 0.16rem; float: left; font-weight: bolder;line-height: 0.48rem;">${A.getNickname()}</span><br />
					</div>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach items="${P}" var="A" varStatus="s">
		<c:if test="${s.first }"><div class="cell" style="background: #CCC; font-size: 0.1rem;float: left;width: 100%;padding: 0.05rem;border-bottom: 1px solid #aaa;">P</div></c:if>
			<div class="cell"
				onclick="toChatPage('${A.getUaccount()}')"
				style="border-bottom: 1px solid #aaa;">
				<div style="width: 100%; height: 0.5rem;">
					<div
						style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
						<img
							src="${ctx}/images/user_headImage/${A.getHeadsrc()}"
							style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
					</div>
					<div class="user-info"
						style="height: 0.48rem; float: left; margin-left: 0.12rem;">
						<span
							style="font-size: 0.16rem; float: left; font-weight: bolder;line-height: 0.48rem;">${A.getNickname()}</span><br />
					</div>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach items="${Q}" var="A" varStatus="s">
		<c:if test="${s.first }"><div class="cell" style="background: #CCC; font-size: 0.1rem;float: left;width: 100%;padding: 0.05rem;border-bottom: 1px solid #aaa;">Q</div></c:if>
			<div class="cell"
				onclick="toChatPage('${A.getUaccount()}')"
				style="border-bottom: 1px solid #aaa;">
				<div style="width: 100%; height: 0.5rem;">
					<div
						style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
						<img
							src="${ctx}/images/user_headImage/${A.getHeadsrc()}"
							style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
					</div>
					<div class="user-info"
						style="height: 0.48rem; float: left; margin-left: 0.12rem;">
						<span
							style="font-size: 0.16rem; float: left; font-weight: bolder;line-height: 0.48rem;">${A.getNickname()}</span><br />
					</div>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach items="${R}" var="A" varStatus="s">
		<c:if test="${s.first }"><div class="cell" style="background: #CCC; font-size: 0.1rem;float: left;width: 100%;padding: 0.05rem;border-bottom: 1px solid #aaa;">R</div></c:if>
			<div class="cell"
				onclick="toChatPage('${A.getUaccount()}')"
				style="border-bottom: 1px solid #aaa;">
				<div style="width: 100%; height: 0.5rem;">
					<div
						style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
						<img
							src="${ctx}/images/user_headImage/${A.getHeadsrc()}"
							style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
					</div>
					<div class="user-info"
						style="height: 0.48rem; float: left; margin-left: 0.12rem;">
						<span
							style="font-size: 0.16rem; float: left; font-weight: bolder;line-height: 0.48rem;">${A.getNickname()}</span><br />
					</div>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach items="${S}" var="A" varStatus="s">
		<c:if test="${s.first }"><div class="cell" style="background: #CCC; font-size: 0.1rem;float: left;width: 100%;padding: 0.05rem;border-bottom: 1px solid #aaa;">S</div></c:if>
			<div class="cell"
				onclick="toChatPage('${A.getUaccount()}')"
				style="border-bottom: 1px solid #aaa;">
				<div style="width: 100%; height: 0.5rem;">
					<div
						style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
						<img
							src="${ctx}/images/user_headImage/${A.getHeadsrc()}"
							style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
					</div>
					<div class="user-info"
						style="height: 0.48rem; float: left; margin-left: 0.12rem;">
						<span
							style="font-size: 0.16rem; float: left; font-weight: bolder;line-height: 0.48rem;">${A.getNickname()}</span><br />
					</div>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach items="${T}" var="A" varStatus="s">
		<c:if test="${s.first }"><div class="cell" style="background: #CCC; font-size: 0.1rem;float: left;width: 100%;padding: 0.05rem;border-bottom: 1px solid #aaa;">T</div></c:if>
			<div class="cell"
				onclick="toChatPage('${A.getUaccount()}')"
				style="border-bottom: 1px solid #aaa;">
				<div style="width: 100%; height: 0.5rem;">
					<div
						style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
						<img
							src="${ctx}/images/user_headImage/${A.getHeadsrc()}"
							style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
					</div>
					<div class="user-info"
						style="height: 0.48rem; float: left; margin-left: 0.12rem;">
						<span
							style="font-size: 0.16rem; float: left; font-weight: bolder;line-height: 0.48rem;">${A.getNickname()}</span><br />
					</div>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach items="${U}" var="A" varStatus="s">
		<c:if test="${s.first }"><div class="cell" style="background: #CCC; font-size: 0.1rem;float: left;width: 100%;padding: 0.05rem;border-bottom: 1px solid #aaa;">U</div></c:if>
			<div class="cell"
				onclick="toChatPage('${A.getUaccount()}')"
				style="border-bottom: 1px solid #aaa;">
				<div style="width: 100%; height: 0.5rem;">
					<div
						style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
						<img
							src="${ctx}/images/user_headImage/${A.getHeadsrc()}"
							style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
					</div>
					<div class="user-info"
						style="height: 0.48rem; float: left; margin-left: 0.12rem;">
						<span
							style="font-size: 0.16rem; float: left; font-weight: bolder;line-height: 0.48rem;">${A.getNickname()}</span><br />
					</div>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach items="${V}" var="A" varStatus="s">
		<c:if test="${s.first }"><div class="cell" style="background: #CCC; font-size: 0.1rem;float: left;width: 100%;padding: 0.05rem;border-bottom: 1px solid #aaa;">V</div></c:if>
			<div class="cell"
				onclick="toChatPage('${A.getUaccount()}')"
				style="border-bottom: 1px solid #aaa;">
				<div style="width: 100%; height: 0.5rem;">
					<div
						style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
						<img
							src="${ctx}/images/user_headImage/${A.getHeadsrc()}"
							style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
					</div>
					<div class="user-info"
						style="height: 0.48rem; float: left; margin-left: 0.12rem;">
						<span
							style="font-size: 0.16rem; float: left; font-weight: bolder;line-height: 0.48rem;">${A.getNickname()}</span><br />
					</div>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach items="${W}" var="A" varStatus="s">
		<c:if test="${s.first }"><div class="cell" style="background: #CCC; font-size: 0.1rem;float: left;width: 100%;padding: 0.05rem;border-bottom: 1px solid #aaa;">W</div></c:if>
			<div class="cell"
				onclick="toChatPage('${A.getUaccount()}')"
				style="border-bottom: 1px solid #aaa;">
				<div style="width: 100%; height: 0.5rem;">
					<div
						style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
						<img
							src="${ctx}/images/user_headImage/${A.getHeadsrc()}"
							style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
					</div>
					<div class="user-info"
						style="height: 0.48rem; float: left; margin-left: 0.12rem;">
						<span
							style="font-size: 0.16rem; float: left; font-weight: bolder;line-height: 0.48rem;">${A.getNickname()}</span><br />
					</div>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach items="${X}" var="A" varStatus="s">
		<c:if test="${s.first }"><div class="cell" style="background: #CCC; font-size: 0.1rem;float: left;width: 100%;padding: 0.05rem;border-bottom: 1px solid #aaa;">X</div></c:if>
			<div class="cell"
				onclick="toChatPage('${A.getUaccount()}')"
				style="border-bottom: 1px solid #aaa;">
				<div style="width: 100%; height: 0.5rem;">
					<div
						style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
						<img
							src="${ctx}/images/user_headImage/${A.getHeadsrc()}"
							style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
					</div>
					<div class="user-info"
						style="height: 0.48rem; float: left; margin-left: 0.12rem;">
						<span
							style="font-size: 0.16rem; float: left; font-weight: bolder;line-height: 0.48rem;">${A.getNickname()}</span><br />
					</div>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach items="${Y}" var="A" varStatus="s">
		<c:if test="${s.first }"><div class="cell" style="background: #CCC; font-size: 0.1rem;float: left;width: 100%;padding: 0.05rem;border-bottom: 1px solid #aaa;">Y</div></c:if>
			<div class="cell"
				onclick="toChatPage('${A.getUaccount()}')"
				style="border-bottom: 1px solid #aaa;">
				<div style="width: 100%; height: 0.5rem;">
					<div
						style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
						<img
							src="${ctx}/images/user_headImage/${A.getHeadsrc()}"
							style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
					</div>
					<div class="user-info"
						style="height: 0.48rem; float: left; margin-left: 0.12rem;">
						<span
							style="font-size: 0.16rem; float: left; font-weight: bolder;line-height: 0.48rem;">${A.getNickname()}</span><br />
					</div>
				</div>
			</div>
		</c:forEach>
		
		<c:forEach items="${Z}" var="A" varStatus="s">
		<c:if test="${s.first }"><div class="cell" style="background: #CCC; font-size: 0.1rem;float: left;width: 100%;padding: 0.05rem;border-bottom: 1px solid #aaa;">Z</div></c:if>
			<div class="cell"
				onclick="toChatPage('${A.getUaccount()}')"
				style="border-bottom: 1px solid #aaa;">
				<div style="width: 100%; height: 0.5rem;">
					<div
						style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
						<img
							src="${ctx}/images/user_headImage/${A.getHeadsrc()}"
							style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
					</div>
					<div class="user-info"
						style="height: 0.48rem; float: left; margin-left: 0.12rem;">
						<span
							style="font-size: 0.16rem; float: left; font-weight: bolder;line-height: 0.48rem;">${A.getNickname()}</span><br />
					</div>
				</div>
			</div>
		</c:forEach>
		
	</div>

	<div class="footer">
		<div class="option" id="op1">

			<i class="fa fa-home"><img src="${ctx}/images/job1.gif"
				style="width: 0.3rem; margin-top: 0.02rem;" /></i>
			<div class="list0">任务大厅</div>

		</div>
		<div class="option" id="op2">
			<i class="fa fa-th-large"><c:choose>
					<c:when test="${count>0}">
						<img src="${ctx}/images/msg3.png"
							style="width: 0.3rem; margin-top: 0.02rem;" id="img_msg" />
					</c:when>
					<c:otherwise>
						<img src="${ctx}/images/msg1.gif"
							style="width: 0.3rem; margin-top: 0.02rem;" id="img_msg" />
					</c:otherwise>
				</c:choose></i>
			<div class="list1">消息</div>
		</div>
		<div class="option" id="op3">
			<i class="fa fa-list-ul"><img src="${ctx}/images/friend.png"
				style="width: 0.3rem; margin-top: 0.02rem;" /></i>
			<div class="list2">好友</div>
		</div>
		<div class="option" id="op4">
			<i class="fa fa-user-o"><img src="${ctx}/images/me.png"
				style="width: 0.3rem; margin-top: 0.02rem;" /></i>
			<div class="list3">我</div>
		</div>
	</div>

	<script>
	var url = "ws://192.168.43.54:8084/CampusRewardSoft/websocket";
	var ws = "";
	var message = {
		"pAccount" : "",
		"pContent" : "",
		"SendToWho" : ""
	};
	function connection() {
		ws = new WebSocket(url);
		console.log("connection.......");
		ws.onmessage = function(e) {
			var json = eval('(' + e.data.toString() + ')');
			console.log("有消息！");
			$("#img_msg").attr("src", "${ctx}/images/msg3.png");
		}
		ws.onclose = function() {
			showMessage("close");
		}
		ws.onerror = function(e) {
			showMessage("error");
		}
		ws.onopen = function() {
			//showMessage("链接成功")
			message.pAccount = "${loginUser.account}";
			message.pContent = "newUser";
			console.log(JSON.stringify(message));
			ws.send(JSON.stringify(message));
			message.pContent = "";
			console.log("连接成功!");
		}
	}
	if (ws == "")
		connection();

	window.onbeforeunload = function(event) {
		ws.onclose = function() {
		};
		ws.close();
		var scrollPos;    
		if (typeof window.pageYOffset != 'undefined') {
		   scrollPos = window.pageYOffset;
		}
		else if (typeof document.compatMode != 'undefined' &&
			 document.compatMode != 'BackCompat') {
		   scrollPos = document.documentElement.scrollTop;
		}
		else if (typeof document.body != 'undefined') {
		   scrollPos = document.body.scrollTop;
		}
		document.cookie="scrollTop="+scrollPos; //存储滚动条位置到cookies中
	}
	window.onload= function()
	{ 
		if(document.cookie.match(/scrollTop=([^;]+)(;|$)/)!=null){
			var arr=document.cookie.match(/scrollTop=([^;]+)(;|$)/); //cookies中不为空，则读取滚动条位置
			document.documentElement.scrollTop=parseInt(arr[1]);
			document.body.scrollTop=parseInt(arr[1]);
		}
	}
	
		
		function toChatPage(a){
			window.location.href="/CampusRewardSoft/mainIndex/"+a+"/27/3/chatPage.do";
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
	<script type="text/javascript">
		document.addEventListener('plusready', function(a) {
			var first = null;
			plus.key.addEventListener('backbutton', function() {
				//首次按键，提示‘再按一次退出应用’
				if (!first) {
					first = new Date().getTime();
					console.log('再按一次退出应用');//用自定义toast提示最好
					setTimeout(function() {
						first = null;
					}, 1000);
				} else {
					if (new Date().getTime() - first < 1000) {
						plus.runtime.quit();
					}
				}
			}, false);
		});

		$("#op1").click(function() {
			window.location.href = "index.do";
		});
		$("#op2").click(function() {
			window.location.href = "msg.do";
		});
		$("#op4").click(function() {
			window.location.href = "me.do";
		});
	</script>

</body>
</html>