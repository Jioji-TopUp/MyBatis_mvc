<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/style.css">
	
</head>

<body>
	<form action="./log" method="post">
	username<input type="text" name="loginName" id="loginName"><br/>
	password<input type="password" name="passWord" id="passWord"><br/>
	<input type="submit">
	</form>
	
	

<!-- <script type="text/javascript" src="res/js/jquery-1.10.2.js"></script> 
<script type="text/javascript">
	function dong(){
		var loginName= $("#loginName").val();
		var passWord=$("#passWord").val();

		$
					.ajax({
						type : "post",
						url : "./log",
						dataType : 'json',
						data : {
							loginName:loginName,
							passWord:passWord,
						},
						success : function(json) {
							alert("success");
						},
						beforeSend : function() {

						},
						complete : function(XMLHttpRequest, textStatus) {

						},
						error : function() {
							alert("error");
						}
					});
		} -->

	



</script>

</body>

</html>
