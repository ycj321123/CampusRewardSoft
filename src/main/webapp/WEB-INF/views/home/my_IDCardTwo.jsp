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
<title>上传身份证</title>
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
</style>
</head>
<body>
	<div class="header">
		<div class="top">
			<div class="address" onclick="tome();">&lt;</div>
			<div class="selects">
				<div class="selects_head">
					<span class='selected'>上传认证材料 </span>
				</div>
			</div>
		</div>
	</div>

	<div class="content" style="margin-top: 0.44rem; padding-top: 0px;">
		<div class="cell"
			style="height: 60px; width: 100%; padding-top: 0.1rem; background: #FFF9E3; color: #ECCD46;">
			用户所上传的材料仅用于个人认证，其他用户不可查看。</div>
		<div class="cell"
			style="color: #5F7386; margin-top: 0.1rem; padding-left: 0.25rem; background: rgb(240, 240, 220);">上传学生证正反面</div>
		<div class="cell"
			style="height: 1.5rem; margin-left: 4%; padding-top: 0px; margin-top: 0.07rem; width: 92%; border-radius: 0.1rem;">
			<div id="stuLeft" style="padding-top: 0.2rem; float: left;">
				<div id="stuLeftImg"
					style="width: 1.58rem; height: 0.85rem; float: left; overflow: hidden;">
					<img src="${ctx}/images/IDCard2.png"
						style="height: 0.85rem; width: 1.58rem; min-width: 10px; min-height: 10px;" />
				</div>
				<div
					style="width: 1.58rem; text-align: center; line-height: 0.4rem;">正面</div>
			</div>
			<div id="stuRight" style="padding-top: 0.2rem; float: right;">
				<div id="stuRightImg"
					style="width: 1.58rem; height: 0.85rem; float: right; overflow: hidden;">
					<img src="${ctx}/images/IDCard2.png"
						style="height: 0.85rem; width: 1.58rem; min-width: 10px; min-height: 10px;" />
				</div>
				<div
					style="width: 1.58rem; text-align: center; line-height: 0.4rem;">反面</div>
			</div>
		</div>
		<div class="cell"
			style="color: #5F7386; margin-top: 0.1rem; padding-left: 0.25rem; background: rgb(240, 240, 220);">上传身份证正反面</div>
		<div class="cell"
			style="height: 1.5rem; margin-left: 4%; padding-top: 0px; margin-top: 0.07rem; width: 92%; border-radius: 0.1rem;">
			<div id="idcardLeft" style="padding-top: 0.2rem; float: left;">
				<div id="idcardLeftImg"
					style="width: 1.58rem; height: 0.85rem; float: left; overflow: hidden;">
					<img src="${ctx}/images/IDCard2.png"
						style="height: 0.85rem; width: 1.58rem; min-width: 10px; min-height: 10px;" />
				</div>
				<div
					style="width: 1.58rem; text-align: center; line-height: 0.4rem;">正面</div>
			</div>
			<div id="idcardRight" style="padding-top: 0.2rem; float: right;">
				<div id="idcardRightImg"
					style="width: 1.58rem; height: 0.85rem; float: right; overflow: hidden;">
					<img src="${ctx}/images/IDCard2.png"
						style="height: 0.85rem; width: 1.58rem; min-width: 10px; min-height: 10px;" />
				</div>
				<div
					style="width: 1.58rem; text-align: center; line-height: 0.4rem;">反面</div>
			</div>
		</div>
		<div id="commit" onclick="commit()"
			style="margin-left: 4%; border-radius: 0.5rem; width: 92%; height: 0.43rem; background: #30E177; margin-top: 0.4rem; text-align: center; line-height: 0.43rem; font-size: 0.18rem; color: #fff;">提交认证
		</div>

	</div>
	<div id="alert_txt" class="alert_txt" style="display: none;"></div>
	<sf:form action="" method="post" id="tf">
		<input type="file" name="filename1" style="display: none;" id="up1"
			accept="image/*" onchange="picUpload1(this);">
		<input type="file" name="filename2" style="display: none;" id="up2"
			accept="image/*" onchange="picUpload2(this);">
		<input type="file" name="filename3" style="display: none;" id="up3"
			accept="image/*" onchange="picUpload3(this);">
		<input type="file" name="filename4" style="display: none;" id="up4"
			accept="image/*" onchange="picUpload4(this);">
	</sf:form>
</body>

<script type="text/javascript">
	function tome() {
		window.location.href = "my_IDCard.do";
	}

	//点击stu正面
	$("#stuLeftImg").click(function() {
		$("#up1").trigger('click'); //触发点击
	});

	//点击stu反面
	$("#stuRightImg").click(function() {
		$("#up2").trigger('click'); //触发点击
	});
	//点击idcard正面
	$("#idcardLeftImg").click(function() {
		$("#up3").trigger('click'); //触发点击
	});

	//点击idcard反面
	$("#idcardRightImg").click(function() {
		$("#up4").trigger('click'); //触发点击
	});

	//stu正面上传
	function picUpload1(a) {
		var me = $("#stuLeftImg");

		var img = new Image();
		var ViewWidth = $(me).width();
		var ViewHeight = $(me).height();
		var file = a.files[0];
		//var URL = URL || webkitURL;
		img.src = window.URL.createObjectURL(file);
		img.onload = function() {
			var imgMe = this, imgWidth = 0, imgHeight = 0, w = imgMe.width, h = imgMe.height, scale1 = w
					/ ViewWidth, scale2 = h / ViewHeight;
			imgWidth = parseInt(Math.floor(w / scale1));
			imgHeight = parseInt(Math.floor(h / scale2));
			var canvas = document.createElement('canvas');
			var img = document.createElement('img');
			$('#stuLeftImg').html(img);
			var ctx = canvas.getContext('2d');
			canvas.width = ViewWidth;
			canvas.height = ViewHeight;
			ctx.drawImage(imgMe, 0, 0, imgWidth, imgHeight);
			me.src = canvas.toDataURL('image/jpg');
			$(img).attr("src", me.src);
		};
	};
	//stu反面上传
	function picUpload2(a) {
		var me = $("#stuRightImg");

		var img = new Image();
		var ViewWidth = $(me).width();
		var ViewHeight = $(me).height();
		var file = a.files[0];
		//var URL = URL || webkitURL;
		img.src = window.URL.createObjectURL(file);
		img.onload = function() {
			var imgMe = this, imgWidth = 0, imgHeight = 0, w = imgMe.width, h = imgMe.height, scale1 = w
					/ ViewWidth, scale2 = h / ViewHeight;
			imgWidth = parseInt(Math.floor(w / scale1));
			imgHeight = parseInt(Math.floor(h / scale2));
			var canvas = document.createElement('canvas');
			var img = document.createElement('img');
			$('#stuRightImg').html(img);
			var ctx = canvas.getContext('2d');
			canvas.width = ViewWidth;
			canvas.height = ViewHeight;
			ctx.drawImage(imgMe, 0, 0, imgWidth, imgHeight);
			me.src = canvas.toDataURL('image/jpg');
			$(img).attr("src", me.src);
		};
	};
	//idcard正面上传
	function picUpload3(a) {
		var me = $("#idcardLeftImg");

		var img = new Image();
		var ViewWidth = $(me).width();
		var ViewHeight = $(me).height();
		var file = a.files[0];
		//var URL = URL || webkitURL;
		img.src = window.URL.createObjectURL(file);
		img.onload = function() {
			var imgMe = this, imgWidth = 0, imgHeight = 0, w = imgMe.width, h = imgMe.height, scale1 = w
					/ ViewWidth, scale2 = h / ViewHeight;
			imgWidth = parseInt(Math.floor(w / scale1));
			imgHeight = parseInt(Math.floor(h / scale2));
			var canvas = document.createElement('canvas');
			var img = document.createElement('img');
			$('#idcardLeftImg').html(img);
			var ctx = canvas.getContext('2d');
			canvas.width = ViewWidth;
			canvas.height = ViewHeight;
			ctx.drawImage(imgMe, 0, 0, imgWidth, imgHeight);
			me.src = canvas.toDataURL('image/jpg');
			$(img).attr("src", me.src);
		};
	};
	//idcard正面上传
	function picUpload4(a) {
		var me = $("#idcardRightImg");

		var img = new Image();
		var ViewWidth = $(me).width();
		var ViewHeight = $(me).height();
		var file = a.files[0];
		//var URL = URL || webkitURL;
		img.src = window.URL.createObjectURL(file);
		img.onload = function() {
			var imgMe = this, imgWidth = 0, imgHeight = 0, w = imgMe.width, h = imgMe.height, scale1 = w
					/ ViewWidth, scale2 = h / ViewHeight;
			imgWidth = parseInt(Math.floor(w / scale1));
			imgHeight = parseInt(Math.floor(h / scale2));
			var canvas = document.createElement('canvas');
			var img = document.createElement('img');
			$('#idcardRightImg').html(img);
			var ctx = canvas.getContext('2d');
			canvas.width = ViewWidth;
			canvas.height = ViewHeight;
			ctx.drawImage(imgMe, 0, 0, imgWidth, imgHeight);
			me.src = canvas.toDataURL('image/jpg');
			$(img).attr("src", me.src);
		};
	};
	var count = 0;
	function commit() {
		if (count >= 1) {
			$("#commit").css("pointer-events","none");
			alert("你已提交，不要重复点击!");
			return;
		} else {
			$("#realnamevalue").val($("#realname").val());
			$("#idcardvalue").val($("#idCard").val());

			console.log("524" + $("#idcardvalue").val());
			var form = new FormData(document.getElementById("tf"));

			//上传到后台
			var form = new FormData(document.getElementById("tf"));
			$.ajax({
				type : "POST",
				url : "my_IDCardTwo.do",
				data : form,
				dataType : "text",
				processData : false,
				contentType : false,
				success : function(data) {
					console.log("ok");
					if (data == "error")
						alert("材料不完整！");
					else {
						alert("提交成功！待管理员审核。");
						window.location.href = "me.do";
					}
				},
				error : function(e) {
					alert("错误！！");
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
