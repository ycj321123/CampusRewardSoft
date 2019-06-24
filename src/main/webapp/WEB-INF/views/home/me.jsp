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
<title>我</title>
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

.content {
	overflow: scroll;
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

.footer>.option>.list3 {
	color: #379AFF;
}
</style>
</head>
<body>

	<div class="content">
		<div class="cell"
			style="margin-top:-0.12rem; padding-left: 0.2rem;background: url('${ctx}/images/me_background.jpg') 1% 100%; background-size: 100% 100%;">
			<div style="width: 100%; padding-bottom: 1rem; margin-top: 0.6rem;">
				<c:choose>
					<c:when test="${user_info.getHeadsrc()!=null}">
						<div
							style="width: 0.65rem; height: 0.65rem; float: left; border-radius: 50%; overflow: hidden;">
							<img src="${ctx}/images/user_headImage/${user_info.getHeadsrc()}"
								style="height: 0.65rem; width: 0.65rem; min-width: 10px; min-height: 10px;" />
						</div>
					</c:when>
					<c:otherwise>
						<div
							style="width: 0.65rem; height: 0.65rem; float: left; border-radius: 50%; overflow: hidden;">
							<img src="${ctx}/images/user_headImage/20190131152230643.jpg"
								style="height: 0.65rem; width: 0.65rem; min-width: 10px; min-height: 10px;" />
						</div>
					</c:otherwise>
				</c:choose>

				<div style="margin-left: 0.2rem; float: left;">
					<div
						style="font-size: 0.18rem; margin-top: 0.06rem; width: auto; float: left; font-family: 黑体;">
						${loginUser.username}<c:if test="${user_info.getRealname()!=null && user_info.getRealname()!=''}">(已实名)</c:if>
						<c:if test="${user_info.getRealname()==null || user_info.getRealname()==''}">(未实名)</c:if></div>
					<br />
					<div style="margin-top: 0.06rem; float: left; width: auto;">账号：${loginUser.account}</div>
				</div>
			</div>
		</div>

		<div onclick="me_child(0)" class="cell"
			style="height: 0.5rem; margin-top: -0.07rem; padding-top: 0px; border-bottom: 1px solid #ccc;">
			<div style="width: 100%;">
				<div
					style="margin-left: 0.1rem !important; font-size: 0.16rem; float: left; line-height: 0.5rem;">
					我的资料</div>
			</div>
			<div
				style="float: right; font-size: 0.3rem; font-weight: lighter; color: #ccc; line-height: 0.5rem;">></div>
		</div>

		<div onclick="me_child(7)" class="cell"
			style="margin-top: 0rem; height: 0.55rem; padding-top: 0px;">
			<div style="width: 100%;">
				<div
					style="margin-left: 0.1rem !important; font-size: 0.16rem; float: left; line-height: 0.55rem;">
					我的钱包</div>
			</div>
			<div
				style="float: right; font-size: 0.3rem; font-weight: lighter; color: #ccc; line-height: 0.55rem;">&gt;</div>
		</div>

		<div onclick="me_child(1)" class="cell"
			style="margin-top: 0.1rem; height: 0.55rem; padding-top: 0px; border-bottom: 1px solid #ccc;">
			<div style="width: 100%;">
				<div
					style="margin-left: 0.1rem !important; font-size: 0.16rem; float: left; line-height: 0.55rem;">
					实名认证</div>
			</div>
			<div
				style="float: right; font-size: 0.3rem; font-weight: lighter; color: #ccc; line-height: 0.55rem;">&gt;</div>
		</div>
		<div onclick="me_child(2)" class="cell"
			style="margin-top: 0rem; height: 0.55rem; padding-top: 0px;">
			<div style="width: 100%;">
				<div
					style="margin-left: 0.1rem !important; font-size: 0.16rem; float: left; line-height: 0.55rem;">
					积分查询</div>
			</div>
			<div
				style="float: right; font-size: 0.3rem; font-weight: lighter; color: #ccc; line-height: 0.55rem;">></div>
		</div>


		<div onclick="me_child(3)" class="cell"
			style="margin-top: 0.1rem; height: 0.55rem; padding-top: 0px; border-bottom: 1px solid #ccc;">
			<div style="width: 100%;">
				<div
					style="margin-left: 0.1rem !important; font-size: 0.16rem; float: left; line-height: 0.55rem;">
					发布的任务</div>
			</div>
			<div
				style="float: right; font-size: 0.3rem; font-weight: lighter; color: #ccc; line-height: 0.55rem;">&gt;</div>
		</div>
		<div onclick="me_child(4)" class="cell"
			style="margin-top: 0rem; height: 0.55rem; padding-top: 0px; border-bottom: 1px solid #ccc;">
			<div style="width: 100%;">
				<div
					style="margin-left: 0.1rem !important; font-size: 0.16rem; float: left; line-height: 0.55rem;">
					接收的任务</div>
			</div>
			<div
				style="float: right; font-size: 0.3rem; font-weight: lighter; color: #ccc; line-height: 0.55rem;">&gt;</div>
		</div>
		<div onclick="me_child(5)" class="cell"
			style="margin-top: 0rem; height: 0.55rem; padding-top: 0px;">
			<div style="width: 100%;">
				<div
					style="margin-left: 0.1rem !important; font-size: 0.16rem; float: left; line-height: 0.55rem;">
					我的订单</div>
			</div>
			<div
				style="float: right; font-size: 0.3rem; font-weight: lighter; color: #ccc; line-height: 0.55rem;">&gt;</div>
		</div>

		<div onclick="me_child(6)" class="cell"
			style="height: 0.55rem; margin-bottom: 0.2rem; margin-top: 0.1rem; padding-top: 0px;">
			<div style="width: 100%;">
				<div
					style="margin-left: 0.1rem !important; font-size: 0.16rem; float: left; line-height: 0.55rem;">
					设置</div>
			</div>
			<div
				style="float: right; font-size: 0.3rem; font-weight: lighter; color: #ccc; line-height: 0.55rem;">&gt;</div>
		</div>

	</div>

	<div class="footer">
		<div class="option  shouye" id="op1">

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
			<i class="fa fa-list-ul"><img src="${ctx}/images/friend2.png"
				style="width: 0.3rem; margin-top: 0.02rem;" /></i>
			<div class="list2">好友</div>
		</div>
		<div class="option">
			<i class="fa fa-user-o"><img src="${ctx}/images/me2.png"
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

		$("#op2").click(function() { //点击消息
			window.location.href = "msg.do";
		});
		$("#op3").click(function() { //点击好友
			window.location.href = "friend.do";
		});
		$("#op1").click(function() { //点击任务大厅
			window.location.href = "index.do";
		});
	</script>

	<script type="text/javascript">
		function me_child(value) {
			switch (value) {
			case 0: //我的资料
				window.location.href = "my_info.do";
				break;
			case 1: //实名认证
				window.location.href = "my_IDCard.do";
				break;
			case 2: //积分查询
				window.location.href = "integration.do";
				break;
			case 3:
				window.location.href = "myPublishJob.do";
				break;
			case 4:
				window.location.href = "myReceiveJob.do";
				break;
			case 5:
				window.location.href = "myOder.do";
				break;
			case 6:
				window.location.href = "softSet.do";
				break;
			case 7:
				window.location.href = "myMoney.do";
				break;
			}
		}
	</script>

</body>
</html>