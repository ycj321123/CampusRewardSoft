<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN" id="html0">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<script type="text/javascript" src="${ctx}/js/jquery-3.3.1.js"></script>
<title>任务搜索</title>
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
	color: #555;
	width: 100%;
	text-align: center;
	padding-left: 0.17rem;
	padding-right: 0.17rem;
	line-height: 0.44rem;
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
}

.top .input {
	padding: 0.03rem;
	width: auto;
	height: 0.44rem;
	background: transparent;
	border: none;
	border-bottom: 0.02rem solid #000;;
	margin-left: -0.25rem;
	padding-bottom: -0.5rem;
}

/*清除ie的默认选择框样式清除，隐藏下拉箭头
select::-ms-expand { display: none; }
*/
.search>i {
	position: absolute;
	left: 0.83rem;
	z-index: 10;
	color: gray;
}

.top>.xx {
	position: absolute;
	left: 3.1rem;
	top: 0.08rem;
	z-index: 5;
	color: gray;
	font-size: 0.14rem;
}

.top>.sm {
	position: absolute;
	left: 3.35rem;
	top: 0rem;
	z-index: 5;
	color: white;
	font-size: 0.28rem;
	margin-left: 0.1rem;
}

.top>i {
	font-size: 0.35rem;
	color: white;
	margin-top: 0.1rem;
}

/*内容*/
.content {
	overflow: scroll;
	margin-top: 0.44rem;
}

.cell {
	padding-left: 0.12rem;
	padding-right: 0.17rem;
	margin-top: 0.07rem;
	background: white;
	padding-top: 0.17rem;
}

/*页脚样式*/
.footer {
	position: fixed;
	width: 100%;
	left: 0;
	bottom: 0;
	z-index: 5;
	height: 0.55rem;
	background: #fff;
	display: flex;
	flex-flow: row;
	justify-content: space-around;
	line-height: 0.24rem;
	border-top: 0.01rem solid #ccc;
}

.footer>.option {
	width: 25%;
	text-align: center;
}

.content {
	margin-bottom: 0.5rem;
}

.footer {
	
}

.footer i {
	font-size: 0.15rem;
}

.footer>.option>div {
	font-size: 0.1rem;
}

.footer>.option>.list0 {
	color: #379AFF;
}

.selects {
	display: block;
	width: 80%;
	height: 0.44rem;
	font-size: 0.16rem;
	color: #555;
	position: relative;
	margin: auto;
	padding: 0;
	padding-top:0.1rem;
}
.selects_head input{
	height: 0.24rem;
	width: 88%;
	border-radius:15px;
	border: none; 
	outline: none;
	text-indent: 0.18rem;
	font-size: 0.13rem;
}
</style>
</head>
<body>
	<div class="header">
		<div class="top">
			<div class="address" onclick="tome();">&lt;</div>
			<form id="tf" action="search.do" method="post">
			<div class="selects">
				<div class="selects_head">
					
						<input id="text" type="text" placeholder="搜索：任务标题" name="text" value="${text}">
								
				</div>
			</div>	
			<input id="submit" type="submit" value="搜索" style="float:right;margin-top:-0.32rem; border:none; outline:none; font-size: 0.13rem; line-height:0.24rem; border-radius:0.1rem;width:0.4rem;; text-align:center; background:#FFAA25;height: 0.24rem;"/>
			</form>
		</div>

	</div>

	<div class="content">
		<c:if test="${pjsList !=null}">
			<c:forEach items="${pjsList}" var="pjsList">
				<div class="cell" onclick="jobpage(${pjsList.getPublish_job().getPId()})">
					<div style="width: 100%; height: 0.5rem;">
						<div
							style="width: 0.48rem; height: 0.48rem; float: left; border-radius: 50%; overflow: hidden;">
							<img src="${ctx}/images/user_headImage/${pjsList.getUser_info().getHeadsrc()}"
								style="height: 0.47rem; width: 0.47rem; min-width: 10px; min-height: 10px;" />
						</div>
						<div class="user-info"
							style="height: 0.48rem; float: left; margin-left: 0.12rem;">
							<span
								style="font-size: 0.15rem; float: left; width: 80%; margin-top: 0.04rem;">${pjsList.getUser_info().getNickname()}</span>
							<div id="pTime" 
								style="font-size: 0.115rem; color: rgb(180, 154, 255); float: left; margin-top: 0.05rem;">${pjsList.getPublish_job().getpTime()}
							</div>
						</div>
						<div class="price"
							style="font-size: 0.16rem; color: #FFAA25; font-weight: bolder; float: right; margin-top: 0.11rem;">
							赏金：￥
							<c:choose>
								<c:when test="${pjsList.getPublish_job().getPrice()>=100000000}">
									${pjsList.getPublish_job().getPrice()/100000000}亿
								</c:when>
								<c:when test="${pjsList.getPublish_job().getPrice()>=10000000}">
									${pjsList.getPublish_job().getPrice()/10000000}千万
								</c:when>
								<c:when test="${pjsList.getPublish_job().getPrice()>=1000000}">
									${pjsList.getPublish_job().getPrice()/1000000}百万
								</c:when>
								
								<c:otherwise>${pjsList.getPublish_job().getPrice()}</c:otherwise>
							</c:choose>
						</div>
					</div>
		
					<div class="job_title"
						style="margin-top: 0.15rem; padding-bottom: 0.1rem;">
							<b style="color: #A6A6A6; font-size: 0.16rem;">任务标题:</b> 
						<span style="font-size: 0.15rem;"> ${pjsList.getPublish_job().getpTitle()}</span>
					
					</div>
				</div>
			</c:forEach>
		</c:if>
		<div class="cell" style="padding-bottom: 0.17rem; font-size: 0.15rem; float: left; width: 100%;">
			<div>任务推荐:</div>
			<c:forEach items="${list}" var="list">
				<div style="float:left; border-radius:15px; padding:0 0.05rem; background: #ccc; margin-top: 0.05rem; margin-right: 0.05rem;"><a onclick="jobTuiJian(this)">${list.getpTitle()}</a></div>
			</c:forEach>
		</div>
	</div>

	<script>
	
	function jobpage(a){
		console.log(a);
		/*$.ajax({
			type : "POST",
			url : "jobPage.do",
			data : {pid:a,isto:"3"},
			dataType : "text",
			success : function(data) {
				console.log(data);
				window.location.href="jobPage.do";
			},
			error : function(e) {
				alert("发布错误！！");
			}
		});		*/
		window.location.href=a+"/"+"2/jobPage.do";
		
	}
	
	function jobTuiJian(a){
		$("#text").val($(a).text());
		$("#submit").trigger('click');
	}
	
	function search(){
		var form = new FormData(document.getElementById("tf"));
		$.ajax({
			type : "POST",
			url : "search.do",
			data : form,
			dataType : "text",
			processData : false,
			contentType : false,
			success : function(data) {
				console.log(data);
								
			},
			error : function(e) {
				alert("发布错误！！");
			}
		});		
	}
	
	
	function tome() {
		window.location.href = "index.do";
	}
	
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
//var time=document.getElementsByClassName("pTime");
	$("div[id=pTime]").each(function(){     
		$(this).html(getDateDiff($(this).html()));  
	});
	
	//$(".pTime").text(getDateDiff($(".pTime").text()));


//字符串转换为时间戳
function getDateTimeStamp (dateStr) {
    return Date.parse(dateStr.replace(/-/gi,"/"));
}

function getDateDiff (dateStr) {
    var publishTime = getDateTimeStamp(dateStr)/1000,
        d_seconds,
        d_minutes,
        d_hours,
        d_days,
        timeNow = parseInt(new Date().getTime()/1000),
        d,

        date = new Date(publishTime*1000),
        Y = date.getFullYear(),
        M = date.getMonth() + 1,
        D = date.getDate(),
        H = date.getHours(),
        m = date.getMinutes(),
        s = date.getSeconds();
        //小于10的在前面补0
        if (M < 10) {
            M = '0' + M;
        }
        if (D < 10) {
            D = '0' + D;
        }
        if (H < 10) {
            H = '0' + H;
        }
        if (m < 10) {
            m = '0' + m;
        }
        if (s < 10) {
            s = '0' + s;
        }

    d = timeNow - publishTime;
    d_days = parseInt(d/86400);
    d_hours = parseInt(d/3600);
    d_minutes = parseInt(d/60);
    d_seconds = parseInt(d);

    if(d_days > 0 && d_days < 3){
        return d_days + '天前';
    }else if(d_days <= 0 && d_hours > 0){
        return d_hours + '小时前';
    }else if(d_hours <= 0 && d_minutes > 0){
        return d_minutes + '分钟前';
    }else if (d_seconds < 60) {
        if (d_seconds <= 0) {
            return '刚刚发表';
        }else {
            return d_seconds + '秒前';
        }
    }else if (d_days >= 3 && d_days < 30){
        return M + '-' + D;
    }else if (d_days >= 30) {
        return Y + '-' + M + '-' + D ;
    }
}
</script>
</body>
</html>