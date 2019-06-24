<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>Typography - Ready Bootstrap Dashboard</title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
	<link rel="stylesheet" href="${ctx }/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
	<link rel="stylesheet" href="${ctx }/css/ready.css">
	<link rel="stylesheet" href="${ctx }/css/demo.css">
	<style type="text/css">
.pageUl{
border: 1px solid #ccc;
float: left;
padding: 10px 0;
padding-right:15px;
width: 100%;
}
.pageUl>ul{
	list-style-type:none;
}
.pageUl>ul li{
	float: left;
	padding: 5px 10px;
	margin-right: 15px;
	background: #339aff;
}
.pageUl>ul li:hover{
	background: #111aff;
}
.pageUl>ul .cur{
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
</style>
</head>
<body>
	<div class="wrapper">
		<div class="main-header">
			<div class="logo-header">
				<a href="index.do" class="logo">
					校园赏金后台管理 
				</a>
				<button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-controls="sidebar" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<button class="topbar-toggler more"><i class="la la-ellipsis-v"></i></button>
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
					<ul class="nav" style="color: #000;margin: 0px" id="newnav">
						<li class="newli">
						<a href="userManager.do">用户注册表</a>
						</li>
						<li class="newli">
						<a href="user_InfoManager.do">用户信息表</a>
						</li>
						<li class="newli">
						<a href="studentStatesManager.do">用户学籍表</a>
						</li>
					</ul>
					</li>
					
					<li class="nav-item" id="jobli"><a> <i
							class="la la-keyboard-o"></i>
							<p>任务管理</p>
					</a>
					<ul class="nav" style="color: #000; margin: 0px" id="jobnav">
							<li class="newli" ><a href="jobManager.do">任务发布审核</a></li>
							<li class="newli"><a href="jobPublishManager.do">任务发布表</a></li>
							<li class="newli"><a href="jobReceiveManager.do">任务接收表</a></li>
							<li class="newli"><a href="jobTuiJianManager.do">任务推荐</a></li>
						</ul>
					</li>
					<li class="nav-item"><a href="oderManager.do"> <i
							class="la la-th"></i>
							<p>订单管理</p>
					</a></li>
					<li class="nav-item"><a href="msg.do"> <i
							class="la la-bell"></i>
							<p>消息管理</p>
					</a></li>
					<li class="nav-item active"><a href="Chat.do"> <i
							class="la la-font"></i>
							<p>信誉积分管理</p>
					</a></li>
					<li class="nav-item"><a href="other.do"> <i
							class="la la-fonticons"></i>
							<p>实名认证审核</p>
					</a></li>
				</ul>
			</div>
		</div>
			<div class="main-panel">
				<div class="content">
					<div class="container-fluid">
						<div class="card" id="sure">
						<div class="card-header">
							<div class="card-title">用户积分表</div>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="table">
									<thead>
										<tr>
											<th>序号</th>
											<th>手机号</th>
											<th>昵称</th>
											<th>邮箱</th>
											<th>信誉积分</th>
											<th>限制登陆</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${page.getDatas()}" var="page" varStatus="s">
											<tr>
												<th scope="row">${s.index +1}</th>
												<td>${page.getAccount()}</td>
												<td>${page.getUsername()}</td>
												<td>${page.getEmail()}</td>
												<td>${page.getCreditIntegral()}</td>
												<c:choose>
												<c:when test="${page.getLoginLimit()=='0'}"><td></td></c:when>
												<c:otherwise><td>${page.getLoginLimit()}</td></c:otherwise>
												</c:choose>
												
												
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="pageUl">
									<ul>
										<li onclick="index(${cur-1},${page.getPageEnd()})">上一页</li>
										<c:forEach  begin="${page.getPageStart()}" end="${page.getPageEnd()}" varStatus="ss">
										<c:choose>
											<c:when test="${ss.index==cur}"><li class="cur" onclick="index(${ss.index},${page.getPageEnd()})">${ss.index}</li></c:when>
											<c:otherwise><li onclick="index(${ss.index},${page.getPageEnd()})">${ss.index}</li></c:otherwise>
										</c:choose>
										</c:forEach>
										<li onclick="index(${cur+1},${page.getPageEnd()})">下一页</li>
										<li style="float: left;background: #fff;">跳转到第<input type="text" size="3" id="trans" oninput="value=value.replace(/[^\d]/g,'')">页 <span style="background: #339aff; padding: 4px;" onclick="tran(${page.getTotalPage()})">跳转</span>&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;总页数：${page.getTotalPage() }</li>
										
									</ul>	
								</div>
							</div>
						</div>
						
						<div class="card-body">
							<div style="margin-bottom: 15px;">账号：<input type="text" id="search" style="width: 22%;" placeholder="手机号"  style=" padding: 5px;"/> 扣除 <input type="text" size="3" id="jifen" oninput="value=value.replace(/[^\d]/g,'')"> 积分 <span style="background: #339aff; padding: 4px;" onclick="koujifen(0,this)">确定</span></div>
							<div style="margin-bottom: 15px;">账号：<input type="text" id="search2" style="width: 22%;" placeholder="手机号"  style=" padding: 5px;"/> 增加 <input type="text" size="3" id="jifen2" oninput="value=value.replace(/[^\d]/g,'')"> 积分 <span style="background: #339aff; padding: 4px;" onclick="koujifen(1,this)">确定</span></div>
							<div style="margin-bottom: 15px;">账号：<input type="text" id="search3" style="width: 22%;" placeholder="手机号"  style=" padding: 5px;"/> 封号 <input type="text" size="3" id="jifen3" oninput="value=value.replace(/[^\d]/g,'')"> &nbsp; 天  &nbsp;<span style="background: #339aff; padding: 4px;" onclick="koujifen(2,this)">确定</span></div>
						</div>
					</div>
						
					</div>
				</div>
				<footer class="footer">
				<div class="container-fluid">地址：广东省广州市从化区经济开发区高技术产业园广从南路548号 | 电话：020－87818918 传真：87818020 邮编：510990 | 网站公安备案编号：4401840100050</div>
			</footer>
			</div>
		</div>
	
</body>
<script src="${ctx }/js/core/jquery.3.2.1.min.js"></script>
<script src="${ctx }/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<script src="${ctx }/js/core/popper.min.js"></script>
<script src="${ctx }/js/core/bootstrap.min.js"></script>
<script src="${ctx }/js/plugin/chartist/chartist.min.js"></script>
<script src="${ctx }/js/plugin/chartist/plugin/chartist-plugin-tooltip.min.js"></script>
<script src="${ctx }/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
<script src="${ctx }/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
<script src="${ctx }/js/plugin/jquery-mapael/jquery.mapael.min.js"></script>
<script src="${ctx }/js/plugin/jquery-mapael/maps/world_countries.min.js"></script>
<script src="${ctx }/js/plugin/chart-circle/circles.min.js"></script>
<script src="${ctx }/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
<script src="${ctx }/js/ready.min.js"></script>
<script type="text/javascript">
function koujifen(a,b){
	var name;
	var jifen;
	if(a==0){
		name=$("#search").val();
		jifen=$("#jifen").val();
	}else if(a==1){
		name=$("#search2").val();
		jifen=$("#jifen2").val();
	}
	else{
		name=$("#search3").val();
		jifen=$("#jifen3").val();
	}
	if(name=="" || jifen=="") {alert("填写错误！");return;}
	
	$(b).html("执行中...");
	$("#sure").css("pointer-events", "none");
	$.ajax({
		type : "POST",
		url : "koujifen.do",
		data : {name:name,jifen:jifen,nn:a},
		dataType : "text",
		success : function(data) {
			console.log(data);
			$(b).html("确定");
			$("#sure").css("pointer-events", "");
			if(data=="err"){alert("号码不存在！");}
			else{
				alert("操作成功！");
				window.location.href="Chat.do";
			}
				
		},
		error : function(e) {
			alert("发布错误！！");
			$(b).html("确定");
			$("#sure").css("pointer-events", "");
		}
	});
	
}

var open=false;
$("#userli").click(function(){
	if(!open){
		$("#newnav li").css("display","block");
		open=true;
	}
	else if(open){
		$("#newnav li").css("display","none");
		open=false;
	}
});
$("#jobli").click(function(){
	if(!open){
		$("#jobnav li").css("display","block");
		open=true;
	}
	else if(open){
		$("#jobnav li").css("display","none");
		open=false;
	}
})

//页数
function index(a,b){
	if(a<=0){alert("前一页没有了！"); return;}
	if(a>b){alert("下一页没有了！"); return;}
	
	var offSet=a;
	var pageSize=5;
	
	$.ajax({
		type : "POST",
		url : "Chat.do",
		data : {offSet:offSet,pageSize:pageSize},
		dataType : "text",
		success : function(data) {
			console.log(data);
			$('body').html(data);
			
		},
		error : function(e) {
			alert("发布错误！！");
		}
	});
}
//跳转
function tran(a){
	var i=$("#trans").val();
	if(i>a || i<=0 ||i==null ||i==NaN ||i==""){alert("找不到数据！");return;}
	
	var offSet=i;
	var pageSize=5;
	
	$.ajax({
		type : "POST",
		url : "Chat.do",
		data : {offSet:offSet,pageSize:pageSize},
		dataType : "text",
		success : function(data) {
			console.log(data);
			$('body').html(data);
			
			//window.location.href="myOder.do";
		},
		error : function(e) {
			alert("发布错误！！");
		}
	});
}

</script>
</html>