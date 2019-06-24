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
<title>零钱充值</title>
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
	input {
		font-size: 8px；
	}
}

input {
	background-color: transparent;
	border: none;
	outline: none;
	width: 80%;;
	height: 0.3rem;
	font-size: 0.25rem;
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
</style>
</head>
<body>
	<div class="header">
		<div class="top">
			<div class="address" onclick="tome();">&lt;</div>
			<div class="selects">
				<div class="selects_head">
					<span class='selected'>零钱充值</span>
				</div>
			</div>
		</div>
	</div>

	<div class="content" style="margin-top: 0.44rem; padding-top: 0px;">
		<div class="cell"
			style="height: 2.98rem; margin-left: 4%; padding-top: 0px; margin-top: 0.153rem; width: 92%; border-radius: 0.1rem;">
			<br /> 支付方式：
			<div class="cell"
				style="float: left; padding-left: 0.05rem; padding-right: 0.1rem; height: 0.52rem; font-size: 0.18rem; line-height: 0.52rem; border-bottom: 1px solid #ccc; width: 100%;">
				<div style="float: left;">微信</div>
				<div style="float: right;">
					<input type="radio" name="type"
						style="width: 0.2rem; margin-top: 0.12rem;" />
				</div>
			</div>
			<div class="cell"
				style="float: left; padding-left: 0.05rem; padding-right: 0.1rem; height: 0.52rem; font-size: 0.18rem; line-height: 0.52rem; border-bottom: 1px solid #ccc; width: 100%;">
				<div style="float: left;">支付宝</div>
				<div style="float: right;">
					<input type="radio" name="type"
						style="width: 0.2rem; margin-top: 0.12rem;" />
				</div>
			</div>
			<div class="cell"
				style="margin-top: 0.21rem; float: left; padding-left: 0.05rem; padding-right: 0.1rem; height: 0.52rem; font-size: 0.18rem; line-height: 0.52rem; border-bottom: 1px solid #ccc; width: 100%;">
				<div style="float: left; font-size: 0.35rem;">
					￥<input type="number" id="money">
				</div>
			</div>
			<a onclick="next()"
				style="float: left; width: 100%; text-align: center; margin-top: 0.15rem;"><button
					style="width: 50%; padding: 0.08rem; color: #fff; font-size: 0.18rem; background: #38CB04; border: none; outline: none;">充值</button></a>
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
		window.location.href = "myMoney.do";
	}

	function next() {
		var money = $("#money").val();

		if(money<=0) {
			alert("请输入正确金额");
			return;
		}
		else if(money>100000){
			alert("充值不能超过10万");
			return;
		}
		$.ajax({
			type : "POST",
			url : "addMoney.do",
			data : {money:money},
			dataType : "text",
			success : function(data) {
				window.location.href = "myMoney.do";
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
