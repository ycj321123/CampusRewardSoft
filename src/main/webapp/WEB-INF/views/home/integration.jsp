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
<title>积分情况</title>
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
	
	background: #D8F2FF;
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
	padding-left: 0.1rem;
	padding-right: 0.1rem;
	background: white;
}

.content {
	margin-bottom: 0.5rem;
}

.selects {
	display: block;
	width: 80%;;
	height: 0.44rem;
	font-size: 0.16rem;
	color: #555;
	position: relative;
	margin: auto;
	padding: 0 0 0 0;
	line-height: 0.44rem;
}

.alert_txt {
	position: absolute;
	margin-left: 25%;
	border-radius: 20px;
	background: #339aff;
	text-align: center;
	font-size: 0.15rem;
	/*内容垂直居中*/
	display: -moz-box; /*兼容Firefox*/
	display: -webkit-box; /*兼容FSafari、Chrome*/
	-moz-box-align: center; /*兼容Firefox*/
	-webkit-box-align: center; /*兼容FSafari、Chrome */
	-moz-box-pack: center; /*兼容Firefox*/
	-webkit-box-pack: center; /*兼容FSafari、Chrome */
}

#val {
	outline: none;
	padding-left: 0.18rem;
	border: none;
}

.is_ok {
	width: 30%;
	background: #789101;
	padding: 0.05rem;
	border-radius: 15px;
	outline: none;
	border: none;
}
/*----------用来移除叉叉按钮----------*/
input[type="date"]::-webkit-clear-button{
   display:none;
}

</style>
</head>
<body>
	<div class="header">
		<div class="top">
			<div class="address" onclick="tome();">&lt;</div>
			<div class="selects">
				<div class="selects_head">
					<span class='selected'>积分查询 </span>
				</div>
			</div>
		</div>
	</div>

	<div class="content" style="margin-top: 0.44rem; padding-top: 0px;">
		<div class="cell"
			style="width: 100%;margin-top: 0.1rem;padding-bottom:0.1rem; padding-top:0.1rem; font-size: 0.18rem;color:#399aff;background: #FFF9E3;">
			你当前信誉积分为 : ${me.getCreditIntegral()}
			<c:choose>
			<c:when test="${me.getCreditIntegral()<100}"><span style="color:#30E177;">&nbsp;（未满）</span></c:when>
			<c:otherwise><span style="color:#30E177;">&nbsp;（已满）</span></c:otherwise>
			</c:choose>
		</div>
		
		<div class="cell"
			style="padding-bottom:0.1rem; padding-top:0.1rem; width: 100%;margin-top: 0.1rem; font-size: 0.18rem;">
			
			<c:choose>
			<c:when test="${me.getCreditIntegral()>95}"><div id="xinYuMsg">
				积分上限：当前信誉积分良好，请继续保持！
			</div></c:when>
			<c:when test="${me.getCreditIntegral()>80}"><div id="xinYuMsg">
				积分上限：当前信誉积分不高，快去接任务赚积分吧！
			</div></c:when>
			<c:when test="${me.getCreditIntegral()>70}"><div id="xinYuMsg">
				积分上限：当前信誉积分较差，有封号危险！
			</div></c:when>
			<c:otherwise><div id="xinYuMsg">
				积分上限：当前信誉积很差，若不提高积分将被永久封号！
			</div></c:otherwise>
			</c:choose>
			
		</div>
		<div class="cell"
			style="background: rgb(240, 240, 220);overflow: scroll;height:2.5rem; padding-bottom:0.1rem; padding-top:0.1rem; width:90%;margin-top: 0.15rem; margin-left:5%; font-size: 0.12rem; border-radius:15px;">
			信誉积分规则：<br/>
			<div style="margin-top: 0.1rem; line-height: 0.2rem;">
				1.每个用户的初始信誉积分为100积分上限，(您长期良好的表现还会获得"任务之王"的称号)。<br/>
				2.信誉积分在85-95之间，每天限制发任务5个和接任务5个。<br/>
				3.信誉积分在75-85之间，每天限制发任务1个和接任务1个。<br/>
				4.信誉积分低于75时，将禁止该用户登陆10天。<br/>
				5.信誉积分低于70时，将禁止该用户登陆1个月。<br/>
				6.信誉积分低于65时，该用户将被永就封号。<br/>
				7.用户每按时完成一个任务，信誉积分恢复1积分。<br/>
				8.用户超时完成任务，每超过一小时扣1个积分。<br/>
				9.用户发布有害健康任务，被举报通过时扣10积分，并删除该任务。<br/>
				10.用户被举报时，按情节严重度扣积分。
			</div>
		</div>
		<div style="padding-left:0.1rem; font-size: 0.12rem;margin-top: 0.2rem;">如有疑问，请联系客服微信询问：y1297815658 或致电给客服：<a href="tel:15627933457" class="call">15627933457</a>或<a href="tel:15625635396" class="call">15625635396</a></div>
	</div>
	
</body>

<script type="text/javascript">
	function tome() {
		window.location.href = "me.do";
	}		

</script>


<script>
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

	function codefans() {
		// 获取可见区域宽,高
		var h = document.body.clientHeight;
		var w = document.body.offsetWidth;

		alert_txt.style.top = (h /8 * 2.5) + "px";
		alert_txt.style.left = 0 + "px";
		alert_txt.style.padding = (h / 48) + "px";
		alert_txt.style.width = (w / 2) + "px";
		alert_txt.style.display = "";	
	}

	// 隐藏错误提示框
	function codehide() {
		alert_txt.style.display = "none";
	}
	//打开指定页面
	var isOpenPage = function(page) {
		if(page==0){
			codefans();
		}		
		if (page == 4040) {
			codehide();
			$(".cell").css('pointer-events', '');
			return "";
		} 
		if(page == 200){
			if (document.getElementById("val").value.trim().length <= 0) {
				alert("不能为空！");
			} else {
				$("#tvalue").val($("#val").val());
				$("#tvalue").trigger("input");
				codehide();
				$(".cell").css('pointer-events', '');
				var val=document.getElementById("val").value+"";				 
				return val;
			}
		}	
	}

</script>

</html>
