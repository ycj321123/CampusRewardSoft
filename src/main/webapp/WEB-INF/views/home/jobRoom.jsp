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
<title>发布任务</title>
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

.deleteImg {
	float: right;
	color: #fff;
	background: #555;
	text-align: center;
	width: 0.17rem;
	height: 0.17rem;
	border-radius: 0.5rem;
	font-size: 0.15rem;
	margin-top: -0.85rem;
	margin-right: -0.05rem;
	line-height: 0.15rem;
	font-weight: lighter;
}

img {
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
					<span class='selected'>发布任务 </span>
				</div>
			</div>
		</div>
	</div>

	<div class="content" style="margin-top: 0.44rem; padding-top: 0px;">
		<div class="cell"
			style="width: 100%; margin-top: 0.1rem; padding-top: 0.1rem; font-size: 0.18rem; color: #399aff;">
			<sf:form id="inputFiles" modelAttribute="Publish_job" method="post">
				任务标题：
				<input type="text" id="pTitle" name="pTitle" placeholder="请输入任务标题" />
				任务内容：
				<textarea id="pContent" name="pContent" placeholder="任务内容描述..."
					style="resize: none; margin-top: 0.1rem; width: 98%; height: 1.5rem; margin-bottom: 0.15rem; font-size: 0.13rem;"></textarea>
				任务时限:
				<input type="datetime-local" id="timeLimit" name="timeLimit"
					placeholder="请输入身份证号" />
				任务赏金：
				<input type="number" id="price" name="price"
					placeholder="请输入价格（单位：元）" />

				<select name="jobLevel" style="margin-bottom: 0.1rem; width: 100%;padding: 0.1rem;outline: none;border-radius:15px;background:#fff; ">
					<option value="0">其他</option>
					<option value="1">跑腿</option>
					<option value="2">快递</option>
					<option value="3">外卖</option>
				</select>

				<input type="hidden" id="pTime" name="pTime" id="pTime" />
				<input type="hidden" name="deleteNo" id="deleteNo">

			</sf:form>

		</div>
		<div id="pImage"
			style="float: left; width: 100%; margin-top: 0.15rem; background: #fff; padding-bottom: 0.1rem;">

			<div onclick="addinputFile()" id="pI"
				style="margin-left: 0.08rem; margin-top: 0.08rem; width: 0.8rem; height: 0.8rem; border: 1px dashed #ccc; float: left; text-align: center; font-size: 0.5rem; font-weight: lighter;">
				+</div>
		</div>

		<div onclick="publishjob()"
			style="float: left; text-align: center; color: #fff; line-height: 0.35rem; border-radius: 0.5rem; margin-left: 3%; background: #399aff; height: 0.35rem; width: 94%; margin-top: 0.3rem;">发布</div>
	</div>

	<script type="text/javascript">
		Date.prototype.Format = function(fmt) {
			var o = {
				"M+" : this.getMonth() + 1, //月份 
				"d+" : this.getDate(), //日 
				"H+" : this.getHours(), //小时 
				"m+" : this.getMinutes(), //分 
				"s+" : this.getSeconds(), //秒 
				"q+" : Math.floor((this.getMonth() + 3) / 3), //季度 
				"S" : this.getMilliseconds()
			//毫秒 
			};
			if (/(y+)/.test(fmt))
				fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
						.substr(4 - RegExp.$1.length));
			for ( var k in o)
				if (new RegExp("(" + k + ")").test(fmt))
					fmt = fmt.replace(RegExp.$1,
							(RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k])
									.substr(("" + o[k]).length)));
			return fmt;
		}
	</script>
</body>

<script type="text/javascript">
	function tome() {
		window.location.href = "index.do";
	}
	var upno = 0;
	//选择图片，马上预览  
	function xmTanUploadImg(obj) {

		var fl = obj.files.length;
		if (fl + upno > 6) {
			fl = 6;
			obj.value = "";
			alert("最多上传6张！");

			return;
		} else {
			for (var i = 0; i < fl; i++) {
				var file = obj.files[i];
				aa = file.name;
				var reader = new FileReader();
				upno++;
				//读取文件过程方法 
				var j = 0;
				reader.onload = function(e) {
					var imgstr = "<div id='img"+upno+"' class='divImg' style='margin-left:0.08rem; margin-top:0.08rem; width: 0.8rem; height: 0.8rem; float: left;'>"
							+ "<img src='"+e.target.result+"' style='width:0.8rem;height:0.8rem;'/><div class='deleteImg' onclick='deleteImg("
							+ upno
							+ ',\"'
							+ obj.files[j++].name
							+ '\"'
							+ ")'>x</div></div>";

					var oimgbox = $("#pImage");
					oimgbox.prepend(imgstr);
				}

				reader.readAsDataURL(file);
				console.log("111111" + upno);
				if (upno == 6) {
					$("#pI").css("display", "none");
				}
			}
		}
	}

	function deleteImg(j, e) {
		upno--;
		var id = "#img" + j;
		$("#deleteNo").val($("#deleteNo").val() + "#" + e);
		$(id).css("display", "none");
		if (upno < 6) {
			$("#pI").css("display", "block");
		}
	}
	//新增type="file"
	function addinputFile() {

		if (upno >= 6) {
			alert("最多上传6张！");
			return;
		} else {
			//检查最后一个type="file"有没有选择图片，没有则去使用，不再建新的
			var lastObj = $("input[type='file']:last");
			if (lastObj.prop('files')) {
				if (lastObj.prop('files').length == 0) {
					lastObj.click();
				} else {
					$("#inputFiles")
							.append(
									"<input type='file' name='fileAttach' accept='image/*' onChange='xmTanUploadImg(this);' style='display:none;'/>");
					$("input[type='file']:last").click();
				}
			} else {
				//第一个
				$("#inputFiles")
						.append(
								"<input type='file' name='fileAttach' accept='image/*' onChange='xmTanUploadImg(this);' style='display:none;'/>");
				$("input[type='file']:last").click();
			}
		}
	}
	var myDate = new Date();
	var time = new Date().Format("yyyy-MM-dd") + "";
	var tt = myDate.getHours() + ":" + myDate.getMinutes() + ":"
			+ myDate.getSeconds();
	var val = time + "T" + tt;
	$("#timeLimit").val(val);

	//点击发布
	function publishjob() {
		if ($("#pTitle").val().trim().length <= 0) {
			alert("任务标题不能为空！");
		} else if ($("#pContent").val().trim().length <= 0) {
			alert("任务内容不能为空！");
		} else if ($("#timeLimit").val().trim().length <= 0) {
			alert("时间限制不能为空！");
		} else if ($("#price").val().trim().length <= 0) {
			alert("价格不能为空！");
		} else if ($("#price").val() > 100000000) {
			alert("价格不能超过一亿！");
		} else if ($("#price").val() <=0) {
			alert("价格不能低于0！");
		} else if (confirm("发布任务将在余额里扣除相应价格，是否发布？")) {
			var time = new Date().Format("yyyy-MM-dd HH:mm:ss");
			$("#pTime").val(time);
			var form = new FormData(document.getElementById("inputFiles"));
			$.ajax({
				type : "POST",
				url : "jobRoom.do",
				data : form,
				dataType : "text",
				processData : false,
				contentType : false,
				success : function(data) {
					console.log(data);
					if (data == "err") {
						alert("必须先实名，实名认证通过后才能发布任务！");
					} else if (data == "errP") {
						alert("余额不足！不能发任务。");
					} else {
						alert("任务发布成功！");
						window.location.href = "index.do";
					}
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
