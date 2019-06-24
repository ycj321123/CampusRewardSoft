<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>订单</title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
	<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
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
											<p class="text-muted">${ui.getUaccount()}</p>
											<p class="text-muted">${loginAdmin.getEmail()}</p>
										</div>
									</div>
								</li>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="myui.do"><i class="ti-user"></i>
									个人资料</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#"><i class="fa fa-power-off"></i>
									退出登陆</a>
							</ul> <!-- /.dropdown-user --></li>
						</li>
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
							<li class="newli"><a href="studentStatesManager.do">用户学籍表</a></li>
						</ul></li>
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
						<li class="nav-item active" >
							<a href="oderManager.do">
								<i class="la la-th"></i>
								<p>订单管理</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="msg.do">
								<i class="la la-bell"></i>
								<p>消息管理</p>
							
							</a>
						</li>
						<li class="nav-item">
							<a href="Chat.do">
								<i class="la la-font"></i>
								<p>信誉积分管理</p>
								
							</a>
						</li>
						<li class="nav-item">
							<a href="other.do">
								<i class="la la-fonticons"></i>
								<p>实名认证审核</p>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="main-panel">
				<div class="content">
					<div class="container-fluid">
						<div class="card">
						<div class="card-header">
							<div class="card-title">用户订单表</div>
						</div>
						<div id="lookText"
							style="border-radius: 10px; border: 1px solid #ccc; display: none; position: fixed; top: 100px; right: 15%; height: 500px; float: left; width: 50%; background: #ffa; padding: 5px; overflow: scroll;">
							<span id="closeText"
								style="float: right; padding: 5px; background: red;">关闭</span>
							<h7 id="title" style="color:#000;font-size:20px;">asdfasfafa</h7>
							<div id="content">asdfgasfiashui</div>
							<div id="textimg" style="margin-top: 5px;"></div>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<div style="margin-bottom: 15px;">
									关键字搜索：<input type="text" id="search" style="width: 22%;"
										placeholder="搜索：订单号" style=" padding: 5px;" value="${name}"
										onchange="search()" />
								</div>
								<table class="table table-bordered" id="table">
									<thead>
										<tr>
											<th>序号</th>
											<th>订单编号</th>
											<th>任务</th>
											<th>发布者账号</th>
											<th>任务创建时间</th>
											<th>任务期限</th>
											<th>任务价格</th>
											<th>接收者账号</th>
											<th>接收时间</th>
											<th>提交时间</th>
											<th>交易状态</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${page.getDatas()}" var="page" varStatus="s">
											<tr style="text-align: center;">
												<th scope="row">${s.index +1}</th>
												<td>${page.getOder().getOderid()}</td>
												<td style="color: #339aff;"
													onclick="lookjob('${page.getOder().getPublish_job().getPId()}')">查看</td>
												<td>${page.getOder().getPublish_job().getpAccount()}</td>
												<td>${page.getOder().getPublish_job().getpTime()}</td>
												<td>${page.getOder().getPublish_job().getTimeLimit()}</td>
												<td>${page.getOder().getPublish_job().getPrice()}</td>
												<td>${page.getReceive_job().getrAccount()}</td>
												<td>${page.getReceive_job().getrTime()}</td>
												<td>${page.getReceive_job().getOkTime()}</td>
												<c:choose>
												<c:when test="${page.getOder().getPublish_job().getIsComplish() == 2}"><td style="color:green;">完成</td></c:when>
												<c:when test="${page.getOder().getPublish_job().getIsComplish() == 3}"><td style="color:red;">失败</td></c:when>
												<c:otherwise></c:otherwise>
												</c:choose>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="pageUl">
									<ul>
										<li onclick="index(${cur-1},${page.getPageEnd()})">上一页</li>
										<c:forEach begin="${page.getPageStart()}"
											end="${page.getPageEnd()}" varStatus="ss">
											<c:choose>
												<c:when test="${ss.index==cur}">
													<li class="cur"
														onclick="index(${ss.index},${page.getPageEnd()})">${ss.index}</li>
												</c:when>
												<c:otherwise>
													<li onclick="index(${ss.index},${page.getPageEnd()})">${ss.index}</li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<li onclick="index(${cur+1},${page.getPageEnd()})">下一页</li>
										<li style="float: left; background: #fff;">跳转到第<input
											type="text" size="3" id="trans"
											oninput="value=value.replace(/[^\d]/g,'')">页 <span
											style="background: #339aff; padding: 4px;"
											onclick="tran(${page.getPageEnd()})">跳转</span>&nbsp;&nbsp;&nbsp;
											&nbsp; &nbsp;总页数：${page.getTotalPage() }
										</li>

									</ul>
								</div>
							</div>
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
<script src="${ctx}/js/core/jquery.3.2.1.min.js"></script>
<script src="${ctx}/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<script src="${ctx}/js/core/popper.min.js"></script>
<script src="${ctx}/js/core/bootstrap.min.js"></script>
<script src="${ctx}/js/plugin/chartist/chartist.min.js"></script>
<script src="${ctx}/js/plugin/chartist/plugin/chartist-plugin-tooltip.min.js"></script>
<script src="${ctx}/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
<script src="${ctx}/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
<script src="${ctx}/js/plugin/jquery-mapael/jquery.mapael.min.js"></script>
<script src="${ctx}/js/plugin/jquery-mapael/maps/world_countries.min.js"></script>
<script src="${ctx}/js/plugin/chart-circle/circles.min.js"></script>
<script src="${ctx}/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
<script src="${ctx}/js/ready.min.js"></script>
<script>


//搜索
function  search(){
	var name=$("#search").val();
	if(name==null || name=="NAN") name="";
	
	var offSet=1;
	var pageSize=10;
	$.ajax({
		type : "POST",
		url : "oderManager.do",
		data : {name:name,offSet:offSet,pageSize:pageSize},
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
//页数
function index(a,b){
	if(a<=0){alert("前一页没有了！"); return;}
	if(a>b){alert("下一页没有了！"); return;}
	
	var name=$("#search").val();
	if(name==null || name==NaN) name="";
	
	var offSet=a;
	var pageSize=10;
	
	$.ajax({
		type : "POST",
		url : "oderManager.do",
		data : {name:name,offSet:offSet,pageSize:pageSize},
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
	
	var name=$("#search").val();
	if(name==null || name==NaN) name="";
	
	var offSet=i;
	var pageSize=10;
	
	$.ajax({
		type : "POST",
		url : "oderManager.do",
		data : {name:name,offSet:offSet,pageSize:pageSize},
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


function lookjob(a){
	$("#lookText").css("display","block");
	$(".card-body").css("pointer-events","none");
	$("#textimg").html("");
	$.ajax({
		type : "POST",
		url : "lookText.do",
		data :{pid:a},
		dataType : "json",
		success : function(data) {
			console.log(data);
			$("#title").html(data.pj.pTitle);
			$("#content").html(data.pj.pContent);
			
			if(data.img.length<=0) $("#textimg").html("");
			for(i in data.img){
				if(data.img.length>1)
					$("#textimg").append("<img src='${ctx}/images/job/"+data.img[i]+"' style='width:45%;height:200px;float:left;margin-right:5px;'>");
				else
					$("#textimg").append("<img src='${ctx}/images/job/"+data.img[i]+"' style='width:50%;float:left;margin-right:5px;'>");
			}
		},
		error : function(e) {
			alert("错误！！");
		}
	});
}

$("#closeText").click(function(){
	$("#lookText").css("display","none");
	$(".card-body").css("pointer-events","");
});





	$('#displayNotif').on('click', function(){
		var placementFrom = $('#notify_placement_from option:selected').val();
		var placementAlign = $('#notify_placement_align option:selected').val();
		var state = $('#notify_state option:selected').val();
		var style = $('#notify_style option:selected').val();
		var content = {};

		content.message = 'Turning standard Bootstrap alerts into "notify" like notifications';
		content.title = 'Bootstrap notify';
		if (style == "withicon") {
			content.icon = 'la la-bell';
		} else {
			content.icon = 'none';
		}
		content.url = 'index.html';
		content.target = '_blank';

		$.notify(content,{
			type: state,
			placement: {
				from: placementFrom,
				align: placementAlign
			},
			time: 1000,
		});
	});
</script>
</html>