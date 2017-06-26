
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>Title</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link rel="stylesheet" href="./res/css/product.css" type="text/css"></link>
</head>
<script type="text/javascript" src="res/js/jquery-1.10.2.js"></script>

<script type="text/javascript">
	function js_enterprise_name() {
		var regist_enterprise_name = $("#regist_enterprise_name").val();
		if (regist_enterprise_name.length > 0) {
			$("#regist_enterprise_nameReturn")
					.html(
							"<img src=\"../zykyNew/res/images/left/reg-menu.gif\"  /> ");
			return true;
		}
	}

	function address() {
		var regist_location = $("#regist_location").val();
		if (regist_location.length > 0) {
			$("#regist_locationReturn")
					.html(
							"<img src=\"../zykyNew/res/images/left/reg-menu.gif\"  /> ");
			return true;
		}
	}
	function js_email() {
		var regist_email = $("#regist_email").val();
		var youxiang = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
		var flagPwd = youxiang.test(regist_email);
		if (regist_email.length > 0) {

			if (flagPwd == true) {

				
						$.ajax({
							type : "get",
							url : "./ifHasSameEmail",
							dataType : 'json',
							async:false,
							data : {
								email : regist_email,
							},
							success : function(json) {

								var code = json["code"];
								if (code == '0') {
									$("#regist_emailReturn")
											.html(
													"<img src=\"../zykyNew/res/images/left/reg-menu.gif\"   />");
									ifemail= true;
								} else {
									$("#regist_emailReturn").html("邮箱已注册");
									ifemail= false;
								}

							},
							beforeSend : function() {

							},
							complete : function(XMLHttpRequest, textStatus) {

							},
							error : function() {

							}

						});
						
						return ifemail;

			} else {
				$("#regist_emailReturn").html("邮箱格式不正确");
				return false;
			}
		}
	}
	function js_user_name() {
		var regist_user_name = $("#regist_user_name").val();

		if (regist_user_name.length > 0) {

			$("#regist_user_nameReturn")
					.html(
							"<img src=\"../zykyNew/res/images/left/reg-menu.gif\"  /> ");
			return true;
		}
	}
	function js_telephone() {
		var regist_telephone = $("#regist_telephone").val();
		var phone = /^1(3|4|5|7|8)\d{9}$/;
		var flagPwd = phone.test(regist_telephone);
		if (regist_telephone.length > 0) {
			if (flagPwd == true) {

						$.ajax({
							type : "get",
							url : "./ifHasSameTelephone",
							dataType : 'json',
							async:false,
							data : {
								telephone : regist_telephone,
							},
							success : function(json) {

								var code = json["code"];
								if (code == '0') {
									$("#regist_telephoneReturn")
											.html(
													"<img src=\"../zykyNew/res/images/left/reg-menu.gif\"   />");
									 iftelephone= true;
								} else {
									$("#regist_telephoneReturn").html("手机号已注册");
									 iftelephone= false;
								}

							},
							beforeSend : function() {

							},
							complete : function(XMLHttpRequest, textStatus) {

							},
							error : function() {

							}

						});
						
						
					return iftelephone;	
					
						

			} else {
				$("#regist_telephoneReturn").html("无效的手机号码");
				return false;
			}
		}
	}

	function js_password() {

		var a = $("#regist_pwd").val();
		var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,12}$/;
		var flagPwd = reg.test(a);

		if (a.length > 0) {

			if (flagPwd == true) {
				$("#regist_pwdReturn")
						.html(
								"<img src=\"../zykyNew/res/images/left/reg-menu.gif\"  /> ");
				return true;
			} else {
				$("#regist_pwdReturn").html("密码必须由 6-12位字母、数字组成.");
				return false;
			}
		}

	}

	function passwordtwo() {

		var flagPwdtwo = $("#regist_pwdtwo").val();
		var flagPwd = $("#regist_pwd").val();

		if (flagPwdtwo != flagPwd) {

			$("#regist_pwdtwoReturn").html("两次密码输入不一致");
			return false;

		} else {

			$("#regist_pwdtwoReturn")
					.html(
							"<img src=\"../zykyNew/res/images/left/reg-menu.gif\"  /> ");
			return true;
		}

	}

	function regist_register() {

		var regist_enterprise_name = $("#regist_enterprise_name").val();
		var regist_location = $("#regist_location").val();
		var regist_email = $("#regist_email").val();
		var regist_user_name = $("#regist_user_name").val();
		var regist_pwdtwo = $("#regist_pwdtwo").val();
		var regist_pwd = $("#regist_pwd").val();
		var regist_telephone = $("#regist_telephone").val();
		if (regist_enterprise_name.length == 0) {
			$("#regist_enterprise_nameReturn").html("企业名称未填写");

		}
		if (regist_location.length == 0) {
			$("#regist_locationReturn").html("企业地址未填写");

		}
		if (regist_email.length == 0) {
			$("#regist_emailReturn").html("注册邮箱未填写");

		}
		if (regist_user_name.length == 0) {
			$("#regist_user_nameReturn").html("注册用户名未填写");

		}
		if (regist_telephone.length == 0) {
			$("#regist_telephoneReturn").html("注册电话未填写");

		}

		if (regist_pwd.length == 0) {
			$("#regist_pwdReturn").html("密码未填写");

		}
		if (regist_pwdtwo.length == 0) {
			$("#regist_pwdtwoReturn").html("确认密码还未填写");

		}

		if (js_password() == true && passwordtwo() == true
				&& js_enterprise_name() == true && address() == true
				&&js_email() == true&& js_user_name() == true
				&&js_telephone()==true) {


			$("#regist_form").submit();

		} else {

			return false;
		}


  
	}
</script>

<body class="bg-1">
	<div style="width:100%;height:100%;">
		<div
			style="width:100%;height:50px;text-align:center;padding-top:2%;font-family: Microsoft Yahei">
			<font color="white" size="20">注册</font>
		</div>

		<div style="width:100%;height:70%;padding-top:2%">
			<div style="width:332px;margin:0 auto;">
				<form action="mainUserAddUserAndEnterprise" method="post"
					modelAttribute="t_user,t_enterprise" name="regist_form"
					id="regist_form">
					<font color="white"> <input class="form-control regist"
						placeholder="企业名称 " type="text" name="enterprise_name"
						id="regist_enterprise_name" ONBLUR="javascript:js_enterprise_name()">
						<div style="height: 20px;" id="regist_enterprise_nameReturn"></div>
						<input class="form-control regist" placeholder=" 地址" type="text"
						name="location" id="regist_location"
						ONBLUR="javascript:address()">
						<div style="height: 20px;" id="regist_locationReturn"></div> <input
						class="form-control regist" placeholder="邮箱" type="text"
						name="email" id="regist_email" ONBLUR="javascript:js_email()">
						<div style="height: 20px;" id="regist_emailReturn"></div> <input
						class="form-control regist" placeholder="用户名" type="text"
						name="user_name" id="regist_user_name"
						ONBLUR="javascript:js_user_name()">
						<div style="height: 20px;" id="regist_user_nameReturn"></div> <input
						class="form-control regist" placeholder="密码" type="password"
						name="pwd" id="regist_pwd" ONBLUR="javascript:js_password()">
						<div style="height: 20px;" id="regist_pwdReturn"></div> <input
						class="form-control regist" placeholder="确认密码" type="password"
						name="regist_pwdtwo" id="regist_pwdtwo"
						ONBLUR="javascript:passwordtwo()">
						<div style="height: 20px;" id="regist_pwdtwoReturn"></div> <input
						class="form-control regist" placeholder="电话" type="text"
						name="telephone" id="regist_telephone"
						ONBLUR="javascript:js_telephone()">
						<div style="height: 20px;" id="regist_telephoneReturn"></div> <select
						class="form-control regist" name="sex">
							<option value="男">男</option>
							<option value="女">女</option>
					</select><br>
					<input style="margin:0 0 0 0px;" class="button btn-blue login" type="button"
						name="regist_bitton" id="regist_bitton"
						onclick="regist_register()" value="添加新用户">
						<input style="margin:20px 0 0 0px;" class="button btn-blue login" type="button"
						name="" id=""
						onclick="window.location.href='./pages/user/userLogin.jsp'" value="返            回">
					 <br> </font>
				</form>
				
			</div>
		</div>
	</div>

	<div class="reg_footbox"
		style="width:100%;height:15%;margin:0 0 0 -9px;z-index:-10;">
		<p>
			<span>COPYRIGHT&nbsp;©&nbsp;2016 – 2016 SinoCBD. ALL RIGHTS
				RESERVED. </span> 中云开源数据技术(上海)有限公司版权所有
		</p>
		<p>沪ICP证000000号&nbsp;经营许可证编号:沪网文[2016]0000-000号</p>
	</div>
</body>
</html>
