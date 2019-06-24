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
<title>实名认证</title>
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
	background: rgb(240, 240, 220);
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
	width: 80%;
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

@media screen and (min-width: 240px) and (max-width: 319px) {
	input{font-size: 8px；}
}

input{
background-color:transparent; 
direction:rtl;
border:none; 
outline:none; 
height: 0.6rem;
width: 100%;
font-size: 0.15rem;
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
					<span class='selected'>实名认证 </span>
				</div>
			</div>
		</div>
	</div>

	<div class="content" style="margin-top: 0.44rem; padding-top: 0px;">
		<div class="cell"
			style="height: 1.6rem; padding-top: 0px; width: 100%;background: url('${ctx}/images/IDCard.png');background-size: 100% 100%;">
			
		</div>
		<div class="cell"
			style="height:2.98rem; margin-left:4%; padding-top: 0px; margin-top:-0.353rem; width: 92%; border-radius:0.1rem; ">
			
			<div class="cell" style="float:left;padding-left:0.05rem; padding-right:0.1rem; height:0.52rem; font-size:0.18rem; line-height:0.52rem; border-bottom:1px solid #ccc; width: 100%;">
				<div style=" float: left;">就读学校</div>
				<div style="float:right;">广州大学华软软件学院</div>
			</div>
			
			<div class="cell" style="width: 100%;float:left; padding-left:0.05rem; padding-right:0.1rem; height:0.615rem; font-size:0.18rem; line-height:0.615rem; border-bottom:1px solid #ccc;">
				真实姓名
				<div style="float:right;">
					<input id="realname" type="text" placeholder="请输入姓名" name="realname">
				</div>
			</div>
			
			<div class="cell" style="float:left;width:100%;padding-left:0.05rem; padding-right:0.1rem; height:0.615rem; font-size:0.18rem;line-height:0.615rem; border-bottom:1px solid #ccc;">
				<div style=" float: left;">身份证号</div>
				<div style="float:right;">
					<input id="idCard" type="text" placeholder="请输入身份证号" name="realname">
				</div>
			</div>
			
			<div class="cell" style="float:left;width:100%;padding-left:0.05rem; padding-right:0.1rem; height:0.615rem; font-size:0.18rem; line-height:0.615rem; border-bottom:1px solid #ccc;">
				<div style=" float: left;">性别</div>
				<div style=" float:right;">男</div>
			</div>
			
			<div class="cell" style="float:left;width:100%;padding-left:0.05rem; padding-right:0.1rem; height:0.615rem; font-size:0.18rem; line-height:0.615rem;">
				<div style="  float: left;">入学年份</div>
				<div style="float:right;">2015年</div>
			</div>	
			
						
		</div>		
		<c:choose>
			<c:when test="${idcard.getIsreal()==0}">
				<div onclick="next()" style="margin-left:4%; border-radius:0.5rem; width:92%; height:0.43rem; background:#ccc;margin-top:0.4rem; text-align: center; line-height: 0.43rem; font-size:0.18rem;color:#fff;pointer-events: none;">管理员审核中</div>
			</c:when>
			<c:otherwise>		
				<div onclick="next()" style="margin-left:4%; border-radius:0.5rem; width:92%; height:0.43rem; background:#30E177;margin-top:0.4rem; text-align: center; line-height: 0.43rem; font-size:0.18rem; color:#fff;">下一步</div>	
			</c:otherwise>
		</c:choose>
		<div class="cell" style="color:#555;margin-left:4%;width:92%; margin-top: 0.2rem; background: rgb(240, 240, 220);">
			1. 用户所上传的材料仅用于个人认证，其他用户不可查看。<br/>
			2. 学校名称，姓名、性别必须与学生证与身份证信息一致。 <br/>
			3. 一旦认证通过，以上信息再次修改，将取消认证状态，需用户自行提交认证申请重新进入审核流程。 <br/>
			4. 认证申请将在信息提交后一定时间工作日内审核完成。 <br/>
			5. 正在审核过程的用户无法重复提交材料审核，请认真对待每一次申请。<br/>
		</div>
	
	</div>
	<div id="alert_txt" class="alert_txt" style="display: none;"></div>
	<sf:form action="" method="post" id="tf">
		<input type="hidden" name="realnamevalue" id="realnamevalue">
		<input type="hidden" name="idcardvalue" id="idcardvalue">
	</sf:form>
</body>

<script type="text/javascript">
	function tome() {
		window.location.href = "me.do";
	}
	
	function next(){		
		$("#realnamevalue").val($("#realname").val());
		$("#idcardvalue").val($("#idCard").val());
		
		console.log("524"+$("#idcardvalue").val());
		var form = new FormData(document.getElementById("tf"));

		$.ajax({
			type : "POST",
			url : "my_IDCard.do",
			data :form,
			dataType : "text",
			processData : false,
			contentType : false,
			success : function(data) {
				console.log("ok");
				if(data=="error")
					alert("身份证号无效！");
				else
					window.location.href="my_IDCardTwo.do";
			},
			error : function(e) {
				alert("错误！！");
			}
		});
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
