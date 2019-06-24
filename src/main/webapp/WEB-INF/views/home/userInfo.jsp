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
<link rel="stylesheet"
	href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
<title>任务</title>
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
	color: #555;
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
	font-size: 0.3rem;
	font-weight: lighter;
}

.top .input {
	padding: 0.03rem;
	width: auto;
	height: 0.44rem;
	background: transparent;
	border: none;
	border-bottom: 0.02rem solid #000;;
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
	margin-top: 0.07rem;
	background: white;
	padding-top: 0.17rem;
}

/*页脚样式*/
.footer {
	position: fixed;
	width: 100%;
	left: 0;
	bottom: 0;
	z-index: 5;
	height: 0.5rem;
	background: #eee;
	display: flex;
	flex-flow: row;
	justify-content: space-around;
	line-height: 0.24rem;
}

.footer>.option0 {
	width: 50%;
	text-align: center;
	line-height: 0.5rem;
	font-size: 0.18rem;
	color: #fff;
	background: red;
}

.footer>.option1 {
	width: 50%;
	text-align: center;
	line-height: 0.5rem;
	background: #399aff;
	color: #fff;
	font-size: 0.18rem;
}

.content {
	margin-bottom: 0.5rem;
}

.selects {
	display: block;
	width: 80%;
	height: 0.44rem;
	font-size: 0.18rem;
	color: #555;
	position: relative;
	margin: auto;
	padding: 0;
	line-height: 0.44rem;
	font-weight: bolder;
}
</style>
</head>
<body>
	<div class="header">
		<div class="top">
			<div class="address" onclick="toWho('${user.getUaccount()}','${id}','${isto}')">&lt;</div>
			<div class="selects">个人资料</div>
		</div>

	</div>

	<div class="content">
		<div class="cell"
			style="width: 100%; float: left; padding-bottom: 0.15rem;">
			<div>
				<div
					style="width: 0.48rem; height: 0.48rem; float: left; border-radius: 50%; overflow: hidden;">
					<img src="${ctx}/images/user_headImage/${user.getHeadsrc()}"
						style="height: 0.47rem; width: 0.47rem; min-width: 10px; min-height: 10px;" />
				</div>
				<div class="user-info"
					style="height: 0.48rem; float: left; margin-left: 0.12rem;">
					<span style="font-size: 0.15rem; float: left; margin-top: 0.04rem;">${user.getNickname()}</span><br />
					<div id="pTime"
						style="font-size: 0.115rem; color: rgb(180, 154, 255); float: left; margin-top: 0.05rem;">
						<c:choose>
							<c:when test="${user.getSex()==1}">
								<i
									style="font-size: 0.12rem; float: left; color: red; font-weight: bold;"
									class="fa">&#xf226</i>
							</c:when>
							<c:otherwise>
								<i
									style="font-size: 0.12rem; float: left; color: #399aff; font-weight: bold;"
									class="fa">&#xf228</i>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
		<div class="cell"
			style="margin-top: 0.1rem; float: left; width: 100%; padding-top: 0.1rem; padding-bottom: 0.1rem; border-bottom: 1px solid #ccc;">
			基本资料：</div>
		<div class="cell"
			style="margin-top: 0px; float: left; width: 100%; padding-top: 0.1rem; padding-bottom: 0.1rem; border-bottom: 1px solid #ccc;">
			<table>
				<tr style="height: 0.25rem;">
					<td>昵称</td>
					<td style="padding-left: 0.5rem;">${user.getNickname()}</td>
				</tr>
				<tr style="height: 0.25rem;">
					<td>生日</td>
					<td style="padding-left: 0.5rem;">${user.getBirthday()}</td>
				</tr>
				<tr style="height: 0.25rem;">
					<td>所在地</td>
					<td style="padding-left: 0.5rem;">${user.getAddr()}</td>
				</tr>
			</table>
		</div>

		<div class="cell"
			style="margin-top: 0.1rem; float: left; width: 100%; padding-top: 0.1rem; padding-bottom: 0.1rem; border-bottom: 1px solid #ccc;">
			学籍资料：</div>
		<div class="cell"
			style="margin-top: 0px; float: left; width: 100%; padding-top: 0.1rem; padding-bottom: 0.1rem; border-bottom: 1px solid #ccc;">
			<table>
				<tr style="height: 0.25rem;">
					<td>学校</td>
					<td style="padding-left: 0.5rem;">${student_status.getSchoolName()}</td>
				</tr>
				<tr style="height: 0.25rem;">
					<td>院系</td>
					<td style="padding-left: 0.5rem;">${student_status.getYuanXi()}</td>
				</tr>
				<tr style="height: 0.25rem;">
					<td>专业</td>
					<td style="padding-left: 0.5rem;">${student_status.getZhuanYe()}</td>
				</tr>
				<tr style="height: 0.25rem;">
					<td>学历</td>
					<td style="padding-left: 0.5rem;">${student_status.getXueLi()}</td>
				</tr>
				<tr style="height: 0.25rem;">
					<td>入学年份</td>
					<td style="padding-left: 0.5rem;">${student_status.getRuxueYear()}</td>
				</tr>
			</table>
		</div>

	</div>
	<div class="footer">

		<c:choose>
			<c:when test="${user.getUaccount()==loginUser.account || user.getUaccount()=='a100000'}">
				
			</c:when>
			<c:when test="${gr.getIsAgree()==1}">
				<div class="option0"
					onclick="delFr(${gr.getYourAccount()},${id},${isto })"style="width: 100%;">
					删除好友</div>
			</c:when>
			<c:when test="${gr.getIsAgree()==0}">
				<div class="option1" style="width: 100%; background: #ccc;">
					等待验证</div>
			</c:when>
			<c:otherwise>
				<div class="option1"
					onclick="add(${user.getUaccount()},${id},${isto })" style="width: 100%;">
					加为好友</div>
			</c:otherwise>

		</c:choose>
	</div>

	<script>
		function toWho(u,id,a){
			if(a=="440")window.location.href="/CampusRewardSoft/mainIndex/a100000/2/"+a+"/chatPage.do";	
			else
				window.location.href="/CampusRewardSoft/mainIndex/"+u+"/"+id+"/"+a+"/chatPage.do";
		}
		//删除好友
		function delFr(a,b,c){
			window.location.href="/CampusRewardSoft/mainIndex/"+a+"/"+b+"/"+c+"/delfriend.do";
		}
		//加为好友
		function add(a,b,c){
			var msg="用户： ${loginUser.getUsername()}请求添加你为好友，<a href='/CampusRewardSoft/mainIndex/${loginUser.account}/2/440/checkUser.do' style='color:#339aff;'>点击验证</a>";
			$.ajax({
   				type : "POST",
   				url : "/CampusRewardSoft/mainIndex/"+a+"/"+b+"/"+c+"/Addfriend.do",
   				data : {text:msg},
   				dataType : "text",
   				success : function(data) {
   					alert("发送请求成功！")
   					window.location.href="/CampusRewardSoft/mainIndex/"+a+"/"+b+"/"+c+"/userInfo.do";
   				},
   				error : function(e) {
   					alert("发布错误！！");
   				}
   			});	
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

</body>
</html>