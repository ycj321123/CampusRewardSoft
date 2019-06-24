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
<title>订单详情</title>
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
	line-height: 0.5rem;
	font-size: 0.18rem;
}

.footer>.option0 {
	width: 33%;
	text-align: center;
	line-height: 0.5rem;
	font-size: 0.18rem;
	color: #555;
	background: #F7F7F7;
}

.footer>.option1 {
	width: 33%;
	text-align: center;
	line-height: 0.5rem;
	background: #FFAA25;
	color: #fff;
	font-size: 0.18rem;
}

.footer>.option2 {
	width: 34%;
	text-align: center;
	line-height: 0.5rem;
	background: #FFAA25;
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
	font-size: 0.15rem;
	color: #555;
	position: relative;
	margin: auto;
	padding: 0;
	line-height: 0.44rem;
}

.selects_head input {
	height: 0.24rem;
	width: 88%;
	border-radius: 15px;
	border: none;
	outline: none;
	text-indent: 0.18rem;
	font-size: 0.13rem;
}
</style>
</head>
<body>
	<div class="header">
		<div class="top">
			<div class="address" onclick="toMyOder('${isto}')">&lt;</div>
			<div class="selects">订单详情</div>
		</div>

	</div>

	<div class="content">
		<div class="cell"
			onclick="toJobPage(${oder.getPublish_job().getPId()},'${oder.getOderid()}')">
			<div style="width: 100%; height: 0.5rem;">
				<div
					style="width: 0.48rem; height: 0.48rem; float: left; border-radius: 50%; overflow: hidden;">
					<img src="${ctx}/images/user_headImage/${oui.getHeadsrc()}"
						style="height: 0.47rem; width: 0.47rem; min-width: 10px; min-height: 10px;" />
				</div>
				<div class="user-info"
					style="height: 0.48rem; float: left; margin-left: 0.12rem;">
					<div
						style="font-size: 0.15rem; float: left; line-height: 0.5rem; font-size: 0.15rem;">${oui.getNickname()}</div>
				</div>
			</div>

			<div class="job_title"
				style="margin-top: 0.15rem; padding-bottom: 0.1rem;">

				<b style="color: #A6A6A6; font-size: 0.16rem;">#
					${oder.getPublish_job().getpTitle()} #</b> <span
					style="font-size: 0.15rem;"> <c:choose>
						<c:when test="${text!=null}">${text}...</c:when>
						<c:otherwise>${oder.getPublish_job().getpContent()}</c:otherwise>
					</c:choose>
				</span>

			</div>
		</div>
		<div class="cell" style="padding-bottom: 0.1rem;">
			<div style="font-size: 0.15rem; margin-bottom: 0.2rem;">
				<b>订单价格：</b>￥${oder.getPublish_job().getPrice()}
			</div>

			<div style="font-size: 0.15rem; padding-bottom: 0.05rem;">
				<b>订单信息</b>
			</div>
			<div style="color: #555;">
				<table>
					<tr>
						<td>订单编号</td>
						<td style="padding-left: 0.2rem;">${oder.getOderid()}</td>
					</tr>
					<tr>
						<td>任务创建时间</td>
						<td style="padding-left: 0.2rem;">${oder.getPublish_job().getpTime()}</td>
					</tr>
					<tr>
						<td>任务期限</td>
						<td style="padding-left: 0.2rem;">${rtime}</td>
					</tr>
					<tr>
						<td>发布者账号</td>
						<td style="padding-left: 0.2rem;">${oder.getPublish_job().getpAccount()}&nbsp;
							&nbsp;<a href="tel:${oder.getPublish_job().getpAccount()}">拨打</a>
						</td>
					</tr>
					<tr>
						<td>接受者账号</td>
						<td style="padding-left: 0.2rem;">${rj.getrAccount()}&nbsp;
							&nbsp;<a href="tel:${rj.getrAccount()}">拨打</a>
						</td>
					</tr>
					<tr>
						<td>接受者昵称</td>
						<td style="padding-left: 0.2rem;">${rui.getNickname()}</td>
					</tr>
					<tr>
						<td>任务接受时间</td>
						<td style="padding-left: 0.2rem;">${rj.getrTime()}</td>
					</tr>
					<tr>
						<td>任务提交时间</td>
						<c:choose>
							<c:when test="${rj.getOkTime()=='0'}">
								<td style="padding-left: 0.2rem; color: #339aff;">任务执行中...</td>
							</c:when>
							<c:otherwise>
								<td style="padding-left: 0.2rem;">${rj.getOkTime()}</td>
							</c:otherwise>
						</c:choose>
					</tr>

				</table>
			</div>

		</div>
		<div style="margin-left: 0.1rem; margin-top: 0.1rem;">如对以上信息有疑问，请联系客服微信：y1297815658。</div>
	</div>

	<div class="footer">

		<c:choose>
			<c:when test="${oder.getPublish_job().getpAccount()==loginUser.getAccount()}">
				<div class="option0" onclick="toWho('${rj.getrAccount()}','${oder.getOderid()}')">联系接受者</div>
			</c:when>
			<c:otherwise><div class="option0" onclick="toWho('${oder.getPublish_job().getpAccount()}','${oder.getOderid()}')">联系发布者</div></c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${oder.getPublish_job().getIsComplish()==4}">
				<div class="option1" style="background: #339aff;"
					onclick="testJob(3,'${oder.getOderid()}')">没有完成</div>
				<div class="option2" style="background: #FF6700;"
					onclick="testJob(2,'${oder.getOderid()}')">确认完成</div>
			</c:when>
			<c:when test="${oder.getPublish_job().getIsComplish()==2}">
				<div class="option1" style="background: #339aff;">成功交易</div>
				<div class="option2" style="background: #FF6700;"
					onclick="delOder('${oder.getOderid()}')">删除订单</div>
			</c:when>
			<c:when test="${oder.getPublish_job().getIsComplish()==3}">
				<div class="option1" style="background: #339aff;">交易失败</div>
				<div class="option2" style="background: #FF6700;"
					onclick="delOder('${oder.getOderid()}')">删除订单</div>
			</c:when>
			<c:otherwise>
				<div class="option1" style="background: #339aff;">进行中...</div>
				<div class="option2" style="background: #FF6700;"
					onclick="call('${oder.getOderid()}')">催促他</div>
			</c:otherwise>
		</c:choose>

	</div>

	<script>	
		function call(a){
			var me="${loginUser.account}";
	   		var who="${rj.getrAccount()}"
	   		var msg="你接受的任务：<span style='color:#339aff;'>#${oder.getPublish_job().getpTitle()}#</span>请你尽快完成";
	   		
   			$.ajax({
   				type : "POST",
   				url : "/CampusRewardSoft/mainIndex/sendMsgAjax.do",
   				data : {me:me,who:who,msg:msg},
   				dataType : "text",
   				success : function(data) {
   					//添加成功后发送给对方
					alert("已催促他了！");
   				},
   				error : function(e) {
   					alert("发布错误！！");
   				}
   			});	
	         
	       
		}
	
		//联系谁
		function toWho(a,b){
			window.location.href="/CampusRewardSoft/mainIndex/"+a+"/"+b+"/3/chatPage.do";
		}
		
		function testJob(a,b){
			if(a==3){
				if(confirm("确定任务失败吗？")){
					$.ajax({
						type : "POST",
						url : "/CampusRewardSoft/mainIndex/"+b+"/testJob.do",
						data : {result:"3"},
						dataType : "text",
						success : function(data) {
							console.log(data);
							window.location.href="/CampusRewardSoft/mainIndex/"+data+"/0/oderPage.do";
						},
						error : function(e) {
							alert("发布错误！！");
						}
					});	
				}else{
				}
			}
			if(a==2){			
				if(confirm("确定任务完成吗？")){
					$.ajax({
						type : "POST",
						url : "/CampusRewardSoft/mainIndex/"+b+"/testJob.do",
						data : {result:"2"},
						dataType : "text",
						success : function(data) {
							console.log(data);
							window.location.href="/CampusRewardSoft/mainIndex/"+data+"/0/oderPage.do";
						},
						error : function(e) {
							alert("发布错误！！");
						}
					});	
				}
				else{}
			}
		}
		function delOder(a){
			$.ajax({
				type : "POST",
				url : "/CampusRewardSoft/mainIndex/delOder.do",
				data : {oderid:a},
				dataType : "text",
				success : function(data) {
					alert("已删除！");
					window.location.href="/CampusRewardSoft/mainIndex/myOder.do";
				},
				error : function(e) {
					alert("发布错误！！");
				}
			});	
		}
	
		function toMyOder(a){
			if(a=="0")
				window.location.href="/CampusRewardSoft/mainIndex/myOder.do";
			else if(a=="1")
				window.location.href="/CampusRewardSoft/mainIndex/61587581796/2/myJobPage.do";
		}
	
		function toJobPage(a,b){
			/*$.ajax({
				type : "POST",
				url : "jobPage.do",
				data : {pid:a,isto:b},
				dataType : "text",
				success : function(data) {
					console.log(data);
					window.location.href="jobPage.do";
				},
				error : function(e) {
					alert("发布错误！！");
				}
			});	*/
			
			window.location.href="/CampusRewardSoft/mainIndex/"+a+"/${oder.getOderid()}/jobPage.do";

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