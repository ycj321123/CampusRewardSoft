<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Tables - Ready Bootstrap Dashboard</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css">
<link rel="stylesheet" href="${ctx}/css/ready.css">
<link rel="stylesheet" href="${ctx}/css/demo.css">
<script type="text/javascript" charset="utf-8"
	src="${ctx}/js/plugin/edit/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${ctx}/js/plugin/edit/ueditor.all.min.js">
	
</script>
<script type="text/javascript" charset="utf-8"
	src="${ctx}/js/plugin/edit/zh-cn.js"></script>
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
							<li class="newli"><a href="jobManager.do">任务发布审核</a></li>
							<li class="newli"><a href="jobPublishManager.do">任务发布表</a></li>
							<li class="newli"><a href="jobReceiveManager.do">任务接收表</a></li>
							<li class="newli"><a href="jobTuiJianManager.do">任务推荐</a></li>
						</ul></li>
					<li class="nav-item"><a href="oderManager.do"> <i
							class="la la-th"></i>
							<p>订单管理</p>
					</a></li>
					<li class="nav-item active"><a href="msg.do"> <i
							class="la la-bell"></i>
							<p>消息管理</p>
					</a></li>
					<li class="nav-item"><a href="Chat.do"> <i
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
				<div id="lookText"
							style="z-index:99;border-radius: 10px; border: 1px solid #ccc; display: none; position: fixed; top: 100px; right: 15%; height: 500px; float: left; width: 50%; background: #ffa; padding: 5px; overflow: scroll;">
							<span id="closeText"
								style="float: right; padding: 5px; background: red;">关闭</span>
							<h7 id="title" style="color:#000;font-size:20px;">asdfasfafa</h7>
							<div id="content">asdfgasfiashui</div>
							<div id="textimg" style="margin-top: 5px;"></div>
						</div>
					<div class="card">
						
						<div class="card-header">
							<h4 class="card-title">消息管理</h4>
							<p class="card-category">${loginAdmin.getAccount()},${loginAdmin.getEmail()}</p>
						</div>
						<div class="card-body">
							<ul class="nav nav-pills nav-primary">
								<li class="nav-item"><a class="nav-link active"
									id="nav-link1" onclick="caozuo(0)">收到消息 <span
										class="badge badge-success"
										style="margin: 0px; padding: 0px; font-size: 15px; background: none;color:red;">${count}</span></a>
								</li>
								<li class="nav-item"><a class="nav-link" id="nav-link2"
									onclick="caozuo(1)">发送邮件</a></li>
								<li class="nav-item"><a class="nav-link" id="nav-link3"
									onclick="caozuo(2)">发送通知</a></li>
							</ul>
						</div>
					</div>
					<div class="card" id="receiveEmail"
						style="max-height: 500px; overflow-x: hidden; overflow: scroll;">
						<div class="card-body">
							<table class="table table-typo">
								<tbody>
									<c:forEach items="${wholist}" var="wholist">
										<tr style="border-bottom: 1px solid #ccc;"
											onclick="lookMsg(${wholist.getPm().getpMsgid()})">
											<td>
												<p>${wholist.getUi().getNickname()}
													${wholist.getUi().getUaccount()}</p>
											</td>
											<td><span class="h6">${wholist.getPm().getpContent()} <span style="font-size: 15px; float: right;color:#339aff;">${wholist.getPm().getpTime()}</span></span></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="card" id="sendMsgAndEmail" style="display: none;">
						<div style="padding: 10px;">
							接收人：<input type="text" id="who" style="width: 50%; padding: 5px;">
						</div>
						<script id="editor" type="text/plain"
							style="width: 100%; height: 300px;"></script>
						<div style="padding: 10px;">
							<button id="send"
								style="outline: none; background: #339aff; border: none; padding: 5px 35px; border-radius: 10px;">发送</button>
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
<script src="${ctx}/js/plugin/chartist/plugin/chartist-plugin-tooltip.min.js"></script>
<script src="${ctx}/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
<script src="${ctx}/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
<script src="${ctx}/js/plugin/jquery-mapael/jquery.mapael.min.js"></script>
<script src="${ctx}/js/plugin/jquery-mapael/maps/world_countries.min.js"></script>
<script src="${ctx}/js/plugin/chart-circle/circles.min.js"></script>
<script src="${ctx}/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
<script src="${ctx}/js/ready.min.js"></script>
<script>
function lookMsg(a){
	$("#lookText").css("display", "block");
	$(".card-body").css("pointer-events", "none");
	$("#textimg").html("");
	$
			.ajax({
				type : "POST",
				url : "lookMsg.do",
				data : {
					msgid : a
				},
				dataType : "json",
				success : function(data) {
					console.log(data);
					$("#title").html(data.pAccount);
					$("#content").html(data.pContent);
					$("#textimg").html("");
				},
				error : function(e) {
					alert("错误！！");
				}
			});
}

function caozuo(a){
	if(a==0){
		$("#receiveEmail").css("display","block");
		$("#sendMsgAndEmail").css("display","none");
		$("#nav-link1").addClass("active");
		$("#nav-link2").removeClass("active"); 
		$("#nav-link3").removeClass("active"); 
	}
	else if(a==1){
		$("#receiveEmail").css("display","none");
		$("#sendMsgAndEmail").css("display","block");
		$("#nav-link2").addClass("active");
		$("#nav-link1").removeClass("active"); 
		$("#nav-link3").removeClass("active"); 
	}
	else if(a==2){
		$("#receiveEmail").css("display","none");
		$("#sendMsgAndEmail").css("display","block");
		$("#nav-link3").addClass("active");
		$("#nav-link2").removeClass("active"); 
		$("#nav-link1").removeClass("active"); 
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

	
	$("#closeText").click(function() {
		$("#lookText").css("display", "none");
		$(".card-body").css("pointer-events", "");
	});

	$('#displayNotif')
			.on(
					'click',
					function() {
						var placementFrom = $(
								'#notify_placement_from option:selected').val();
						var placementAlign = $(
								'#notify_placement_align option:selected')
								.val();
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

						$.notify(content, {
							type : state,
							placement : {
								from : placementFrom,
								align : placementAlign
							},
							time : 1000,
						});
					});

	$('#displayNotif')
			.on(
					'click',
					function() {
						var placementFrom = $(
								'#notify_placement_from option:selected').val();
						var placementAlign = $(
								'#notify_placement_align option:selected')
								.val();
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

						$.notify(content, {
							type : state,
							placement : {
								from : placementFrom,
								align : placementAlign
							},
							time : 1000,
						});
					});
</script>

<script type="text/javascript">
	//实例化编辑器
	//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
	var ue = UE.getEditor('editor');

	function isFocus(e) {
		alert(UE.getEditor('editor').isFocus());
		UE.dom.domUtils.preventDefault(e)
	}
	function setblur(e) {
		UE.getEditor('editor').blur();
		UE.dom.domUtils.preventDefault(e)
	}
	function insertHtml() {
		var value = prompt('插入html代码', '');
		UE.getEditor('editor').execCommand('insertHtml', value)
	}
	function createEditor() {
		enableBtn();
		UE.getEditor('editor');
	}
	function getAllHtml() {
		alert(UE.getEditor('editor').getAllHtml())
	}
	function getContent() {
		var arr = [];
		arr.push("使用editor.getContent()方法可以获得编辑器的内容");
		arr.push("内容为：");
		arr.push(UE.getEditor('editor').getContent());
		alert(arr.join("\n"));
	}
	function getPlainTxt() {
		var arr = [];
		//arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
		//arr.push("内容为：");
		arr.push(UE.getEditor('editor').getPlainTxt());
		//alert(arr.join('\n'))
	}
	function setContent(isAppendTo) {
		var arr = [];
		arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
		UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
		alert(arr.join("\n"));
	}
	function setDisabled() {
		UE.getEditor('editor').setDisabled('fullscreen');
		disableBtn("enable");
	}

	function setEnabled() {
		UE.getEditor('editor').setEnabled();
		enableBtn();
	}

	function getText() {
		//当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
		var range = UE.getEditor('editor').selection.getRange();
		range.select();
		var txt = UE.getEditor('editor').selection.getText();
		alert(txt)
	}

	function getContentTxt() {
		var arr = [];
		//arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
		//arr.push("编辑器的纯文本内容为：");
		arr.push(UE.getEditor('editor').getContentTxt());
		//alert(arr.join("\n"));
	}
	function hasContent() {
		var arr = [];
		arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
		arr.push("判断结果为：");
		arr.push(UE.getEditor('editor').hasContents());
		alert(arr.join("\n"));
	}
	function setFocus() {
		UE.getEditor('editor').focus();
	}
	function deleteEditor() {
		disableBtn();
		UE.getEditor('editor').destroy();
	}
	function disableBtn(str) {
		var div = document.getElementById('btns');
		var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
		for (var i = 0, btn; btn = btns[i++];) {
			if (btn.id == str) {
				UE.dom.domUtils.removeAttributes(btn, [ "disabled" ]);
			} else {
				btn.setAttribute("disabled", "true");
			}
		}
	}
	function enableBtn() {
		var div = document.getElementById('btns');
		var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
		for (var i = 0, btn; btn = btns[i++];) {
			UE.dom.domUtils.removeAttributes(btn, [ "disabled" ]);
		}
	}

	function getLocalData() {
		alert(UE.getEditor('editor').execCommand("getlocaldata"));
	}

	function clearLocalData() {
		UE.getEditor('editor').execCommand("clearlocaldata");
		alert("已清空草稿箱")
	}
	
	$("#send").click(function(){
		var who=$("#who").val();
		var txt=UE.getEditor('editor').getContentTxt();
		var mark=$(".nav-link.active").html();
		$("#send").html("发送中...");
		$(".card").css("pointer-events","none");
		$
				.ajax({
					type : "POST",
					url : "sendMsg.do",
					data : {
						who : who,
						txt:txt,
						mark:mark
					},
					dataType : "json",
					success : function(data) {
						if(data=="err") {
							alert("账号不存在！");
							$("#send").html("发送");
							$(".card").css("pointer-events","");
						}
						else {
							alert("发送成功");
							$("#send").html("发送");
							$(".card").css("pointer-events","");
						}
					},
					error : function(e) {
						alert("错误！！");
					}
				});
	});

</script>
</html>