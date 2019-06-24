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
<title>任务</title>
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
	background: #fff;
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
	height: 0.5rem;
	background: #eee;
	display: flex;
	flex-flow: row;
	justify-content: space-around;
	line-height: 0.5rem;
	font-size: 0.18rem;
}

.content {
	margin-bottom: 0.5rem;
}

.selects {
	display: block;
	width: 80%;
	height: 0.44rem;
	font-size: 0.18rem;
	color: #555;
	position: relative;
	margin: auto;
	padding: 0;
	line-height: 0.44rem;
	color: #FFAA25;
	font-weight: bolder;
}

.selects_head input {
	height: 0.24rem;
	width: 88%;
	border-radius: 15px;
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
			<div class="address" onclick="toMyPublishJob()">&lt;</div>
			<div class="selects">
				￥
				<c:choose>
					<c:when test="${uj.getPublish_job().getPrice()>=100000000}">
							${uj.getPublish_job().getPrice()/100000000}亿
						</c:when>
					<c:when test="${uj.getPublish_job().getPrice()>=10000000}">
							${uj.getPublish_job().getPrice()/10000000}千万
						</c:when>
					<c:when test="${uj.getPublish_job().getPrice()>=1000000}">
							${uj.getPublish_job().getPrice()/1000000}百万
						</c:when>

					<c:otherwise>${uj.getPublish_job().getPrice()}</c:otherwise>
				</c:choose>
			</div>
		</div>

	</div>

	<div class="content">
		<div class="cell">
			<div style="width: 100%; height: 0.5rem;">
				<div
					style="width: 0.48rem; height: 0.48rem; float: left; border-radius: 50%; overflow: hidden;">
					<img
						src="${ctx}/images/user_headImage/${uj.getUser_info().getHeadsrc()}"
						style="height: 0.47rem; width: 0.47rem; min-width: 10px; min-height: 10px;" />
				</div>
				<div class="user-info"
					style="height: 0.48rem; float: left; margin-left: 0.12rem;">
					<span
						style="font-size: 0.15rem; float: left; width: 80%; margin-top: 0.04rem;">${uj.getUser_info().getNickname()}</span>
					<div id="pTime"
						style="font-size: 0.115rem; color: rgb(180, 154, 255); float: left; margin-top: 0.05rem;">${uj.getPublish_job().getpTime()}
					</div>
				</div>
			</div>

			<div class="job_title"
				style="margin-top: 0.15rem; padding-bottom: 0.1rem;">

				<b style="color: #A6A6A6; font-size: 0.16rem;">#
					${uj.getPublish_job().getpTitle()} #</b> <span
					style="font-size: 0.15rem;">
					${uj.getPublish_job().getpContent()} </span>
				<div style="margin-top: 0.1rem;">
					<c:choose>
						<c:when test="${count >1}">
							<c:forEach items="${img}" var="img">
								<img src="${ctx}/images/job/${img}"
									style="width: 30%; height: 1rem; border-radius: 10px; margin-right: 0.05rem; margin-bottom: 0.1rem;" />
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach items="${img}" var="img">
								<img src="${ctx}/images/job/${img}" width="70%" class="pimg"
									style="border-radius: 10px;" />
							</c:forEach>
						</c:otherwise>
					</c:choose>

				</div>
				<div style="color: #38CB04; margin-top: 0.1rem;">任务时限：${timeLimit}</div>
				<div style="color: #FFAA25; font-size: 0.2rem; font-weight: bolder;">
					￥
					<c:choose>
						<c:when test="${uj.getPublish_job().getPrice()>=100000000}">
							${uj.getPublish_job().getPrice()/100000000}亿
						</c:when>
						<c:when test="${uj.getPublish_job().getPrice()>=10000000}">
							${uj.getPublish_job().getPrice()/10000000}千万
						</c:when>
						<c:when test="${uj.getPublish_job().getPrice()>=1000000}">
							${uj.getPublish_job().getPrice()/1000000}百万
						</c:when>

						<c:otherwise>${uj.getPublish_job().getPrice()}</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>

	<div class="footer" onclick="deljob(${uj.getPublish_job().getPId()})">
		${state}</div>


	<script>
	
		function toMyPublishJob(){
			window.location.href="/CampusRewardSoft/mainIndex/myPublishJob.do";
		}
	
		//撤消任务
		function deljob(a){
			
			if($(".footer").text().trim()=="撤消发布"){
				//撤消任务
				$.ajax({
					type : "POST",
					url : "/CampusRewardSoft/mainIndex/delJob.do",
					data : {pid:a},
					dataType : "text",
					success : function(data) {
						console.log(data);
						alert("已撤消！");
						window.location.href="/CampusRewardSoft/mainIndex/myPublishJob.do";
					},
					error : function(e) {
						alert("发布错误！！");
					}
				});		
			}
			else if($(".footer").text().trim()=="点击验证"){
				//撤消任务
				$.ajax({
					type : "POST",
					url : "/CampusRewardSoft/mainIndex/toOderPage.do",
					data : {pid:a},
					dataType : "text",
					success : function(data) {
						console.log(data);
						window.location.href="/CampusRewardSoft/mainIndex/"+data+"/1/oderPage.do";
					},
					error : function(e) {
						alert("发布错误！！");
					}
				});	
			}			
		}
		
		if($(".footer").text().trim()=="任务过期"){
			$(".footer").css("pointer-events","none");
		}
		else if($(".footer").text().trim()=="撤消发布"){
			$(".footer").css("background","#339aff");
			$(".footer").css("color","");
		}
		else if($(".footer").text().trim()=="任务进行中..."){
			$(".footer").css("background","#38CB04");
			$(".footer").css("color","#fff");
			$(".footer").css("pointer-events","none");
		}
		else if($(".footer").text().trim()=="任务已完成!"){
			$(".footer").css("background","#FFE200");
			$(".footer").css("color","#fff");
			$(".footer").css("pointer-events","none");
		}
		else if($(".footer").text().trim()=="任务失败!!"){
			$(".footer").css("background","#555");
			$(".footer").css("color","#eef");
			$(".footer").css("pointer-events","none");
		}
		else if($(".footer").text().trim()=="点击验证"){
			$(".footer").css("background","#FF6700");
			$(".footer").css("color","#fff");
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