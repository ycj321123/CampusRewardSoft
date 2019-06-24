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
<title>我的资料</title>
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
					<span class='selected'>我的资料 </span>
				</div>
			</div>
		</div>
	</div>

	<div class="content" style="margin-top: 0.44rem; padding-top: 0px;">
		<div class="cell"
			style="height: 0.5rem; padding-top: 0px; margin-top: 0.1rem"
			id="cellImage">
			<div
				style="margin-left: 0.1rem !important; font-size: 0.16rem; float: left; line-height: 0.5rem;">
				头像</div>
			<div
				style="float: right; font-size: 0.16rem; font-weight: lighter; color: #ccc; line-height: 0.5rem;">

				<c:choose>
					<c:when test="${user_info.getHeadsrc()!=null}">
						<div id="myImage"
							style="width: 0.3rem; height: 0.3rem; float: left; border-radius: 50%; overflow: hidden; margin-top: 0.1rem;">
							<img src="${ctx}/images/user_headImage/${user_info.getHeadsrc()}"
								style="height: 0.3rem; width: 0.3rem; min-width: 10px; min-height: 10px;" />

						</div>
					</c:when>
					<c:otherwise>
						<div id="myImage"
							style="width: 0.3rem; height: 0.3rem; float: left; border-radius: 50%; overflow: hidden; margin-top: 0.1rem;">
							<img src="${ctx}/images/user_headImage/20190131152230643.jpg"
								style="height: 0.3rem; width: 0.3rem; min-width: 10px; min-height: 10px;" />
						</div>
					</c:otherwise>
				</c:choose>
				<div style="float: right; font-size: 0.2rem;">&nbsp;&nbsp;></div>
			</div>
		</div>

		<div class="cell"
			style="height: 0.4rem; padding-top: 0px; border-bottom: 1px solid #ccc; margin-top: 0.1rem;">
			<div style="width: 100%;">
				<div
					style="margin-left: 0.1rem !important; font-size: 0.12rem; float: left; color: #399aff; line-height: 0.4rem;">
					基本资料</div>
			</div>
		</div>

		<div class="cell"
			style="height: 0.5rem; padding-top: 0px; border-bottom: 1px solid #ccc;"
			id="cellrealname">
			<div style="width: 100%;">
				<div
					style="margin-left: 0.1rem !important; font-size: 0.16rem; float: left; line-height: 0.5rem;">
					真实姓名</div>
			</div>
			<div
				style="float: right; font-size: 0.16rem; font-weight: lighter; color: #ccc; line-height: 0.5rem;">
				<c:choose>
					<c:when test="${user_info.getRealname()!=null}">${user_info.getRealname()}</c:when>
					<c:otherwise>去实名</c:otherwise>
				</c:choose>
				<div style="float: right; font-size: 0.2rem;">&nbsp;&nbsp;></div>
			</div>
		</div>

		<div class="cell"
			style="height: 0.5rem; padding-top: 0px; border-bottom: 1px solid #ccc;"
			id="cellnickname">
			<div style="width: 100%;">
				<div
					style="margin-left: 0.1rem !important; font-size: 0.16rem; float: left; line-height: 0.5rem;">
					昵称</div>
			</div>
			<div
				style="float: right; font-size: 0.16rem; font-weight: lighter; color: #ccc; line-height: 0.5rem;">${user_info.getNickname()}
				<div style="float: right; font-size: 0.2rem;">&nbsp;&nbsp;></div>
			</div>

		</div>

		<div class="cell"
			style="height: 0.5rem; padding-top: 0px; border-bottom: 1px solid #ccc;" id="cellsex">
			<div style="width: 100%;">
				<div
					style="margin-left: 0.1rem !important; font-size: 0.16rem; float: left; line-height: 0.5rem;">
					性别</div>
			</div>
			<div
				style="float: right; font-size: 0.16rem; font-weight: lighter; color: #ccc; line-height: 0.5rem;">
				<c:choose>
					<c:when test="${user_info.getSex()==1}">女</c:when>
					<c:otherwise>男</c:otherwise>
				</c:choose>
				<div style="float: right; font-size: 0.2rem;">&nbsp;&nbsp;></div>
			</div>

		</div>

		<div class="cell" id="cellbirthday"
			style="height: 0.5rem; padding-top: 0px; border-bottom: 1px solid #ccc;">
			<div style="width: 100%;">
				<div
					style="margin-left: 0.1rem !important; font-size: 0.16rem; float: left; line-height: 0.5rem;">
					生日</div>
			</div>
			<div
				style="float: right; font-size: 0.16rem; font-weight: lighter; color: #ccc; line-height: 0.5rem;">
				<c:choose>
					<c:when test="${user_info.getBirthday()!=null}">${user_info.getBirthday()}</c:when>
					<c:otherwise>(没填写)</c:otherwise>
				</c:choose>
				<div style="float: right; font-size: 0.2rem;">&nbsp;&nbsp;></div>
			</div>

		</div>

		<div class="cell" id="celladdr"
			style="height: 0.5rem; padding-top: 0px; border-bottom: 1px solid #ccc;">
			<div style="width: 100%;">
				<div
					style="margin-left: 0.1rem !important; font-size: 0.16rem; float: left; line-height: 0.5rem;">
					所在地</div>
			</div>
			<div
				style="float: right; font-size: 0.16rem; font-weight: lighter; color: #ccc; line-height: 0.5rem;">
				<c:choose>
					<c:when test="${user_info.getAddr()!=null}">${user_info.getAddr()}</c:when>
					<c:otherwise>(没填写)</c:otherwise>
				</c:choose>
				<div style="float: right; font-size: 0.2rem;">&nbsp;&nbsp;></div>
			</div>

		</div>

		<div class="cell"
			style="height: 0.4rem; padding-top: 0px; border-bottom: 1px solid #ccc; margin-top: 0.1rem;">
			<div style="width: 100%;">
				<div
					style="margin-left: 0.1rem !important; font-size: 0.12rem; float: left; color: #399aff; line-height: 0.4rem;">
					学籍资料</div>
			</div>
		</div>

		<div class="cell" id="cellschool"
			style="height: 0.5rem; padding-top: 0px; border-bottom: 1px solid #ccc;">
			<div style="width: 100%;">
				<div
					style="margin-left: 0.1rem !important; font-size: 0.16rem; float: left; line-height: 0.5rem;">
					学校</div>
			</div>
			<div
				style="float: right; font-size: 0.16rem; font-weight: lighter; color: #ccc; line-height: 0.5rem;">
				<c:choose>
					<c:when test="${stdent_status.getSchoolName()!=null}">${stdent_status.getSchoolName()}</c:when>
					<c:otherwise>(没填写)</c:otherwise>
				</c:choose>
				<div style="float: right; font-size: 0.2rem;">&nbsp;&nbsp;></div>
			</div>

		</div>

		<div class="cell" id="cellyuanxi"
			style="height: 0.5rem; padding-top: 0px; border-bottom: 1px solid #ccc;">
			<div style="width: 100%;">
				<div
					style="margin-left: 0.1rem !important; font-size: 0.16rem; float: left; line-height: 0.5rem;">
					院系</div>
			</div>
			<div
				style="float: right; font-size: 0.16rem; font-weight: lighter; color: #ccc; line-height: 0.5rem;">
				<c:choose>
					<c:when test="${stdent_status.getYuanXi()!=null}">${stdent_status.getYuanXi()}</c:when>
					<c:otherwise>(没填写)</c:otherwise>
				</c:choose>
				<div style="float: right; font-size: 0.2rem;">&nbsp;&nbsp;></div>
			</div>

		</div>

		<div class="cell" id="cellzhuanye"
			style="height: 0.5rem; padding-top: 0px; border-bottom: 1px solid #ccc;">
			<div style="width: 100%;">
				<div
					style="margin-left: 0.1rem !important; font-size: 0.16rem; float: left; line-height: 0.5rem;">
					专业</div>
			</div>
			<div
				style="float: right; font-size: 0.16rem; font-weight: lighter; color: #ccc; line-height: 0.5rem;">
				<c:choose>
					<c:when test="${stdent_status.getZhuanYe()!=null}">${stdent_status.getZhuanYe()}</c:when>
					<c:otherwise>(没填写)</c:otherwise>
				</c:choose>
				<div style="float: right; font-size: 0.2rem;">&nbsp;&nbsp;></div>
			</div>

		</div>

		<div class="cell" id="cellxueli"
			style="height: 0.5rem; padding-top: 0px; border-bottom: 1px solid #ccc;">
			<div style="width: 100%;">
				<div
					style="margin-left: 0.1rem !important; font-size: 0.16rem; float: left; line-height: 0.5rem;">
					学历</div>
			</div>
			<div
				style="float: right; font-size: 0.16rem; font-weight: lighter; color: #ccc; line-height: 0.5rem;">
				<c:choose>
					<c:when test="${stdent_status.getXueLi()!=null}">${stdent_status.getXueLi()}</c:when>
					<c:otherwise>本科/大专</c:otherwise>
				</c:choose>
				<div style="float: right; font-size: 0.2rem;">&nbsp;&nbsp;></div>
			</div>

		</div>

		<div class="cell" id="cellruxueyear" style="height: 0.5rem; padding-top: 0px;">
			<div style="width: 100%;">
				<div
					style="margin-left: 0.1rem !important; font-size: 0.16rem; float: left; line-height: 0.5rem;">
					入学年份</div>
			</div>
			<div
				style="float: right; font-size: 0.16rem; font-weight: lighter; color: #ccc; line-height: 0.5rem;">
				<c:choose>
					<c:when test="${stdent_status.getRuxueYear()!=null}">${stdent_status.getRuxueYear()}</c:when>
					<c:otherwise>(没填写)</c:otherwise>
				</c:choose>
				<div style="float: right; font-size: 0.2rem;">&nbsp;&nbsp;></div>
			</div>

		</div>
	</div>
	<div id="alert_txt" class="alert_txt" style="display: none;"></div>
	<sf:form action="" method="post" enctype="multipart/form-data" id="tf">
		<input type="file" name="file" class="upload" value=""
			accept="image/*" multiple="" style="display: none;"
			onchange="picUpload(this);">
	</sf:form>
	<sf:form action="" method="post" id="tf2">
		<input type="hidden" id="tkey" name="tkey">
		<input type="hidden" id="tvalue" onchange="ch_nickname();" name="tvalue">
	</sf:form>
</body>

<script type="text/javascript">
	function tome() {
		window.location.href = "me.do";
	}

	//点击头像
	$("#cellImage").click(function() {
		$(".upload").trigger('click');	//触发点击
	});

	//头像上传
	function picUpload(a) {
		var me = $("#myImage");

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
			$('#myImage').html(img);
			var ctx = canvas.getContext('2d');
			canvas.width = ViewWidth;
			canvas.height = ViewHeight;
			ctx.drawImage(imgMe, 0, 0, imgWidth, imgHeight);
			me.src = canvas.toDataURL('image/jpg');
			$(img).attr("src", me.src);
		};

		//上传到后台
		var form = new FormData(document.getElementById("tf"));
		$.ajax({
			type : "POST",
			url : "my_info.do",
			data : form,
			dataType : "text",
			processData : false,
			contentType : false,
			success : function(data) {
				console.log("ok");
			},
			error : function(e) {
				alert("错误！！");
			}
		});
	};

	$("#tvalue").bind("input propertychange",function(){
		console.log("改变了："+ $("#tvalue").val());
		var form = new FormData(document.getElementById("tf2"));
		$.ajax({
			type : "POST",
			url : "changInfo.do",
			data : form,
			dataType : "text",
			processData : false,
			contentType : false,
			success : function(data) {
				console.log(data);
				if(data=="error"){
					alert("没有该学校！");
				}
				else window.location.href="my_info.do";
			},
			error : function(e) {
				alert("错误！！");
			}
		});		
	});
	
	//点击真实姓名
	$("#cellrealname").click(function() {
		alert("不可修改！");
	});

	//点击昵称
	$("#cellnickname").click(function() {
		$(".cell").css('pointer-events', 'none');
		
		alert_txt.innerHTML = "<b>要修改昵称吗？</b><br/>昵称不能超过6个字<br/>"
			+ "<br/> <input type='text' id='val' style='border-radius:0.5rem; width:80%; height: 0.2rem; font-size:0.1rem;' placeholder='输入昵称' maxlength='6'>"
			+ "<br/><br/><button class='is_ok' style='float:left; margin-left:0.1rem;' onclick='isOpenPage(200);'>ok</button>"
			+ "<button class='is_ok' style='float:right;margin-right:0.1rem;' onclick='isOpenPage(4040);'>no</button>";
		var key= $("#tkey").val("nickname");
		isOpenPage(0);		
	});
	
	//点击性别
	$("#cellsex").click(function() {
		$(".cell").css('pointer-events', 'none');
		
		alert_txt.innerHTML = "<b>要换性别吗？</b><br/>"
			+ "<br/> <input id='man' type='radio' checked='checked' name='sex' value='0' style='width:0.2rem; height: 0.2rem;margin-right:0.1rem;'/>男"
			+"<input id='woman' type='radio' name='sex' value='1'style='width:0.2rem; height: 0.2rem; margin-left:0.1rem;'/>女"
			+ "<br/><br/><button class='is_ok' style='float:left; width:0.4rem' onclick='isOpenPage(201);'>ok</button>"
			+ "<button class='is_ok' style='float:right;width:0.4rem;' onclick='isOpenPage(4040);'>no</button>";
		 
			var key= $("#tkey").val("sex");
		isOpenPage(0);		
	});
	
	//点击生日
	$("#cellbirthday").click(function(){
		$(".cell").css('pointer-events', 'none');
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var day = date.getDate();
		if (month < 10) month = "0" + month;
		if (day < 10) day = "0" + day;
		var nowDate = year + "-" + month + "-" + day;
		
		alert_txt.innerHTML = "<b>要修改生日吗？</b><br/>点下面框选择吧！<br/>"
			+ "<br/> <input type='date' id='val' style='border-radius:0.5rem; width:80%; height: 0.2rem; font-size:0.1rem;'"
			+" value='"+nowDate+"' max='"+nowDate+"' min='1900-01-01'/>"
			+ "<br/><br/><button class='is_ok' style='float:left; margin-left:0.1rem;' onclick='isOpenPage(200);'>ok</button>"
			+ "<button class='is_ok' style='float:right;margin-right:0.1rem;' onclick='isOpenPage(4040);'>no</button>";
		
			var key= $("#tkey").val("birthday");
		isOpenPage(0);	
	});
	
	//点击所在地
	$("#celladdr").click(function(){
		$(".cell").css('pointer-events', 'none');
		
		alert_txt.innerHTML = "<b>要换地方吗？</b><br/>填写学校吧！<br/>"
			+ "<br/><select id='province' onchange='getCity()' style='width:0.6rem;font-size:0.1rem;'></select> "
			+ "<select id='city' style='width:0.6rem;font-size:0.1rem;'> </select> "
			+ "<br/><br/><button class='is_ok' style='float:left; margin-left:0.1rem;' onclick='isOpenPage(202);'>ok</button>"
			+ "<button class='is_ok' style='float:right;margin-right:0.1rem;' onclick='isOpenPage(4040);'>no</button>";
			init();	
			
			var key= $("#tkey").val("addr");
		isOpenPage(0);	
	});
	
	//学校点击
	$("#cellschool").click(function(){
		/*$(".cell").css('pointer-events', 'none');
		
		alert_txt.innerHTML = "<b>要更改学校吗？</b><br/>要就填写学校吧！<br/>"
			+ "<br/><input type='text' id='val' style='border-radius:0.5rem; width:80%; height: 0.2rem; font-size:0.1rem;' placeholder='输入学校'> "
			+ "<br/><br/><button class='is_ok' style='float:left; margin-left:0.1rem;' onclick='isOpenPage(200);'>ok</button>"
			+ "<button class='is_ok' style='float:right;margin-right:0.1rem;' onclick='isOpenPage(4040);'>no</button>";
			
			var key= $("#tkey").val("school");
		isOpenPage(0);	*/
		alert("不可修改");
	});
	
	//点击院系
	$("#cellyuanxi").click(function(){
		$(".cell").css('pointer-events', 'none');
		
		alert_txt.innerHTML = "<b>要修改院系吗？</b><br/>要就输入吧！<br/>"
			+ "<br/><input type='text' id='val' style='border-radius:0.5rem; width:80%; height: 0.2rem; font-size:0.1rem;' placeholder='输入院系'> "
			+ "<br/><br/><button class='is_ok' style='float:left; margin-left:0.1rem;' onclick='isOpenPage(200);'>ok</button>"
			+ "<button class='is_ok' style='float:right;margin-right:0.1rem;' onclick='isOpenPage(4040);'>no</button>";
			
			var key= $("#tkey").val("yuanxi");
		isOpenPage(0);	
	});
	
	//点击专业
	$("#cellzhuanye").click(function(){
		$(".cell").css('pointer-events', 'none');
		
		alert_txt.innerHTML = "<b>要修改专业吗？</b><br/>要就输入吧！<br/>"
			+ "<br/><input type='text' id='val' style='border-radius:0.5rem; width:80%; height: 0.2rem; font-size:0.1rem;' placeholder='输入专业'> "
			+ "<br/><br/><button class='is_ok' style='float:left; margin-left:0.1rem;' onclick='isOpenPage(200);'>ok</button>"
			+ "<button class='is_ok' style='float:right;margin-right:0.1rem;' onclick='isOpenPage(4040);'>no</button>";
			
			var key= $("#tkey").val("zhuanye");
		isOpenPage(0);	
	});
	
	//点击学历
	$("#cellxueli").click(function(){
		$(".cell").css('pointer-events', 'none');
		
		alert_txt.innerHTML = "<b>选学历吗？</b><br/>"
			+ "<br/> <select id='xueli' style='width:0.9rem;font-size:0.1rem;'>"
			+"<option>本科/大专</option><option>研究生</option></select>"
			+ "<br/><br/><button class='is_ok' style='float:left; width:0.4rem' onclick='isOpenPage(203);'>ok</button>"
			+ "<button class='is_ok' style='float:right;width:0.4rem;' onclick='isOpenPage(4040);'>no</button>";
			var key= $("#tkey").val("xueli");
		isOpenPage(0);	
	});
	
	//点击入学年份
	$("#cellruxueyear").click(function(){
		$(".cell").css('pointer-events', 'none');
		
		alert_txt.innerHTML = "<b>选择入学年份</b><br/>"
			+ "<br/> <select id='year' style='width:0.8rem;font-size:0.1rem;'></select>"
			+ "<br/><br/><button class='is_ok' style='float:left; width:0.4rem' onclick='isOpenPage(204);'>ok</button>"
			+ "<button class='is_ok' style='float:right;width:0.4rem;' onclick='isOpenPage(4040);'>no</button>";
			var key= $("#tkey").val("ruxueyear");
			year();
		isOpenPage(0);	
	});
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
		if(page == 201){
			var Sex = $('input:radio:checked').val();
			
			if(Sex==0) $("#tvalue").val("男");
			else $("#tvalue").val("女");
			$("#tvalue").trigger("input");
			codehide();
			$(".cell").css('pointer-events', '');			 
			return Sex;
		}
		if(page == 202){	//设置地址的值
			var province=$("#province").val();  //获取Select选择的Value 
			var city=$("#city").val();  //获取Select选择的Value 
			
			var addr=province+" "+city;
			$("#tvalue").val(addr);
			$("#tvalue").trigger("input");
			codehide();
			$(".cell").css('pointer-events', '');			 
			return addr;
		}
		if(page == 203){	//设置学历的值
			var xueli=$("#xueli").val();  //获取Select选择的Value 
			$("#tvalue").val(xueli);
			$("#tvalue").trigger("input");
			codehide();
			$(".cell").css('pointer-events', '');			 
			return xueli;
		}
		if(page == 204){	//设置学历的值
			var year=$("#year").val();  //获取Select选择的Value 
			$("#tvalue").val(year);
			$("#tvalue").trigger("input");
			codehide();
			$(".cell").css('pointer-events', '');			 
			return xueli;
		}
	}

</script>

<script> 
var arr = new  Array();
var pre= new  Array() ;
arr[0 ]="东城,西城,崇文,宣武,朝阳,丰台,石景山,海淀,门头沟,房山,通州,顺义,昌平,大兴,平谷,怀柔,密云,延庆" ;
arr[1 ]="黄浦,卢湾,徐汇,长宁,静安,普陀,闸北,虹口,杨浦,闵行,宝山,嘉定,浦东,金山,松江,青浦,南汇,奉贤,崇明" ;
arr[2 ]="和平,东丽,河东,西青,河西,津南,南开,北辰,河北,武清,红挢,塘沽,汉沽,大港,宁河,静海,宝坻,蓟县" ;
arr[3 ]="万州,涪陵,渝中,大渡口,江北,沙坪坝,九龙坡,南岸,北碚,万盛,双挢,渝北,巴南,黔江,长寿,綦江,潼南,铜梁,大足,荣昌,壁山,梁平,城口,丰都,垫江,武隆,忠县,开县,云阳,奉节,巫山,巫溪,石柱,秀山,酉阳,彭水,江津,合川,永川,南川" ;
arr[4 ]="石家庄,邯郸,邢台,保定,张家口,承德,廊坊,唐山,秦皇岛,沧州,衡水" ;
arr[5 ]="太原,大同,阳泉,长治,晋城,朔州,吕梁,忻州,晋中,临汾,运城" ;
arr[6 ]="呼和浩特,包头,乌海,赤峰,呼伦贝尔盟,阿拉善盟,哲里木盟,兴安盟,乌兰察布盟,锡林郭勒盟,巴彦淖尔盟,伊克昭盟" ;
arr[7 ]="沈阳,大连,鞍山,抚顺,本溪,丹东,锦州,营口,阜新,辽阳,盘锦,铁岭,朝阳,葫芦岛" ;
arr[8 ]="长春,吉林,四平,辽源,通化,白山,松原,白城,延边" ;
arr[9 ]="哈尔滨,齐齐哈尔,牡丹江,佳木斯,大庆,绥化,鹤岗,鸡西,黑河,双鸭山,伊春,七台河,大兴安岭" ;
arr[10 ]="南京,镇江,苏州,南通,扬州,盐城,徐州,连云港,常州,无锡,宿迁,泰州,淮安" ;
arr[11 ]="杭州,宁波,温州,嘉兴,湖州,绍兴,金华,衢州,舟山,台州,丽水" ;
arr[12 ]="合肥,芜湖,蚌埠,马鞍山,淮北,铜陵,安庆,黄山,滁州,宿州,池州,淮南,巢湖,阜阳,六安,宣城,亳州" ;
arr[13 ]="福州,厦门,莆田,三明,泉州,漳州,南平,龙岩,宁德" ;
arr[14 ]="南昌市,景德镇,九江,鹰潭,萍乡,新馀,赣州,吉安,宜春,抚州,上饶" ;
arr[15 ]="济南,青岛,淄博,枣庄,东营,烟台,潍坊,济宁,泰安,威海,日照,莱芜,临沂,德州,聊城,滨州,菏泽" ;
arr[16 ]="郑州,开封,洛阳,平顶山,安阳,鹤壁,新乡,焦作,濮阳,许昌,漯河,三门峡,南阳,商丘,信阳,周口,驻马店,济源" ;
arr[17 ]="武汉,宜昌,荆州,襄樊,黄石,荆门,黄冈,十堰,恩施,潜江,天门,仙桃,随州,咸宁,孝感,鄂州" ;
arr[18 ]="长沙,常德,株洲,湘潭,衡阳,岳阳,邵阳,益阳,娄底,怀化,郴州,永州,湘西,张家界" ;
arr[19 ]="广州,深圳,珠海,汕头,东莞,中山,佛山,韶关,江门,湛江,茂名,肇庆,惠州,梅州,汕尾,河源,阳江,清远,潮州,揭阳,云浮" ;
arr[20 ]="南宁,柳州,桂林,梧州,北海,防城港,钦州,贵港,玉林,南宁地区,柳州地区,贺州,百色,河池" ;
arr[21 ]="海口,三亚" ;
arr[22 ]="成都,绵阳,德阳,自贡,攀枝花,广元,内江,乐山,南充,宜宾,广安,达川,雅安,眉山,甘孜,凉山,泸州" ;
arr[23 ]="贵阳,六盘水,遵义,安顺,铜仁,黔西南,毕节,黔东南,黔南" ;
arr[24 ]="昆明,大理,曲靖,玉溪,昭通,楚雄,红河,文山,思茅,西双版纳,保山,德宏,丽江,怒江,迪庆,临沧" ;
arr[25 ]="拉萨,日喀则,山南,林芝,昌都,阿里,那曲" ;
arr[26 ]="西安,宝鸡,咸阳,铜川,渭南,延安,榆林,汉中,安康,商洛" ;
arr[27 ]="兰州,嘉峪关,金昌,白银,天水,酒泉,张掖,武威,定西,陇南,平凉,庆阳,临夏,甘南" ;
arr[28 ]="银川,石嘴山,吴忠,固原" ;
arr[29 ]="西宁,海东,海南,海北,黄南,玉树,果洛,海西" ;
arr[30 ]="乌鲁木齐,石河子,克拉玛依,伊犁,巴音郭勒,昌吉,克孜勒苏柯尔克孜,博 尔塔拉,吐鲁番,哈密,喀什,和田,阿克苏" ;
arr[31 ]="香港" ;
arr[32 ]="澳门" ;
arr[33 ]="台北,高雄,台中,台南,屏东,南投,云林,新竹,彰化,苗栗,嘉义,花莲,桃园,宜兰,基隆,台东,金门,马祖,澎湖" ;

pre[0] ="北京";
pre[1] ="上海";
pre[2] ="天津";
pre[3] ="重庆";
pre[4] ="河北";
pre[5] ="山西";
pre[6] ="内蒙古";
pre[7] ="辽宁";
pre[8] ="吉林";
pre[9] ="黑龙江";
pre[10] ="江苏";
pre[11] ="浙江";
pre[12] ="安徽";
pre[13] ="福建";
pre[14] ="江西";
pre[15] ="山东";
pre[16] ="河南";
pre[17] ="湖北";
pre[18] ="湖南";
pre[19] ="广东";
pre[20] ="广西";
pre[21] ="海南";
pre[22] ="四川";
pre[23] ="贵州";
pre[24] ="云南";
pre[25] ="西藏";
pre[26] ="陕西";
pre[27] ="甘肃";
pre[28] ="宁夏";
pre[29] ="青海";
pre[30] ="新疆";
pre[31] ="香港";
pre[32] ="澳门";
pre[33] ="台湾";

function init()
{
    var pro = document.getElementById("province");
    for(var j=0;j<34;j++)
    {
             pro[j]=new Option(pre[j],pre[j]);
    }

    var city = document.getElementById("city");
    var cityArr = arr[0].split(",");
    for(var i=0;i<cityArr.length;i++)
    {
             city[i]=new Option(cityArr[i],cityArr[i]);
    }
}

function getCity()
{    
    var pro = document.getElementById("province");
    var city = document.getElementById("city");
    var index = pro.selectedIndex;
    var cityArr = arr[index].split(",");   
    
    city.length = 0;
    //将城市数组中的值填充到城市下拉框中
    for(var i=0;i<cityArr.length;i++)
    {
             city[i]=new Option(cityArr[i],cityArr[i]);
         }
}

function year()
{
    var year = document.getElementById("year");
    var y=new Date().getFullYear();
    for(var j=1990;j<=y;j++)
    {
    	year[j-1990]=new Option(j+"年",j+"年");
    }

}
</script>
</html>
