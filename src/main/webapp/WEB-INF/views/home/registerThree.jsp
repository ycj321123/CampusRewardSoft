<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@include file="/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${ctx}/js/jquery-3.3.1.js"></script>


<title>注册页面</title>
<style type="text/css">
html {
	font-size: 100px;
}

body, .mainView {
	font-size: 0.12rem;
	padding: 0;
	margin: 0;
}

html, body {
	overflow-y: auto;
}

.navigationBar {
	width: 100%;
	margin-top: 0.1rem;
}

.navigationBar .title_bar {
	color: #000;
	float: left;
	margin-left: 6%;
	width: auto;
	text-decoration: none;
	font-size: 0.28rem;
}

.form_u {
	margin-top: 0.44rem;
	width: 100%;
	text-align: center;
}

.form_u input:FOCUS {
	outline: none;
}

.submit_btn {
	margin-top: 0.5rem;
	width: 90%;
	height: 0.35rem;
	border-radius: 0.5rem;
	border: none;
	background: #339aff;
	margin-bottom: 0.5rem;
}

.up_load {
	width: 100%;
}

.z_file1 {
	width: 1rem;
	background: #fff;
	border: 1.5px solid #ccc;
	height: 1rem;
	width: 1rem;;
	margin-left: 1.35rem;
	border-radius: 0.5rem;
	color: #ccc;
	overflow: hidden;
}

.sex {
	position: relative;
	margin-top: 10%;
	width: 100%;
	font-size: 0.18rem;
}

.sex>input[type=radio] {
	display: inline-block;
	vertical-align: middle;
	width: 0.22rem;
	height: 0.22rem;
	-webkit-appearance: none;
	background-color: transparent;
	border: 0;
	outline: 0 !important;
}

.sex>input[type=radio]:after {
	content: "";
	display: block;
	width: 0.22rem;
	height: 0.22rem;
	border-radius: 50%;
	text-align: center;
	color: #fff;
	border: 3px solid #ddd;
	background-color: #fff;
	box-sizing: border-box;
}

.sex>input[type=radio]:checked:after {
	content: "L";
	transform: matrix(-0.766044, -0.642788, -0.642788, 0.766044, 0, 0);
	-webkit-transform: matrix(-0.766044, -0.642788, -0.642788, 0.766044, 0, 0);
	border-color: #099414;
	background-color: #099414;
	font-size: 0.15rem;
}
</style>
</head>
<body id="body">
	<div class="navigationBar">
		<!--  a href="registerTwo.do" class="title_bar" id="backHistory"><</a-->
	</div>
	<!--主视图 -->
	<div class="mainView">
		<div
			style="margin-left: 0.2rem; font-size: 0.3rem; margin-top: 0.54rem; height: 0.44rem;">
			<b>填写学校</b>
		</div>

		<!-- 表单 -->
		<div class="form_us">
			<sf:form action="registerThree.do" modelAttribute="student_status" method="post"
				class="form_u" enctype="multipart/form-data">
				<div class="up_load">
					<div class="z_file1">
						<br />
						<div style="font-size: 0.3rem;">+</div>
						<span style="font-size: 0.1rem;">点击上传</span> 
					</div>
					<input type="file" name="file" class="input_upload_driver" value=""
						accept="image/*" style="display: none;" onchange="picUpload(this);">
				</div>
				<div class="sex">
					你的性别： <input id="man" type="radio" checked="checked" name="sex" value="0"/>男<input
						id="woman" type="radio" name="sex" value="1"/>女
				</div>
				<input type="submit" value="下一步" class="submit_btn" id="submit">
			
			</sf:form>
		</div>

	</div>

	<script type="text/javascript" src="${ctx}/js/app_softkey.js"></script>
</body>
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
</script>
<script type="text/javascript">
	//下来点击 
	$(".selects_other").children("span").click(
			function() {
				$(this).parents('.selects').find(".selected").text(
						$(this).attr("title"));
				$(".selects_other").hide();

			})
	//头部点击 显示或隐藏下拉 
	$(".selects_head")
			.click(
					function() {
						if ($(this).parent().children(".selects_other").css(
								"display") == 'none') {
							$(this).parent().children(".selects_other").show();
							$(this).find("img").attr("src",
									"images/arrow_top.png");
						} else {
							$(this).parent().children(".selects_other").hide();
							$(this).find("img").attr("src",
									"images/arrow_bottom.png");
						}
					})
	
</script>

<script type="text/javascript">
//触发点击事件
$(".z_file1").on("click",function(){
	$(".input_upload_driver").trigger('click');
	return;
});
//文件上传
function picUpload(a){
    var me=$(".z_file1");
    
    var img = new Image();
        var ViewWidth=$(me).width();
        var ViewHeight=$(me).height();
        var file = a.files[0];
       //var URL = URL || webkitURL;
        img.src=window.URL.createObjectURL(file);
        img.onload = function(){
            var imgMe=this,
                imgWidth=0,
                imgHeight= 0,
                w = imgMe.width,
                h = imgMe.height,
                scale1 = w/ViewWidth,
                scale2 = h/ViewHeight;
            imgWidth=parseInt(Math.floor(w/scale1));
            imgHeight=parseInt(Math.floor(h/scale2));
            var canvas = document.createElement('canvas');
            var img = document.createElement('img');
            $('.z_file1').html(img);   
            var ctx = canvas.getContext('2d');
            canvas.width = ViewWidth;
            canvas.height = ViewHeight;
            ctx.drawImage(imgMe,0,0,imgWidth,imgHeight);
            me.src=canvas.toDataURL('image/jpg');
            $(img).attr("src",me.src);
        };
};

</script>
</html>