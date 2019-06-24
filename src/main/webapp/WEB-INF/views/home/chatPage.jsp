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
<title>聊天页面</title>
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

.header {
	height: 0.44rem;
}
/*top固定在顶端*/
.top {
	position: fixed;
	left: 0;
	top: 0;
	z-index: 10;
	height: 0.44rem;
	background: #379AFF;
	font-size: 0.3rem;
	width: 100%;
	text-align: center;
	padding-left: 0.17rem;
	padding-right: 0.17rem;
	line-height: 0.44rem;
	font-weight: lighter;
	color: #555;
}

.header:after {
	content: "";
	display: block;
	clear: both;
}

.top>.address {
	float: left;
}

/*内容*/
.content {
	overflow: scroll;
	margin-top: 0.1rem;
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
	height: 0.45rem;
	background: #fff;
	display: flex;
	flex-flow: row;
	justify-content: space-around;
	line-height: 0.45rem;
	border-top: 0.01px solid #ccc;
}

.content {
	margin-bottom: 0.5rem;
}

.selects {
	display: block;
	width: 70%;
	height: 0.44rem;
	font-size: 0.16rem;
	position: relative;
	margin: auto;
	padding: 0 0 0 0;
	font-weight: 900;
	color: #000;
}

.left_triangle {
	height: 0px;
	width: 0px;
	border-width: 0.08rem;;
	border-style: solid;
	border-color: transparent #fff transparent transparent;
	float: left;
	margin-top: 0.15rem;
}

.right_triangle {
	height: 0px;
	width: 0px;
	border-width: 0.08rem;
	border-style: solid;
	border-color: transparent transparent transparent #98E165;
	float: right;
	margin-top: 0.15rem;
}
</style>
</head>
<body onload="window.scrollTo(0,document.body.scrollHeight);">
	<div class="header">
		<div class="top">
			<div class="address"
				onclick="toJobPage('${chatPid}','${isto}','${chatUser.getUaccount()}')"><</div>

			<div class="selects"
				onclick="toUserInfo('${chatUser.getUaccount()}','${pid}','${isto}')">${chatUser.getNickname()}</div>
		</div>
	</div>

	<div class="content">
		<c:forEach items="${chatList}" var="chatList" varStatus="s">

			<c:if test="${s.first}">
				<div class="aa0"
					style="margin-bottom: 0.05rem; text-align: center; margin-top: 0.1rem; width: 100%; color: #555; float: left;">${chatList.getPm().getpTime()}</div>
			</c:if>
			<c:if test="${chatList.getPm().getpTime()==chatList.getTime()}">
				<div
					style="margin-bottom: 0.05rem; text-align: center; margin-top: 0.1rem; width: 100%; color: #555; float: left;">${chatList.getPm().getpTime()}</div>
			</c:if>

			<c:choose>
				<c:when
					test="${chatList.getPm().getpAccount() == loginUser.account}">

					<div
						style="margin-top: 0.1rem; padding-right: 0.1rem; width: 100%; float: right;">

						<div style="background: #fff; width: 100%;"
							onclick="toUserInfo('${myui.getUaccount()}','${pid}','${isto}')">
							<div
								style="width: 0.45rem; height: 0.45rem; float: right; border-radius: 50%; overflow: hidden;">
								<img src="${ctx}/images/user_headImage/${myui.getHeadsrc()}"
									style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
							</div>
						</div>
						<div class="right_triangle"></div>

						<div
							style="min-width: 0.5rem; border-radius: 8px; background: #98E165; max-width: 60%; float: right; margin-top: 0rem; padding: 0.12rem; font-size: 0.17rem;">
							${chatList.getPm().getpContent()}</div>
					</div>
				</c:when>
				<c:otherwise>
					<div
						style="margin-top: 0.1rem; padding-left: 0.1rem; width: 100%; float: left;">

						<div style="background: #fff; width: 100%;"
							onclick="toUserInfo('${chatUser.getUaccount()}','${pid}','${isto}')">
							<div
								style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
								<img src="${ctx}/images/user_headImage/${chatUser.getHeadsrc()}"
									style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
							</div>
						</div>
						<div class="left_triangle"></div>
						<div
							style="min-width: 0.5rem; border-radius: 8px; background: #fff; max-width: 60%; float: left; margin-top: 0rem; padding: 0.12rem; font-size: 0.17rem;">
							${chatList.getPm().getpContent()}</div>
					</div>
				</c:otherwise>
			</c:choose>

		</c:forEach>
	</div>

	<div class="footer">
		<input type="hidden" value="${chatUser.getUaccount() }" id="who">
		<input type="hidden" value="${chatPid}" id="pid"> <input
			type="hidden" value="${loginUser.account}" id="self"> <input
			type="hidden" value="${socketPath}" id="socketPath">
		<div style="margin: 0px; float: left; width: 72%; background: red;">
			<input type="text" id="myMsg"
				style="padding-left: 0.1rem; font-size: 0.18rem; outline: none; border: none; float: left; height: 100%; width: 100%;"
				placeholder="输入你想说的话...">
		</div>
		<div style="float: left; width: 13%;">
			<div
				style="border-radius: 0.5rem; width: 0.3rem; margin-top: 0.075rem; margin-left: 0.075rem; text-align: center; line-height: 0.25rem; color: #ccc; font-size: 0.35rem; border: 1px solid #ccc; float: left; height: 0.3rem;">+</div>
		</div>
		<div style="float: left; width: 15%;">
			<input type="submit" value="发送" id="sendMsg"
				style="outline: none; font-size: 0.13rem; width: 0.5rem; height: 0.3rem; line-height: 0.3rem; margin-top: 0.075rem; border: none; border-radius: 5px; color: #fff; background: #339Aff; float: left;">
		</div>
	</div>

	<script>
		function toUserInfo(a, b, c) {

			window.location.href = "/CampusRewardSoft/mainIndex/" + a + "/" + b
					+ "/" + c + "/userInfo.do";
		}

		function toJobPage(a, b, c) {

			if (a == "2")
				window.location.href = "/CampusRewardSoft/mainIndex/msg.do";
			else if (a == "27")
				window.location.href = "/CampusRewardSoft/mainIndex/friend.do";
			else if (b == "3")
				window.location.href = "/CampusRewardSoft/mainIndex/" + a
						+ "/0/oderPage.do";
			else if (b == "10010")
				window.history.back(-1);
			else
				window.location.href = "/CampusRewardSoft/mainIndex/" + a + "/"
						+ b + "/jobPage.do";

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
				if (json.pAccount == $("#who").val()
						&& json.pAccount != $("#self").val()) {
					showMessage(json.pContent, 0); //显示信息
					window.scrollTo(0, document.body.scrollHeight);
				}
				$.ajax({
					type : "POST",
					url : "/CampusRewardSoft/mainIndex/msgR.do",
					data : {
						account : json.pAccount
					},
					dataType : "text",
					success : function(data) {

					},
					error : function(e) {
						alert("发布错误！！");
					}
				});
			}
			ws.onclose = function() {
				showMessage("close");
			}
			ws.onerror = function(e) {
				showMessage("error");
			}
			ws.onopen = function() {
				//showMessage("链接成功")
				message.pAccount = $("#self").val();
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
		}
		//点击发送按钮
		$("#sendMsg").click(function() {

			if ($("#myMsg").val().trim().length <= 0) {
				alert("消息不能为空！");
				return;
			}
			var me = $("#self").val();
			var who = $("#who").val();
			var msg = $("#myMsg").val();

			$.ajax({
				type : "POST",
				url : "/CampusRewardSoft/mainIndex/sendMsgAjax.do",
				data : {
					me : me,
					who : who,
					msg : msg
				},
				dataType : "text",
				success : function(data) {
					//添加成功后发送给对方
					message.SendToWho = $("#who").val();
					message.pContent = $("#myMsg").val();
					$("#myMsg").val("");
					ws.send(JSON.stringify(message));

					showMessage(message.pContent, 1); //显示信息
					message.pContent = "";
					window.scrollTo(0, document.body.scrollHeight);
				},
				error : function(e) {
					alert("发布错误！！");
				}
			});

		});

		function showMessage(msg, a) {
			if (a == "0") {
				$(".content")
						.append(
								"<div style='margin-top: 0.1rem; padding-left: 0.1rem; width: 100%; float: left;'>"
										+ "<div style='background: #fff; width: 100%;'>"
										+ "<div style='width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;'>"
										+ "<img src='${ctx}/images/user_headImage/${chatUser.getHeadsrc()}' style='height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;' />"
										+ "</div> </div> <div class='left_triangle'></div>"
										+ "<div style='min-width: 0.5rem; border-radius: 8px; background: #fff; max-width: 60%; float: left; margin-top: 0rem; padding: 0.12rem; font-size: 0.17rem;'>"
										+ msg + "</div> </div>");

			}

			if (a == "1") {
				$(".content")
						.append(
								"<div style='margin-top: 0.1rem; padding-right: 0.1rem; width: 100%; float: right;'>"
										+ "<div style='background: #fff; width: 100%;'>"
										+ "<div style='width: 0.45rem; height: 0.45rem; float: right; border-radius: 50%; overflow: hidden;'>"
										+ "<img src='${ctx}/images/user_headImage/${myui.getHeadsrc()}' style='height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;' />"
										+ "</div> </div> <div class='right_triangle'></div>"
										+ "<div style='min-width: 0.5rem; border-radius: 8px; background: #98E165; max-width: 60%; float: right; margin-top: 0rem; padding: 0.12rem; font-size: 0.17rem;'>"
										+ msg + "</div> </div>");

			}
		}
	</script>

</body>
</html>