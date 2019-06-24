<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jsp"%>
<!DOCTYPE html>
<html lang="en" >

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
  <div>
   
  </div>
  <div class="form" id="form1">
    <h2>登陆你的账号！</h2>
      <input type="text" placeholder="你的账号" name="account" value="${account}" id="account"/>
      <input type="password" placeholder="密码" name="pass" id="pass"/>
      <button onclick="SendOrLogin(this)">登陆</button>
    
  </div>
  <div class="cta"><a href="findPass.do" id="forgotPass">找回密码?</a></div>
</div>
  <script src="${ctx}/js/core/jquery.3.2.1.min.js"></script>
  <script>
 
  //点击按钮
  function SendOrLogin(a){
	  
	  if($(a).text().trim()=="登陆"){
		  
		  var my_phonereg = /^[1][3,4,5,7,8][0-9]{9}$/;
		  var my_emailreg = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
		  
		  if($("#account").val().trim().length<=0){
			  alert("账号格式错误");
			  return;
		  }
		  else{
			  var account=$("#account").val();
			  var pass=$("#pass").val();
			  $.ajax({
					type : "POST",
					url : "login.do",
					data :{account:account,pass:pass},
					dataType : "text",
					success : function(data) {
						if(data=="err"){
							alert("账号或密码错误");
						}
						else{
							window.location.href="index.do";
						}
					},
					error : function(e) {
						alert("登陆错误！！");
					}
				});
		  }
		 
	  }
	  else{
		  alert("错误");
	  }
  }
  </script>
</body>

</html>
