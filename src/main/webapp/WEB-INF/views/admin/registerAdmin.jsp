<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>Ready Bootstrap Dashboard</title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
	<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
	<link rel="stylesheet" href="${ctx}/css/ready.css">
	<link rel="stylesheet" href="${ctx}/css/demo.css">
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
						
						<li class="nav-item dropdown">
							<a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#" aria-expanded="false"> <img src="${ctx}/images/user_headImage/${ui.getHeadsrc()}" alt="user-img" width="36" class="img-circle"><span >${ui.getNickname()}</span></span> </a>
							<ul class="dropdown-menu dropdown-user">
								<li>
									<div class="user-box">
										<div class="u-img"><img src="${ctx}/images/user_headImage/${ui.getHeadsrc()}" alt="user"></div>
										<div class="u-text">
											<h4>${ui.getNickname()}</h4>
											<p class="text-muted">${ui.getUaccount()} ${loginAdmin.getEmail()}</p></div>
										</div>
									</li>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="myui.do" onclick="myui()"><i class="ti-user"></i> 个人资料</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="loginout.do"><i class="fa fa-power-off"></i> 退出登陆</a>
								</ul>
								<!-- /.dropdown-user -->
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
							<a class="" data-toggle="collapse" href="#collapseExample" aria-expanded="true">
								<span>
									${ui.getNickname()}
									<span class="user-level">管理员</span>
									<span class="caret"></span>
								</span>
							</a>
							<div class="clearfix"></div>

							<div class="collapse in" id="collapseExample" aria-expanded="true" style="">
								<ul class="nav">
									<li>
										<a href="myui.do">
											<span class="link-collapse">个人资料</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<ul class="nav">
						<li class="nav-item active">
							<a href="registerAdmin.do">
								<i class="la la-dashboard"></i>
								<p>注册管理员</p>
								<span class="badge badge-count">5</span>
							</a>
						</li>
						<li class="nav-item">
							<a href="userManager.do">
								<i class="la la-table"></i>
								<p>用户管理</p>
								<span class="badge badge-count">14</span>
							</a>
						</li>
						<li class="nav-item">
							<a href="jobManager.do">
								<i class="la la-keyboard-o"></i>
								<p>任务管理</p>
								<span class="badge badge-count">50</span>
							</a>
						</li>
						<li class="nav-item">
							<a href="oderManager.do">
								<i class="la la-th"></i>
								<p>订单管理</p>
								<span class="badge badge-count">6</span>
							</a>
						</li>
						<li class="nav-item">
							<a href="msg.do">
								<i class="la la-bell"></i>
								<p>消息管理</p>
								<span class="badge badge-success">3</span>
							</a>
						</li>
						<li class="nav-item">
							<a href="Chat.do">
								<i class="la la-font"></i>
								<p>信誉积分管理</p>
								<span class="badge badge-danger">25</span>
							</a>
						</li>
						<li class="nav-item">
							<a href="other.do">
								<i class="la la-fonticons"></i>
								<p>实名认证审核</p>
							</a>
						</li>
						<li class="nav-item update-pro">
							<button  data-toggle="modal" data-target="#modalUpdate">
								<i class="la la-hand-pointer-o"></i>
								<p>Update To Pro</p>
							</button>
						</li>
					</ul>
				</div>
			</div>
			<div class="main-panel">
				<div class="content">
					<div class="container-fluid" id="container-fluid1">
						<h4 class="page-title">注册管理员</h4>
						<div class="row">
							<div class="col-md-10">
									<div class="card">
										<div class="card-header">
											<div class="card-title">填写管理员账号</div>
										</div>
										<div class="card-body">
											<div class="form-group">
												<label for="squareInput">手机号：</label>
												<input type="text" class="form-control input-square" name="account" id="squareInput" placeholder="输入手机号">
											</div>
											<div class="form-group">
												<label for="squareInput">邮箱：</label>
												<input type="text" class="form-control input-square" name="email" id="squareInput" placeholder="输入邮箱">
											</div>
											<div class="form-group">
												<label for="squareInput">设置密码：</label>
												<input type="text" class="form-control input-square" name="pass" id="squareInput" placeholder="设置密码">
											</div>
										</div>
										
										<div class="card-header">
											<div class="card-title">填写用户资料</div>
										</div>
										<div class="card-body">
											<div class="form-group">
												<label for="squareInput">真实姓名：</label>
												<input type="text" class="form-control input-square" name="realName" id="squareInput" placeholder="输入手机号">
											</div>
											<div class="form-group">
												<label for="squareInput">昵称：</label>
												<input type="text" class="form-control input-square" name="nickName" id="squareInput" placeholder="输入邮箱">
											</div>
											<div class="form-group">
												<label for="squareSelect">性别</label>
												<select class="form-control input-square" id="squareSelect">
													<option>男</option>
													<option>女</option>
												</select>
											</div>
											<div class="form-group">
												<label for="squareInput">所在地：</label>
												<input type="text" class="form-control input-square" name="Addr" id="squareInput" placeholder="填写所在地">
											</div>
										</div>
										
										<div class="card-header">
											<div class="card-title">填写学籍</div>
										</div>
										<div class="card-body">
											<div class="form-group">
												<label for="squareInput">学校名称：</label>
												<input type="text" class="form-control input-square" name="schoolName" id="squareInput" placeholder="输入学校名称">
											</div>
											<div class="form-group">
												<label for="squareInput">院系：</label>
												<input type="text" class="form-control input-square" name="yuanxi" id="squareInput" placeholder="输入院系">
											</div>
											<div class="form-group">
												<label for="squareInput">专业：</label>
												<input type="text" class="form-control input-square" name="zhuanye" id="squareInput" placeholder="输入专业">
											</div>
											<div class="form-group">
												<label for="squareInput">学历：</label>
												<input type="text" class="form-control input-square" name="xueli" id="squareInput" placeholder="输入学历">
											</div>
											<div class="form-group">
												<label for="squareInput">入学年份：</label>
												<input type="text" class="form-control input-square" name="ruxueyear" id="squareInput" placeholder="输入入学年份">
											</div>
										</div>
										<div class="card-action">
											<button class="btn btn-success" style="width: 20%;">提交</button>
										</div>
									</div>
										
									
								</div>
								
								
						</div>
						
						
					</div>					
					
				</div>
				<footer class="footer">
					<div class="container-fluid">
						地址：广东省广州市从化区经济开发区高技术产业园广从南路548号 | 电话：020－87818918 传真：87818020 邮编：510990 | 网站公安备案编号：4401840100050
					</div>
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
<script src="${ctx}/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
<script src="${ctx}/js/ready.min.js"></script>
<script src="${ctx}/js/demo.js"></script>
<script type="text/javascript">
function myui(){
	
}

</script>
</html>