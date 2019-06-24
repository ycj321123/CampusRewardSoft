<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@include file="/common/common.jsp"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${ctx}/css/register_login_style.css" />
	<script type="text/javascript" src="${ctx}/js/jquery-3.3.1.js"></script>
<title>找回密码</title>
<style type="text/css">
.form_u {
	margin-top: 15% !important;
}

.form_u .input input {
	margin-top: 0% !important;
	border: none;
	width: 60% !important;
	font-size: 1rem !important;
	background: rgba(0, 0, 0, 0) !important;
}

.submit_btn {
	background: #5CACEE !important;
	margin-top: 15% !important;
}

.form_u .input .txt {
	width: 40%;
	color: #272727;
	float: right;
	text-align: right;
}

.form_u .input .txt a {
	border-radius: 4em;
	font-size: 0.8rem;
	padding: 0.3rem;
	background: #379AFF;
	color: #fff;
}

.info_tip {
	margin-left: 6%;
	width: 88%;
	font-size: 1.1rem;
	margin-top: 5%;
}

.tabBar {
	margin-top: 15%;
}

.navigationBar .title_bar {
	color: #000;
	float: left;
	margin-left: 6%;
	width: auto;
}
</style>
</head>
<body id="body">
	<!--导航栏 -->
	<div class="navigationBar">
		<a href="login.do" class="title_bar">×</a>
	</div>

	<!--主视图 -->
	<div class="mainView">
		<div style="margin-left: 6%; font-size: 1.7rem; padding-top: 3%;">
			<b>忘记密码？</b>
		</div>

		<!-- 错位信息提示框 -->
		<div id="alert_txt" class="alert_txt" style="display: none;">错位信息提示</div>
		<div class="info_tip">
			<b>请输入你登陆时的账号</b><br /> <b>验证码将发送到你注册的邮箱上</b>
		</div>
		<input type="hidden" id="result" value="${result}" name="result" />
		<!-- 表单 -->
		<div class="form_us">
			<sf:form action="forget_pass.do" method="post" class="form_u"
				onSubmit="return check_all2(this);" id="form1">
				<div class="input">
					<input type="text" placeholder="请填写手机号或邮箱"
						id="account" name="account" value="${account}" 
						style="width: 100% !important;"/>
				</div>
				<div class="input">
					<input type="text" placeholder="请输入验证码" id="testcode"
						name="testcode" value="${testcode}" /> <span class="txt"><a
						onclick="test()" id="getcode">获取验证码</a></span>
				</div>
				<input type="hidden" id="hid" value="${hid}" name="hid" />
				<input type="submit" value="下一步" class="submit_btn">
			</sf:form>
		</div>


	</div>
	<script type="text/javascript" src="${ctx}/js/login_redister.js"></script>
	<script type="text/javascript" src="${ctx}/js/app_softkey.js"></script>
	<script type="text/javascript">
	$(".title_bar").click(function(){
		localStorage.clear();		//清空本地数据
	});
		
	if(localStorage.getItem("temp")!=null)
	document.getElementById("getcode").innerHTML=localStorage.getItem("temp");
	
		//a标签样式设置
		var edit_a = function() {
			var second1 = 60;	//开始点击a按钮（60秒数）
			var a = document.getElementById("getcode");
			a.style.setProperty("pointer-events", "none");
			a.style.setProperty("background", "#ccc");
			//每秒执行一次（倒计时）
			var t = setInterval(function() {
				a.innerHTML = second1--;		//设置a倒计时秒数
				localStorage.clear();		//清空本地数据
				localStorage.setItem("temp",second1);	//存放到本地
			}, 1000);
		}
		
		//判断设置验证码按钮的值
		if(document.getElementById("hid").value=="123"&&document.getElementById("account").value.trim().length!=0){
			var a = document.getElementById("getcode");
			a.style.setProperty("pointer-events", "none");
			a.style.setProperty("background", "#ccc");
			var sec=localStorage.getItem("temp");		//获取本地保存的数据
			localStorage.clear();		//清空本地数据
			console.log(sec);
			var t = setInterval(function() {
				var t2=parseInt( new Date().getTime()/1000);
				a.innerHTML = sec--;
				//小于等于0时设置验证码a标签样式
				if (sec<= 0) {
					clearInterval(t);
					console.log("shi0ma "+(sec));
					a.style.setProperty("pointer-events", "auto");
					a.style.setProperty("background", "#379AFF");
					a.innerHTML = "重新获取";
					document.getElementById("hid").value = "er";
					
				}
			}, 1000);			
		}
		
		
		//验证码a标签单击时执行
		function test() {
			var form = document.getElementById("form1");
			var my_phonereg = /^[1][3,4,5,7,8][0-9]{9}$/;
			var my_emailreg = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
			// 检查帐号
			if (!(form.account.value.match(my_phonereg) || form.account.value
					.match(my_emailreg))) {
				alert_txt.innerHTML = "账号格式错误!";
				setTimeout("codefans()", 0);
				setTimeout("codehide()", 2000);
				return false;
			}
			document.getElementById("testcode").value = "";
			document.getElementById("hid").value = "123";
			edit_a();
			form.submit();
		}
		
		//若验证失败则显示提示
		if (document.getElementById("result").value.trim().length ==12) {
			alert_txt.innerHTML = document.getElementById("result").value;
			setTimeout("codefans()", 0);
			setTimeout("codehide()", 3000);
		}
	
		document.addEventListener('plusready', function() {
		    var webview = plus.webview.currentWebview();    
		    plus.key.addEventListener('backbutton', function() {
		        webview.canBack(function(e) {
		            if(e.canBack) {
		            	//返回上一历史页
		                //webview.back();	
		            	window.location.href="login.do";
		            } else {
		                webview.close(); //hide,quit
		                //plus.runtime.quit();
		            }
		        })
		    });
		});
	</script>
</body>
</html>