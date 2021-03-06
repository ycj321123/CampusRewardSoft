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
	margin-top: 1rem;
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

.footer>.option>.list0 {
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
			<div class="address" id="toSearch">
				<img src="${ctx}/images/search.gif"
					style="width: 0.25rem; margin-top: 0.08rem;" />
			</div>

			<div class="selects">
				<div class="selects_head">任务大厅</div>
				<!-- <span class='selected'>

									
					</span> <span
						style="font-size: 0.15rem;">v</span>
				</div>
				<div class="selects_other">
					<a href="javascript:" title="普通任务"> 普通任务 </a> <a href="javascript:"
						title="中等任务"> 中等任务 </a> <a href="javascript:" title="高级任务">
						高级任务 </a> 
				</div>-->
			</div>

			<div id="func"
				style="margin-top: -0.44rem; ! important; float: right; font-size: 0.4rem; color: #fff;">
				+</div>

		</div>

	</div>
	<div class="aa"
		style="position: fixed; height: 0.5rem; line-height: 0.5rem; top: 0.5rem; right: 0; background: #fff; left: 0;">
		<form action="index.do" method="post" id="test_form">
			<input type="hidden" id="jibie" name="level">
		</form>
		<div style="display: none;" id="hid">${jibie}</div>

		<span
			style="float: left; font-size: 0.18rem; width: 24.5%; text-align: center; border-right: 0.1px solid #ccc; background: #ccc;"
			onclick="kind(0)" id="kind0">其他</span> <span
			style="float: left; font-size: 0.18rem; width: 24.5%; text-align: center; border-right: 0.1px solid #ccc;"
			onclick="kind(1)" id="kind1">跑腿</span> <span
			style="float: left; font-size: 0.18rem; width: 24.5%; text-align: center; border-right: 0.1px solid #ccc;"
			onclick="kind(2)" id="kind2">快递</span> <span
			style="float: left; font-size: 0.18rem; width: 24.5%; text-align: center;"
			onclick="kind(3)" id="kind3">外卖</span>
	</div>

	<c:if test="${jtj!=null}">
		<div id="tui"
			style="position: fixed; top: 1.1rem; left: 0.5rem; right: 0.5rem; bottom: 1.1rem; background: #def;">
			<span style="float: right; padding: 0.1rem; background: red;"
				onclick="guan('${jtj.getPublish_job().getPId()}')">关闭</span>
			<div
				style="font-size: 0.18rem; width: 100%; padding: 0.1rem 0; text-align: center;">任务推荐</div>
			<div style="width: 100%;">
				<div
					style="width: 0.68rem; height: 0.68rem; border-radius: 50%; overflow: hidden; margin: 0.1rem auto;">
					<img
						src="${ctx}/images/user_headImage/${jtj.getUser_info().getHeadsrc()}"
						style="height: 0.67rem; width: 0.67rem; min-width: 10px; min-height: 10px;" />
				</div>
				<div style="text-align: center;font-size: 0.15rem;color:#339aff;"> ${jtj.getUser_info().getNickname()}</div>
			</div>
			
			<div onclick="jobpage(${jtj.getPublish_job().getPId()})" style="padding:0.1rem 0; border-radius:20px; margin:0 0.1rem; text-align: center;margin-top: 0.5rem; background: pink;"><b style="color: #A6A6A6; font-size: 0.16rem;">任务标题:</b> <span
						style="font-size: 0.15rem;">
						${jtj.getPublish_job().getpTitle()}</span></div>
		</div>
	</c:if>
	<div class="content">

		<c:forEach items="${pjsList}" var="pjsList">
			<div class="cell"
				onclick="jobpage(${pjsList.getPublish_job().getPId()})">

				<div style="width: 100%; height: 0.5rem;">
					<div
						style="width: 0.48rem; height: 0.48rem; float: left; border-radius: 50%; overflow: hidden;">
						<img
							src="${ctx}/images/user_headImage/${pjsList.getUser_info().getHeadsrc()}"
							style="height: 0.47rem; width: 0.47rem; min-width: 10px; min-height: 10px;" />
					</div>
					<div class="user-info"
						style="height: 0.48rem; float: left; margin-left: 0.12rem;">
						<span
							style="font-size: 0.15rem; float: left; width: 80%; margin-top: 0.04rem;">${pjsList.getUser_info().getNickname()}</span>
						<div id="pTime"
							style="font-size: 0.115rem; color: rgb(180, 154, 255); float: left; margin-top: 0.05rem;">${pjsList.getPublish_job().getpTime()}
						</div>
					</div>
					<div class="price"
						style="font-size: 0.16rem; color: #FFAA25; font-weight: bolder; float: right; margin-top: 0.11rem;">
						赏金：￥
						<c:choose>
							<c:when test="${pjsList.getPublish_job().getPrice()>=100000000}">
							${pjsList.getPublish_job().getPrice()/100000000}亿
						</c:when>
							<c:when test="${pjsList.getPublish_job().getPrice()>=10000000}">
							${pjsList.getPublish_job().getPrice()/10000000}千万
						</c:when>
							<c:when test="${pjsList.getPublish_job().getPrice()>=1000000}">
							${pjsList.getPublish_job().getPrice()/1000000}百万
						</c:when>

							<c:otherwise>${pjsList.getPublish_job().getPrice()}</c:otherwise>
						</c:choose>
					</div>
				</div>

				<div class="job_title"
					style="margin-top: 0.15rem; padding-bottom: 0.1rem;">
					<b style="color: #A6A6A6; font-size: 0.16rem;">任务标题:</b> <span
						style="font-size: 0.15rem;">
						${pjsList.getPublish_job().getpTitle()}</span>

				</div>
			</div>




		</c:forEach>




	</div>

	<div class="footer">
		<div class="option  shouye">

			<i class="fa fa-home"><img src="${ctx}/images/job2.gif"
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
	
	function guan(a){
		$.ajax({
			type : "POST",
			url : "guanTuiJian.do",
			data : {jobId:a},
			dataType : "text",
			success : function(data) {
				window.location.href="index.do";
			},
			error : function(e) {
				alert("错误！！");
			}
		});
	}
	
	function jobpage(a){
		console.log(a);
		window.location.href=a+"/"+"0/jobPage.do";
	}
	
	switch($(hid).text()){
			case "0":
				document.getElementById("kind0").style.background="#ccc"; 
				document.getElementById("kind1").style.background="#fff"; 
				document.getElementById("kind2").style.background="#fff"; 
				document.getElementById("kind3").style.background="#fff"; 
				break;
			case "1": 
				document.getElementById("kind0").style.background="#fff"; 
				document.getElementById("kind1").style.background="#ccc"; 
				document.getElementById("kind2").style.background="#fff"; 
				document.getElementById("kind3").style.background="#fff";
				break;
			case "2": 
				document.getElementById("kind0").style.background="#fff"; 
				document.getElementById("kind1").style.background="#fff"; 
				document.getElementById("kind2").style.background="#ccc"; 
				document.getElementById("kind3").style.background="#fff";
				break;
			case "3": 
				document.getElementById("kind0").style.background="#fff"; 
				document.getElementById("kind1").style.background="#fff"; 
				document.getElementById("kind2").style.background="#fff"; 
				document.getElementById("kind3").style.background="#ccc";
				break;
		}
	
	function kind(a) {
		var form = document.getElementById('test_form');
		document.getElementById("jibie").value=a;
		form.submit();
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
		
		//下来点击 
		$(".selects_other").children("a").click(
				function() {
					$(this).parents('.selects').find(".selected").text(
							$(this).attr("title"));
					$(".selects_other").hide();
					$("#level").val($(this).parents('.selects').find(".selected").text());
					$("#submit").trigger('click');
				})
		//头部点击 显示或隐藏下拉 
		$(".selects_head")
				.click(
						function() {
							if ($(this).parent().children(".selects_other")
									.css("display") == 'none') {
								$(this).parent().children(".selects_other")
										.show();
							} else {
								$(this).parent().children(".selects_other")
										.hide();								
							}
						})

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
		 
		$("#func").click(function(){
			window.location.href="jobRoom.do";
		})
		
		$("#toSearch").click(function(){
			window.location.href="search.do";
		})
		
		$("#op2").click(function(){
			window.location.href="msg.do";
		});
		$("#op3").click(function(){
			window.location.href="friend.do";		
				});
		$("#op4").click(function(){
			window.location.href="me.do";
		});
	</script>

	<script type="text/javascript">

//var time=document.getElementsByClassName("pTime");
	$("div[id=pTime]").each(function(){     
		$(this).html(getDateDiff($(this).html()));  
	});
	
	//$(".pTime").text(getDateDiff($(".pTime").text()));


//字符串转换为时间戳
function getDateTimeStamp (dateStr) {
    return Date.parse(dateStr.replace(/-/gi,"/"));
}

function getDateDiff (dateStr) {
    var publishTime = getDateTimeStamp(dateStr)/1000,
        d_seconds,
        d_minutes,
        d_hours,
        d_days,
        timeNow = parseInt(new Date().getTime()/1000),
        d,

        date = new Date(publishTime*1000),
        Y = date.getFullYear(),
        M = date.getMonth() + 1,
        D = date.getDate(),
        H = date.getHours(),
        m = date.getMinutes(),
        s = date.getSeconds();
        //小于10的在前面补0
        if (M < 10) {
            M = '0' + M;
        }
        if (D < 10) {
            D = '0' + D;
        }
        if (H < 10) {
            H = '0' + H;
        }
        if (m < 10) {
            m = '0' + m;
        }
        if (s < 10) {
            s = '0' + s;
        }

    d = timeNow - publishTime;
    d_days = parseInt(d/86400);
    d_hours = parseInt(d/3600);
    d_minutes = parseInt(d/60);
    d_seconds = parseInt(d);

    if(d_days > 0 && d_days < 3){
        return d_days + '天前';
    }else if(d_days <= 0 && d_hours > 0){
        return d_hours + '小时前';
    }else if(d_hours <= 0 && d_minutes > 0){
        return d_minutes + '分钟前';
    }else if (d_seconds < 60) {
        if (d_seconds <= 0) {
            return '刚刚发表';
        }else {
            return d_seconds + '秒前';
        }
    }else if (d_days >= 3 && d_days < 30){
        return M + '-' + D;
    }else if (d_days >= 30) {
        return Y + '-' + M + '-' + D ;
    }
}
</script>
</body>
</html>