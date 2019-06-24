<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Icons - Ready Bootstrap Dashboard</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
<link rel="stylesheet" href="${ctx}/css/ready.css">
<link rel="stylesheet" href="${ctx}/css/demo.css">
<style type="text/css">
.pageUl {
	border: 1px solid #ccc;
	float: left;
	padding: 10px 0;
	padding-right: 15px;
	width: 100%;
}

.pageUl>ul {
	list-style-type: none;
}

.pageUl>ul li {
	float: left;
	padding: 5px 10px;
	margin-right: 15px;
	background: #339aff;
}

.pageUl>ul li:hover {
	background: #111aff;
}

.pageUl>ul .cur {
	background: #111aff;
}

.nav>.newli>a:before {
	background: #fff !important;
}

.nav>.newli>a {
	padding-left: 80px !important;
	width: 0px;
	padding-top: 5px !important;
	padding-bottom: 5px !important;
}

.nav>.newli:hover {
	background: red;
}

.nav>.newli {
	margin-top: 0px;
	display: none;
}

.cover {
	position: absolute;
	top: 0;
	z-index: 1;
	background: black;
	display: none;
}

.screenimg {
	border: 8px solid white;
}

.div {
	width: 220px;
	height: 220px;
	float: left;
}
.div>img{
height: 200px;
}
</style>
</head>
<body>
	<div class="wrapper">
		<div class="main-header">
			<div class="logo-header">
				<a href="index.do" class="logo"> 校园赏金后台管理 </a>
				<button class="navbar-toggler sidenav-toggler ml-auto" type="button"
					data-toggle="collapse" data-target="collapse"
					aria-controls="sidebar" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<button class="topbar-toggler more">
					<i class="la la-ellipsis-v"></i>
				</button>
			</div>
			<nav class="navbar navbar-header navbar-expand-lg">
				<div class="container-fluid">


					<ul class="navbar-nav topbar-nav ml-md-auto align-items-center">

						<li class="nav-item dropdown"><a
							class="dropdown-toggle profile-pic" data-toggle="dropdown"
							href="#" aria-expanded="false"> <img
								src="${ctx}/images/user_headImage/${ui.getHeadsrc()}"
								alt="user-img" width="36" class="img-circle"><span>${ui.getNickname()}</span></span>
						</a>
							<ul class="dropdown-menu dropdown-user">
								<li>
									<div class="user-box">
										<div class="u-img">
											<img src="${ctx}/images/user_headImage/${ui.getHeadsrc()}"
												alt="user">
										</div>
										<div class="u-text">
											<h4>${ui.getNickname()}</h4>
											<p class="text-muted">${ui.getUaccount()}
												${loginAdmin.getEmail()}</p>
										</div>
									</div>
								</li>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" onclick="myui()"><i
									class="ti-user"></i> 个人资料</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="loginout.do"><i
									class="fa fa-power-off"></i> 退出登陆</a>
							</ul> <!-- /.dropdown-user --></li>
					</ul>
				</div>

			</nav>
		</div>
		<div class="sidebar">
			<div class="scrollbar-inner sidebar-wrapper">
				<div class="user">
					<div class="photo">
						<img src="${ctx}/images/user_headImage/${ui.getHeadsrc()}">
					</div>
					<div class="info">
						<a class="" data-toggle="collapse" href="#collapseExample"
							aria-expanded="true"> <span> ${ui.getNickname()} <span
								class="user-level">管理员</span> <span class="caret"></span>
						</span>
						</a>
						<div class="clearfix"></div>

						<div class="collapse in" id="collapseExample" aria-expanded="true"
							style="">
							<ul class="nav">
								<li><a href="myui.do"> <span class="link-collapse">个人资料</span>
								</a></li>

							</ul>
						</div>
					</div>
				</div>
				<ul class="nav">
					<li class="nav-item" id="userli"><a> <i
							class="la la-table"></i>
							<p>用户管理</p>
					</a>
						<ul class="nav" style="color: #000; margin: 0px" id="newnav">
							<li class="newli"><a href="userManager.do">用户注册表</a></li>
							<li class="newli"><a href="user_InfoManager.do">用户信息表</a></li>
							<li class="newli"><a href="studentStatesManager.do">用户学籍表</a>
							</li>
						</ul></li>

					<li class="nav-item" id="jobli"><a> <i
							class="la la-keyboard-o"></i>
							<p>任务管理</p>
					</a>
						<ul class="nav" style="color: #000; margin: 0px" id="jobnav">
							<li class="newli"><a href="jobManager.do">任务发布审核</a></li>
							<li class="newli"><a href="jobPublishManager.do">任务发布表</a></li>
							<li class="newli"><a href="jobReceiveManager.do">任务接收表</a></li>
							<li class="newli"><a href="jobTuiJianManager.do">任务推荐</a></li>
						</ul></li>
					<li class="nav-item"><a href="oderManager.do"> <i
							class="la la-th"></i>
							<p>订单管理</p>
					</a></li>
					<li class="nav-item"><a href="msg.do"> <i
							class="la la-bell"></i>
							<p>消息管理</p>
					</a></li>
					<li class="nav-item"><a href="Chat.do"> <i
							class="la la-font"></i>
							<p>信誉积分管理</p>
					</a></li>
					<li class="nav-item active"><a href="other.do"> <i
							class="la la-fonticons"></i>
							<p>实名认证审核</p>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel">
			<div class="content">
				<div class="container-fluid">
					<h4 class="page-title">实名认证审核</h4>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
							
							<c:forEach items="${list}" var="list">
								<div class="card-header" style="border-top: 1px solid #ccc;">
									<div class="card-title">账号：${list.getIdcard().getUaccount()}</div>
									<div class="category">
										身份证号：${list.getIdcard().getIdcard()}  真实姓名：${list.getIdcard().getRealname()} 
									<div style="float: right;"><button onclick="ispass(0,${list.getIdcard().getUaccount()})">不通过</button> <button onclick="ispass(1,${list.getIdcard().getUaccount()})">通过</button></div>
									</div>
								</div>
								<div class="card-body">
									<div class="cover"></div>
									<!--背景层-->
									<div class="div">
										<img src="${ctx}/images/IDCardImage/${list.getIdcard().getStuCardL()}" width="200"><br>
										学生证正面
									</div>
									<div class="div">
										<img src="${ctx}/images/IDCardImage/${list.getIdcard().getStuCardR()}" width="200"><br>
										学生证反面
									</div>
									<div class="div">
										<img src="${ctx}/images/IDCardImage/${list.getIdcard().getIdCardL()}" width="200"><br>
										身份证正面
									</div>
									<div class="div">
										<img src="${ctx}/images/IDCardImage/${list.getIdcard().getIdCardR()}" width="200"><br>
										身份证反面
									</div>
								</div>
							
							</c:forEach>
								
							</div>
						</div>
					</div>
				</div>
			</div>
			<footer class="footer">
				<div class="container-fluid">地址：广东省广州市从化区经济开发区高技术产业园广从南路548号 |
					电话：020－87818918 传真：87818020 邮编：510990 | 网站公安备案编号：4401840100050</div>
			</footer>
		</div>
	</div>
</body>
<script src="${ctx}/js/core/jquery.3.2.1.min.js"></script>
<script src="${ctx}/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<script src="${ctx}/js/core/popper.min.js"></script>
<script src="${ctx}/js/core/bootstrap.min.js"></script>
<script src="${ctx}/js/plugin/chartist/chartist.min.js"></script>
<script
	src="${ctx}/js/plugin/chartist/plugin/chartist-plugin-tooltip.min.js"></script>
<script src="${ctx}/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
<script src="${ctx}/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
<script src="${ctx}/js/plugin/jquery-mapael/jquery.mapael.min.js"></script>
<script src="${ctx}/js/plugin/jquery-mapael/maps/world_countries.min.js"></script>
<script src="${ctx}/js/plugin/chart-circle/circles.min.js"></script>
<script src="${ctx}/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
<script src="${ctx}/js/ready.min.js"></script>
<script type="text/javascript">

function ispass(a,b){
	var str="";
	
	if(a==0) str="不通过";
	else str="通过";
	
	 if (confirm("你确定"+str+"吗？")) {  
		 $.ajax({
				type : "POST",
				url : "checkIDCard.do",
				data : {no:a,ac:b},
				dataType : "text",
				success : function(data) {
					window.location.href="other.do";
				},
				error : function(e) {
					alert("发布错误！！");
				}
			});
     }  
     else {  
         return;
     } 
	 
}

	var open = false;
	$("#userli").click(function() {
		if (!open) {
			$("#newnav li").css("display", "block");
			open = true;
		} else if (open) {
			$("#newnav li").css("display", "none");
			open = false;
		}
	});
	$("#jobli").click(function() {
		if (!open) {
			$("#jobnav li").css("display", "block");
			open = true;
		} else if (open) {
			$("#jobnav li").css("display", "none");
			open = false;
		}
	})

	jQuery(document).ready(function() {
		var protoWidth = 0, protoHeight = 0;
		$(document).on('click', function(e) {
			var $a = $(e.target); //获取点击目标

			if ($a.is('img') && !$a.is('.screenimg')) {
				bigimg();
			} else {
				normalimg();
			}
			;

			function bigimg() {
				var sw =$('body').width() / 2 || $(window).width() / 2, //获得浏览器可视区域的宽度
				sh = $('body').height() / 2 || $(window).height() / 2, //获得浏览器可视区域的高度
				w =200;//$a.width(), //获得图片本身宽
				h ="400px";//$a.height(), //获得图片本身高
				sc = $a.width() / $a.height(), //获得图片的比例
				st = $('body').scrollTop() || $(document).scrollTop(); //获取document被卷去的值
				t =sh - (900 / sc / 2) + st, //计算图片在可视区域垂直坐标的位置
				l =0; //sw - (900 / 2); //计算图片在可视区域横向坐标的位置
				if (protoWidth === 0) {
					protoWidth = w;
					protoHeight = h;
				}
				;
				$('html').height(sh * 2).css('overflow', 'hidden');
				$a.css({
					'position' : 'absolute',
					'width' : 0
				}).animate({
					'width' : 600,
					'top' :t,
					'left' : l,
					'height':600
				}, 500).addClass('screenimg');
				$('.cover').animate({
					'top' : st				
				}, 200).fadeIn(300);
			}
			;

			function normalimg() {
				$('html').height('100%').css('overflow', '');
				$('.screenimg').animate({
					'width' : protoWidth
				}, 300).css({
					'position' : '',
					'width' : 200,
					'top' : '',
					'left' : '',
					'height':200
				}).removeClass('screenimg');
				$('.cover').fadeOut(300).animate({
					'top' : 0
				}, 200);
			}
			;
		});
	});
</script>
</html>