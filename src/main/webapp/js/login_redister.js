/**
 * 
 */
/*
 * 自定义内部状态码
 * 200：成功
 * 4040：错误
 */
var in_code=0;

// 获取错误提示框id
var alert_txt = document.getElementById("alert_txt");

// error_info数组存放错误信息位置0:name, 1:phone, 2:email, 3:pass
var error_info = [ 0, 0, 0, 0 ]; // 1表示错误,0表示正确

// 设置错误提示框css格式
function codefans() {
	// 获取可见区域宽,高
	var h = document.body.offsetHeight;
	var w = document.body.offsetWidth;

	alert_txt.style.top = (h / 6 * 2.5) + "px";
	alert_txt.style.left = 0 + "px";
	alert_txt.style.padding = (h /48) + "px";
	alert_txt.style.width = (w / 2) + "px";
	alert_txt.style.display = "";
}

// 隐藏错误提示框
function codehide() {
	alert_txt.style.display = "none";
}

//确定与取消提示框
var myConform = function() {
	alert_txt.innerHTML = "<b>修改提示:</b><br/>是否确定修改密？<br/><br/>"
			+ "<button class='is_ok' style='margin-right:0.4rem;' onclick='isOpenPage(200);'>确定</button>"
			+ "<button class='is_ok' style='margin-left:0.4rem;' onclick='isOpenPage(4040);'>取消</button>";
	setTimeout("codefans()", 0);
}

//打开指定页面
function isOpenPage(page){
	if(page==4040){
		in_code==4040;
		return check_all3(4040);
	}		
	else{
		in_code=200;
		document.getElementById("form_u").submit();
		//return check_all3(200);
	}
		
}

// 检查注册页面
function check_all(a) {
	var my_phonereg = /^[1][3,4,5,7,8][0-9]{9}$/;
	var my_emailreg = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;

	// 检查昵称
	if (a.username.value.trim().length <= 0) {
		alert_txt.innerHTML = "昵称不能为空!";
		setTimeout("codefans()", 0);
		setTimeout("codehide()", 2000);
		return false;
	}

	// 检查手机号
	if (!a.account.value.match(my_phonereg)) {
		alert_txt.innerHTML = "手机格式错误!";
		setTimeout("codefans()", 0);
		setTimeout("codehide()", 2000);
		return false;
	}

	// 验证邮箱
	if (!a.email.value.match(my_emailreg)) {
		alert_txt.innerHTML = "邮箱格式错误!";
		setTimeout("codefans()", 0);
		setTimeout("codehide()", 2000);
		return false;
	}

	// 检查密码
	if (a.password.value.trim().length <= 0) {
		alert_txt.innerHTML = "密码不能为空!";
		setTimeout("codefans()", 0);
		setTimeout("codehide()", 2000);
		return false;
	}
	return true;
}

// 检查登陆login.jsp
function check_all0(a) {

	// 帐号
	if (a.account.value.trim().length <= 0) {
		alert_txt.innerHTML = "账号不可为空!";
		setTimeout("codefans()", 0);
		setTimeout("codehide()", 2000);
		return false;
	}

	// 检查密码
	if (a.password.value.trim().length <= 0) {
		alert_txt.innerHTML = "密码不能为空!";
		setTimeout("codefans()", 0);
		setTimeout("codehide()", 2000);
		return false;
	}
	
	return true;
		
}

// 检查验证页面forget_pass.jsp
function check_all2(a) {
	var my_phonereg = /^[1][3,4,5,7,8][0-9]{9}$/;
	var my_emailreg = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
	// 检查手机号
	if (!(a.account.value.match(my_phonereg)
			|| a.account.value.match(my_emailreg))) {
		alert_txt.innerHTML = "账号格式错误!";
		setTimeout("codefans()", 0);
		setTimeout("codehide()", 2000);
		return false;
	}

	// 检查验证码
	if (a.testcode.value.trim().length != 6) {
		alert_txt.innerHTML = "验证码输入错误!";
		setTimeout("codefans()", 0);
		setTimeout("codehide()", 2000);
		return false;
	}
	if(document.getElementById("hid").value.trim().length == 2){
		alert_txt.innerHTML = "账号不存在或验证码错误！";
		setTimeout("codefans()", 0);
		setTimeout("codehide()", 2000);
		return false;
	}
	document.getElementById("hid").value = "";
	return true;
}

// 检查修改密码
var check_all3=function (a) {
	if(a==4040){
		setTimeout("codehide()", 0);
		return false;
	}
	if(a==200){
		return true;
	}
	// 检查密码
	if (a.password.value.trim().length <= 0) {
		alert_txt.innerHTML = "密码不能为空!";
		setTimeout("codefans()", 0);
		setTimeout("codehide()", 2000);
		return false;
	}

	// 再次检查密码
	if (a.password.value != a.repassword.value) {
		alert_txt.innerHTML = "两次密码不一致!";
		setTimeout("codefans()", 0);
		setTimeout("codehide()", 2000);
		return false;
	}
	
	if(in_code==0){
		alert_txt.innerHTML = "<b>修改提示:</b><br/>是否确定修改密？<br/><br/>"
			+ "<button class='is_ok' style='margin-right:0.4rem;' onclick='isOpenPage(200);'>确定</button>"
			+ "<button class='is_ok' style='margin-left:0.4rem;' onclick='isOpenPage(4040);'>取消</button>";
		setTimeout("codefans()", 0);		
		return false;
	}	
	if(in_code==4040){
		setTimeout("codehide()", 2000);
		return false;
	}
    return true;
}