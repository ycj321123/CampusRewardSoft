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
<title>我的订单</title>
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
	font-weight:lighter;
	color:#555;
}

.top .input {
	padding: 0.03rem;
	width: auto;
	height: 0.44rem;
	background: transparent;
	border: none;
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
	margin-top: 0.07rem;
	background: white;
	padding-top: 0.1rem;
	width:100%; 
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
	padding: 0 0 0 0;
}

.selects .selected {
	position: relative;
	height: 0.44rem;
	padding-bottom: 0.05rem;
}

.selects_other {
	position: fixed;
	left: 0;
	top: 0.44rem;
	width: 100%;
	display: none;
	z-index: 999;
	border-top: 1px solid #ccc;
	top: 0.44rem;
	overflow: scroll;
}

.selects_other>a {
	border: 1px solid #ccc;
	border-top: none;
	display: block;
	width: 100%;
	padding: 0rem 0;
	height: 0.44rem;
	font-size: 0.18rem;
	background-color: #FFF;
	color: #555;
}
</style>
</head>
<body style="width: 100%;">
	<div class="header">
		<div class="top">
			<div class="address" id="tome">
				<
			</div>

			<div class="selects">
				<div class="selects_head">
					我的订单
				</div>
			</div>
		</div>

	</div>

	<div class="content">
	<c:forEach items="${oderList}" var="oderList">
		<div class="cell" style="float: left;">		
			<div onclick="oderPage('${oderList.getOder().getOderid()}')">
				<div  style="float: left;width: 100%;"><div style="float: left;">订单编号：${oderList.getOder().getOderid()}</div></div>
				<div class="job_title"
					style="margin-top: 0.05rem; padding-bottom: 0.1rem;">
						<c:choose>
						<c:when test="${oderList.getOder().getPublish_job().getpAccount()==loginUser.getAccount()}"><b style="color: #339aff; font-size: 0.16rem;">我的任务:</b> </c:when>
						<c:otherwise><b style="color: #A6A6A6; font-size: 0.16rem;">${oderList.getUser_info().getNickname()}的任务:</b> </c:otherwise>
						</c:choose>
					<span style="font-size: 0.15rem;"> ${oderList.getText()}</span>
				
				</div>
			</div>			
				<c:choose>
					<c:when test="${oderList.getOder().getPublish_job().getIsComplish()==2}">
						<div id="oderState" style="float:right; background: #38CB04; margin-right:0.1rem; border-radius:10px; width:0.7rem; text-align: center; height: 0.3rem;line-height: 0.3rem;color:#000;border: 1px solid #ccc; margin-top: -0.43rem;">交易完成</div>
					</c:when>
					<c:when test="${oderList.getOder().getPublish_job().getIsComplish()==3}">
						<div id="oderState" style="float:right; background: #555; margin-right:0.1rem; border-radius:10px; width:0.7rem; text-align: center; height: 0.3rem;line-height: 0.3rem;color:#fff;border: 1px solid #ccc; margin-top: -0.43rem;">交易失败</div>
					</c:when>
				</c:choose>
				<div onclick="delOder('${oderList.getOder().getOderid()}')" class="del" style="float:right; margin-right:-0.67rem; height:0.62rem; display:none; float:right;margin-top:-0.62rem; width:19%; background: red;font-size: 0.18rem;text-align: center;color: #fff;line-height: 0.67rem;">删除</div>
		</div>
		
	</c:forEach>
		
	</div>
	
	<script>
	
	function delOder(a){
		//删除订单

		$.ajax({
			type : "POST",
			url : "delOder.do",
			data : {oderid:a},
			dataType : "text",
			success : function(data) {
				console.log(data);
				window.location.href="myOder.do";
			},
			error : function(e) {
				alert("发布错误！！");
			}
		});		
	}
	
	$("#tome").click(function(){
		window.location.href="me.do";		
	});
	
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
	    var lines=$(".cell");
	    var len = lines.length; 
	    var n=0;
	    for (var i = 0; i < len; ++i) {
	    	if($(lines[i]).children("#oderState").length>0 && $(lines[i]).children("#oderState").text().trim()!="待验证" && $(lines[i]).children("#oderState").text().trim()!="进行中"){	    		
	    		lines[n++]=lines[i];	    		
	    	}
	    }
	    var del=$(".del");
	    
	    var lastX, lastXForMobile;

	    // 用于记录被按下的对象
	    var pressedObj;  // 当前左滑的对象
	    var lastLeftObj; // 上一个左滑的对象

	    // 用于记录按下的点
	    var start;
	    
		// 网页在移动端运行时的监听
		for (var i = 0; i < n; ++i) {
        	lines[i].addEventListener('touchstart', function(e){
        		
	            lastXForMobile = e.changedTouches[0].pageX;
	            pressedObj = this; // 记录被按下的对象 
	
	            // 记录开始按下时的点
	            var touches = event.touches[0];
	            start = { 
	                x: touches.pageX, // 横坐标
	                y: touches.pageY  // 纵坐标
	            };
        	});
		
		  lines[i].addEventListener('touchmove',function(e){
			 
	            // 计算划动过程中x和y的变化量
	            var touches = event.touches[0];
	            delta = {
	                x: touches.pageX - start.x,
	                y: touches.pageY - start.y
	            };

	            // 横向位移大于纵向位移，阻止纵向滚动
	            if (Math.abs(delta.x) > Math.abs(delta.y)) {
	                event.preventDefault();
	            }
	        });

	        lines[i].addEventListener('touchend', function(e){
	        	console.log(i);
	            if (lastLeftObj && pressedObj != lastLeftObj) { // 点击除当前左滑对象之外的任意其他位置
	                $(lastLeftObj).animate({marginLeft:"0"}, 500); // 右滑
	                $(pressedObj).find(".del").css("display","none");
	                $(lastLeftObj).find(".del").css("display","none");
	                lastLeftObj = null; // 清空上一个左滑的对象
	            }
	            var diffX = e.changedTouches[0].pageX - lastXForMobile;
	            if (diffX < -50) {
	                $(pressedObj).animate({marginLeft:"-0.69rem"},500); // 左滑
	                $(pressedObj).find(".del").css("display","");
	                lastLeftObj && lastLeftObj != pressedObj && 
	                    $(lastLeftObj).animate({marginLeft:"0"}, 500); // 已经左滑状态的按钮右滑
	                lastLeftObj = pressedObj; // 记录上一个左滑的对象
	            } else if (diffX > 50) {
	              if (pressedObj == lastLeftObj) {
	                $(pressedObj).animate({marginLeft:"0"}, 500); // 右滑0.5秒
	                $(pressedObj).find(".del").css("display","none");
	                lastLeftObj = null; // 清空上一个左滑的对象
	              }
	            }
	        });
	       
	    }

	    // 网页在PC浏览器中运行时的监听
	    for (var i = 0; i < n; ++i) {
	    	
	        $(lines[i]).bind('mousedown', function(e){
	            lastX = e.clientX;
	            pressedObj = this; // 记录被按下的对象
	        });

	        $(lines[i]).bind('mouseup', function(e){
	        	
	        	console.log(i+10);
	            if (lastLeftObj && pressedObj != lastLeftObj) { // 点击除当前左滑对象之外的任意其他位置
	                $(lastLeftObj).animate({marginLeft:"0"}, 500); // 右滑
	                $(pressedObj).find(".del").css("display","none");
	                lastLeftObj = null; // 清空上一个左滑的对象
	            }
	            var diffX = e.clientX - lastX;
	            if (diffX < -50) {
	                $(pressedObj).animate({marginLeft:"-0.69rem"}, 500); // 左滑
	                $(pressedObj).find(".del").css("display","");	//左滑显示
	                lastLeftObj && lastLeftObj != pressedObj && 
	                    $(lastLeftObj).animate({marginLeft:"0"}, 500); // 已经左滑状态的按钮右滑
	                lastLeftObj = pressedObj; // 记录上一个左滑的对象
	            } else if (diffX > 50) {
	              if (pressedObj == lastLeftObj) {
	                $(pressedObj).animate({marginLeft:"0"}, 500); // 右滑
	                $(pressedObj).find(".del").css("display","none");	//右滑隐藏
	                lastLeftObj = null; // 清空上一个左滑的对象
	              }
	            }
	        });
	       
	   }	
	    
		function oderPage(a){
			console.log(a);			
			window.location.href=a+"/"+"0/oderPage.do";
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