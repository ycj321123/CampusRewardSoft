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

<title>任务大厅</title>
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
	background: #FFf;
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
	background: #E2F4FF;
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

.footer>.option>.list1 {
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
				<div class="selects_head">我的消息</div>
			</div>

		</div>

	</div>

	<div class="content">
		<c:forEach items="${wholist}" var="wholist" varStatus="s">
			<c:choose>
				<c:when test="${s.last}">
					<div class="cell"
						onclick="toChatPage('${wholist.getUi().getUaccount()}')"
						style="border-bottom: 0px;">
						<div style="width: 100%; height: 0.5rem;">
							<div
								style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
								<img
									src="${ctx}/images/user_headImage/${wholist.getUi().getHeadsrc()}"
									style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
							</div>
							<c:choose>
								<c:when test="${wholist.getPm().getIsRead()==0 && wholist.getPm().getpAccount()!=loginUser.getAccount()}}">
									<div id="${wholist.getUi().getUaccount()}a"
										style="float: left; border-radius: 50%; margin-top: -0.03rem; margin-left: -0.1rem; width: 0.12rem; height: 0.12rem; background: red; z-index: 9999;"></div>
								</c:when>
								<c:otherwise>
									<div id="${wholist.getUi().getUaccount()}a"
										style="display: none; float: left; border-radius: 50%; margin-top: -0.03rem; margin-left: -0.1rem; width: 0.12rem; height: 0.12rem; background: red; z-index: 9999;"></div>
								</c:otherwise>
							</c:choose>
							<div class="user-info"
								style="height: 0.48rem; float: left; margin-left: 0.12rem;">
								<span
									style="font-size: 0.16rem; float: left; font-weight: bolder; margin-top: 0.04rem;">${wholist.getUi().getNickname()}</span><br />
								<div id="Rtext"
									style="font-size: 0.12rem; color: #555; font-weight: lighter; float: left; margin-top: 0.02rem; pointer-events: none;">${wholist.getTime()}
								</div>
							</div>
							<div id="pTime"
								style="font-size: 0.12rem; color: #555; font-weight: lighter; float: right; margin-top: 0.047rem;">
								${wholist.getTtime()}</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="cell"
						onclick="toChatPage('${wholist.getUi().getUaccount()}')">
						<div style="width: 100%; height: 0.5rem;" id="${wholist.getUi().getUaccount()}t">
							<div
								style="width: 0.45rem; height: 0.45rem; float: left; border-radius: 50%; overflow: hidden;">
								<img
									src="${ctx}/images/user_headImage/${wholist.getUi().getHeadsrc()}"
									style="height: 0.45rem; width: 0.45rem; min-width: 10px; min-height: 10px;" />
							</div>
							<c:choose>
								<c:when test="${wholist.getPm().getIsRead()==0 && wholist.getPm().getpAccount()!=loginUser.getAccount()}">
									<div id="${wholist.getUi().getUaccount()}a"
										style="float: left; border-radius: 50%; margin-top: -0.03rem; margin-left: -0.1rem; width: 0.12rem; height: 0.12rem; background: red; z-index: 9999;"></div>
								</c:when>
								<c:otherwise>
									<div id="${wholist.getUi().getUaccount()}a"
										style="display: none; float: left; border-radius: 50%; margin-top: -0.03rem; margin-left: -0.1rem; width: 0.12rem; height: 0.12rem; background: red; z-index: 9999;"></div>
								</c:otherwise>
							</c:choose>
							<div class="user-info"
								style="height: 0.48rem; float: left; margin-left: 0.12rem;">
								<span
									style="font-size: 0.16rem; float: left; font-weight: bolder; margin-top: 0.04rem;">${wholist.getUi().getNickname()}</span><br />
								<div id="${wholist.getUi().getUaccount()}"
									style="font-size: 0.12rem; color: #555; font-weight: lighter; float: left; margin-top: 0.02rem; pointer-events: none;">${wholist.getTime()}
								</div>
							</div>
							<div id="pTime"
								style="font-size: 0.12rem; color: #555; font-weight: lighter; float: right; margin-top: 0.047rem;">
								${wholist.getTtime()}</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>


		</c:forEach>

	</div>

	<div class="footer">
		<div class="option" id="op1">

			<i class="fa fa-home"><img src="${ctx}/images/job1.gif"
				style="width: 0.3rem; margin-top: 0.02rem;" /></i>
			<div class="list0">任务大厅</div>

		</div>
		<div class="option" id="op2">
			<i class="fa fa-th-large"> <c:choose>
					<c:when test="${count>0}">
						<img src="${ctx}/images/msg4.png"
							style="width: 0.3rem; margin-top: 0.02rem;" id="img_msg" />
					</c:when>
					<c:otherwise>
						<img src="${ctx}/images/msg2.gif"
							style="width: 0.3rem; margin-top: 0.02rem;" id="img_msg" />
					</c:otherwise>
				</c:choose>
			</i>
			<div class="list1">消息</div>
		</div>
		<div class="option" id="op3">
			<i class="fa fa-list-ul"><img src="${ctx}/images/friend2.png"
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
				/*document.getElementById(json.pAccount).innerHTML = json.pContent
						.slice(0, 10)
						+ "...";
				console.log("有消息！");
				$("#img_msg").attr("src", "${ctx}/images/msg4.png");
				var id=json.pAccount+"a";
				var idt="#"+json.pAccount+"t";
				document.getElementById(id).style.display="block";
				$(idt).find("#pTime").html(12);*/
				 history.go(0);
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

		function toChatPage(a) {
			window.location.href = a + "/" + "2/3/chatPage.do";
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

		$("#func").click(function() {
			window.location.href = "jobRoom.do";
		})

		$("#toSearch").click(function() {
			window.location.href = "search.do";
		})
		$("#op1").click(function() {
			window.location.href = "index.do";
		});
		$("#op3").click(function() {
			window.location.href = "friend.do";
		});
		$("#op4").click(function() {
			window.location.href = "me.do";
		});
	</script>

	<script type="text/javascript">
		$("div[id=pTime]").each(function() {
			$(this).html(timestampFormat(Date.parse($(this).html()) / 1000));

		});

		//字符串转换为时间戳
		function getDateTimeStamp(dateStr) {
			return Date.parse(dateStr.replace(/-/gi, "/"));
		}

		function timestampFormat(timestamp) {
			function zeroize(num) {
				return (String(num).length == 1 ? '0' : '') + num;
			}

			var curTimestamp = parseInt(new Date().getTime() / 1000); //当前时间戳
			var timestampDiff = curTimestamp - timestamp; // 参数时间戳与当前时间戳相差秒数

			var curDate = new Date(curTimestamp * 1000); // 当前时间日期对象
			var tmDate = new Date(timestamp * 1000); // 参数时间戳转换成的日期对象

			var Y = tmDate.getFullYear(), m = tmDate.getMonth() + 1, d = tmDate
					.getDate();
			var H = tmDate.getHours(), i = tmDate.getMinutes(), s = tmDate
					.getSeconds();

			if (timestampDiff < 60) { // 一分钟以内
				return "刚刚";
			} else if (timestampDiff < 3600) { // 一小时前之内
				return Math.floor(timestampDiff / 60) + "分钟前";
			} else if (curDate.getFullYear() == Y
					&& curDate.getMonth() + 1 == m && curDate.getDate() == d) {
				return '今天' + zeroize(H) + ':' + zeroize(i);
			} else {
				var newDate = new Date((curTimestamp - 86400) * 1000); // 参数中的时间戳加一天转换成的日期对象
				if (newDate.getFullYear() == Y && newDate.getMonth() + 1 == m
						&& newDate.getDate() == d) {
					return '昨天' + zeroize(H) + ':' + zeroize(i);
				} else if (curDate.getFullYear() == Y) {
					return zeroize(m) + '月' + zeroize(d) + '日 ' + zeroize(H)
							+ ':' + zeroize(i);
				} else {
					return Y + '年' + zeroize(m) + '月' + zeroize(d) + '日 '
							+ zeroize(H) + ':' + zeroize(i);
				}
			}
		}
	</script>
</body>
</html>