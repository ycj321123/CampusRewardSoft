<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>管理员登陆</title>

<link rel="stylesheet" href="${ctx}/css/style.css">
</head>

<body>


	<!-- Form Mixin-->
	<!-- Input Mixin-->
	<!-- Button Mixin-->
	<!-- Pen Title-->
	<div class="pen-title">
		<h1>管理员登陆</h1>
	</div>
	<!-- Form Module-->
	<div class="module form-module">
		<div></div>
		<div class="form" id="form1">
			<h2>输入你注册时的邮箱进行验证</h2>
			<input type='text' placeholder='你的邮箱' name='email' id="email" /> <input
				type='text' placeholder='验证码' name='testNo'
				style='width: 50%; float: left;' id="code" /> <input type='submit'
				onclick='Send(this)'
				style='background: #33B5E5; width: 40%; float: right;' value='发送' id="send"/>
			<button onclick='SendOrLo(this)' id="find">找回</button>

		</div>
		<div class="cta">
			<a href="login.do" id="forgotPass">返回登陆</a>
		</div>
	</div>
	<script src="${ctx}/js/core/jquery.3.2.1.min.js"></script>
	<script>
		var timeOut=false;

		//点击找回按钮
		function SendOrLo(a) {
			var my_emailreg = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
			if (!$("#email").val().match(my_emailreg)) {
				alert("邮箱格式错误");
			} else if ($("#code").val().trim().length != 6) {
				alert("验证码错误");
			} 
			else if(timeOut){alert("验证码无效");}
			else {
				var email=$("#email").val();
				var code=$("#code").val();
				$("#find").val("正在查找中...");
				$("#find").css("pointer-events", "none");
				$("#find").css("background", "#ccc");
				$.ajax({
					type : "POST",
					url : "findPass.do",
					data : {
						email : email,
						code:code
					},
					dataType : "text",
					success : function(data) {
						console.log("ok");
						if(data=="err"){			
							alert("账号不存在或验证码错误！");
						}
						else{
							alert("验证成功,你的密码为："+data+",请你保存好！");
						}
						
						$("#find").val("找回");
						$("#find").css("pointer-events", "");
						$("#find").css("background", "#33B5E5");
					},
					error : function(e) {
						alert("错误！！");
						$("#find").val("找回");
						$("#find").css("pointer-events", "");
						$("#find").css("background", "#33B5E5");
					}
				});
			}

		}

		//点击发送
		function Send(a) {
			var my_emailreg = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
			var email = $("#email").val();
			if (!$("#email").val().match(my_emailreg)) {
				alert("邮箱格式错误");
			} else {
				timeOut=false;
				var second1 = 60; //开始点击a按钮（60秒数）
				$("#send").val(second1);
				$("#send").css("pointer-events", "none");
				$("#send").css("background", "#ccc");
				//每秒执行一次（倒计时）
				var t = setInterval(function() {
					$("#send").val(--second1); //设置a倒计时秒数
					if (second1 <= 0) {
						$("#send").val("重新获取");
						$("#send").css("pointer-events", "");
						$("#send").css("background", "#33B5E5");
						timeOut=true;
						clearInterval(t);
					}
				}, 1000);
				
				$.ajax({
					type : "POST",
					url : "sendCode.do",
					data : {
						email : email
					},
					dataType : "text",
					success : function(data) {
						console.log("ok");
						if(data=="err"){			
							
						}
					},
					error : function(e) {
						alert("错误！！");
					}
				});
			}
		}
	</script>
</body>

</html>
