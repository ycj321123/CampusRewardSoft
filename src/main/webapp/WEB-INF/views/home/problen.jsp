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
<title>问题反馈</title>
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
input[type="date"]::-webkit-clear-button {
	display: none;
}

input {
	width: 100%;
	height: 0.35rem;
	background-color: transparent;
	margin-bottom: 0.15rem;
	outline: none;
	border: none;
	border-bottom: 1px solid #ccc;
	font-size: 0.13rem;
}

.gcs-radio+label {
	width: 0.15rem;
	height: 0.15rem;
	line-height: 0.15rem;
	display: inline-block;
	text-align: center;
	vertical-align: bottom;
	border: 1px solid gray;
	border-radius: 50%;
}

.gcs-radio {
	display: none;
}

.gcs-radio+label:hover {
	border: 1px solid #2783FB;
	cursor: pointer;
}

.gcs-radio:checked+label {
	background: #2783FB;
	border: 1px solid #2783FB;
}

.deleteImg{
	float: right;
	color:#fff;
	background: #555;
	text-align: center;
	width: 0.17rem;
	height: 0.17rem;
	border-radius:0.5rem; 
	font-size: 0.15rem;
	margin-top: -0.85rem;
	margin-right: -0.05rem;
	line-height: 0.15rem;
	font-weight: lighter;
}
img{
float: left;
}
</style>
</head>
<body>
	<div class="header">
		<div class="top">
			<div class="address" onclick="tome();">&lt;</div>
			<div class="selects">
				<div class="selects_head">
					<span class='selected'>问题反馈 </span>
				</div>
			</div>
		</div>
	</div>

	<div class="content" style="margin-top: 0.44rem; padding-top: 0px;">
		<div class="cell"
			style="width: 100%; margin-top: 0.1rem; padding-top: 0.1rem; font-size: 0.18rem; color: #399aff;">
				问题内容描述：
				<textarea id="pContent" name="pContent" placeholder="问题描述..."
					style="resize: none; margin-top: 0.1rem; width: 98%; height: 1.5rem; margin-bottom: 0.15rem; font-size: 0.13rem;"></textarea>

		</div>
		<div id="pImage"
			style="float: left; width: 100%; margin-top: 0.15rem; background: #fff; padding-bottom: 0.1rem;">

			<div onclick="addinputFile()" id="pI"
				style="margin-left: 0.08rem; margin-top: 0.08rem; width: 0.8rem; height: 0.8rem; border:1px dashed #ccc; float: left;text-align: center; font-size: 0.5rem; font-weight: lighter;">
			+
			</div>
		</div>
		
		<div onclick="publishjob()" style="float:left; text-align:center; color:#fff; line-height:0.35rem; border-radius:0.5rem; margin-left:3%; background: #399aff; height:0.35rem; width: 94%; margin-top: 0.3rem;">提交</div>
	</div>
</body>

<script type="text/javascript">
	function tome() {
		window.location.href = "softSet.do";
	}

	function publishjob(){

		if($("#pContent").val().trim().length<=0){
			alert("问题描述不能为空！");
		}		
		else{
			var txt=$("#pContent").val();
			$.ajax({
				type : "POST",
				url : "problen.do",
				data : {txt:txt},
				dataType : "text",
				success : function(data) {
					console.log(data);
					alert("问题提交成功！");
					window.location.href="problen.do";
				},
				error : function(e) {
					alert("发布错误！！");
				}
			});		
		}
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

		alert_txt.style.top = (h / 8 * 2.5) + "px";
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
		if (page == 0) {
			codefans();
		}
		if (page == 4040) {
			codehide();
			$(".cell").css('pointer-events', '');
			return "";
		}
		if (page == 200) {
			if (document.getElementById("val").value.trim().length <= 0) {
				alert("不能为空！");
			} else {
				$("#tvalue").val($("#val").val());
				$("#tvalue").trigger("input");
				codehide();
				$(".cell").css('pointer-events', '');
				var val = document.getElementById("val").value + "";
				return val;
			}
		}
	}
</script>

</html>
