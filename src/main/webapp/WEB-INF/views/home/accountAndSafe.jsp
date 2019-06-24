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
<title>账号与安全</title>
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
.alert_txt {
	position: absolute;
	margin-left: 25%;
	border-radius: 20px;
	background: #339aff;
	text-align: center;
	font-size: 0.15rem;
	margin-top:20%;
	/*内容垂直居中*/
	display: -moz-box; /*兼容Firefox*/
	display: -webkit-box; /*兼容FSafari、Chrome*/
	-moz-box-align: center; /*兼容Firefox*/
	-webkit-box-align: center; /*兼容FSafari、Chrome */
	-moz-box-pack: center; /*兼容Firefox*/
	-webkit-box-pack: center; /*兼容FSafari、Chrome */
}

.is_ok {
	width: 30%;
	background: #789101;
	padding: 0.05rem;
	border-radius: 15px;
	outline: none;
	border: none;
}
</style>
</head>
<body>
	<div class="header">
		<div class="top">
			<div class="address" onclick="tome();">&lt;</div>
			<div class="selects">
				<div class="selects_head">
					<span class='selected'>账号与安全</span>
				</div>
			</div>
		</div>
	</div>

	<div class="content" style="margin-top: 0.44rem; padding-top: 0px;">
		<div class="cell" id="cellAccount"
			style="height: 0.5rem; padding-top: 0px; margin-top: 0.1rem;">
			<div style="width: 100%;">
				<div
					style="margin-left: 0.1rem !important; font-size: 0.15rem; float: left; line-height: 0.5rem;">
					手机账号</div>
			</div>
			<div
				style="float: right; font-size: 0.13rem; color: #ccc; line-height: 0.5rem;">
				${user.getAccount()}
				<div style="float: right; font-size: 0.2rem;">&nbsp;&nbsp;></div>
			</div>
		</div>
		<div class="cell" id="cellEmail"
			style="height: 0.5rem; padding-top: 0px; margin-top: 0.1rem;">
			<div style="width: 100%;">
				<div
					style="margin-left: 0.1rem !important; font-size: 0.15rem; float: left; line-height: 0.5rem;">
					邮箱账号</div>
			</div>
			<div
				style="float: right; font-size: 0.13rem; color: #ccc; line-height: 0.5rem;">
				${user.getEmail()}
				<div style="float: right; font-size: 0.2rem;">&nbsp;&nbsp;></div>
			</div>
		</div>
		<div class="cell" id="cellPass"
			style="height: 0.5rem; padding-top: 0px; margin-top: 0.1rem;">
			<div style="width: 100%;">
				<div
					style="margin-left: 0.1rem !important; font-size: 0.15rem; float: left; line-height: 0.5rem;">
					修改密码</div>
			</div>
			<div
				style="float: right; font-size: 0.15rem; color: #ccc; line-height: 0.5rem;">
				<div style="float: right; font-size: 0.2rem;">&nbsp;&nbsp;></div>
			</div>

		</div>

	</div>
<div id="alert_txt" class="alert_txt" style="display: none;"></div>
	<sf:form action="" method="post" id="tf2">
		<input type="hidden" id="tkey" name="tkey">
		<input type="hidden" id="tvalue" onchange="ch_nickname();" name="tvalue">
	</sf:form>
</body>

<script type="text/javascript">
	function tome() {
		window.location.href = "softSet.do";
	}
	/*
	$("#tvalue").bind("input propertychange",function(){
		
		var form = new FormData(document.getElementById("tf2"));
		if(confirm("修改后将重新登陆，确认修改吗？")){
			$.ajax({
				type : "POST",
				url : "alterAccountPass.do",
				data : form,
				dataType : "text",
				processData : false,
				contentType : false,
				success : function(data) {
					console.log(data);
					if(data=="phoneError"){
						alert("账号已存在");
					}
					else if(data=="emailError"){
						alert("邮箱已存在");
					}
					else
						window.location.href="loginout.do";
				},
				error : function(e) {
					alert("错误！！");
				}
			});		
		}
		else{}
	});
	
	//点击手机账号
	$("#cellAccount").click(function(){
		$(".cell").css('pointer-events', 'none');
		
		alert_txt.innerHTML = "<br/><b>要修改手机号吗？</b><br/>"
			+ "<br/><input type='text' id='val' style='border-radius:0.5rem; width:80%; height: 0.2rem; font-size:0.1rem; border:none;' placeholder='输入手机号'> "
			+ "<br/><br/><button class='is_ok' style='float:left; margin-left:0.1rem; margin-bottom:0.1rem;' onclick='isOpenPage(200);'>ok</button>"
			+ "<button class='is_ok' style='float:right;margin-right:0.1rem;' onclick='isOpenPage(4040);'>no</button>";
			
			var key= $("#tkey").val("account");
		isOpenPage(0);	
	});
	//点击邮箱账号
	$("#cellEmail").click(function(){
		$(".cell").css('pointer-events', 'none');
		
		alert_txt.innerHTML = "<br/><b>要修改邮箱吗？</b><br/>"
			+ "<br/><input type='text' id='val' style='border-radius:0.5rem; width:80%; height: 0.2rem; font-size:0.1rem; border:none;' placeholder='输入邮箱'> "
			+ "<br/><br/><button class='is_ok' style='float:left; margin-left:0.1rem; margin-bottom:0.1rem;' onclick='isOpenPage(200);'>ok</button>"
			+ "<button class='is_ok' style='float:right;margin-right:0.1rem;' onclick='isOpenPage(4040);'>no</button>";
			
			var key= $("#tkey").val("email");
		isOpenPage(0);	
	});
	*/
	//点击邮箱账号
	$("#cellPass").click(function(){
		window.location.href="change_myPass.do";
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
		var my_phonereg = /^[1][3,4,5,7,8][0-9]{9}$/;
		var my_emailreg = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
		if(page==0){
			codefans();
		}		
		if (page == 4040) {
			codehide();
			$(".cell").css('pointer-events', '');
			return "";
		} 
		if(page == 200){
			
			if (!document.getElementById("val").value.match(my_phonereg)) {
				alert("手机号格式错误 ！");
			} else {
				$("#tvalue").val($("#val").val());
				$("#tvalue").trigger("input");
				codehide();
				$(".cell").css('pointer-events', '');
				var val=document.getElementById("val").value+"";				 
				return val;
			}
		}
		if(page == 201){
			
			if (!document.getElementById("val").value.match(my_emailreg)) {
				alert("邮箱格式错误 ！");
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
