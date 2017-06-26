<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'FaultPostForMobile.jsp' starting page</title>

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

<body>
<div class="right-box-content">
	<form:form action="mobilePostAppResource" method="post"
		enctype="multipart/form-data" >
		
		<input class="form-control addinfo" placeholder="versionname" type="text" name="versionname">(versionname)<br><br>
		
		
		<input type="file" name="file" /> 
	

		<input class="button" type="submit" value="Submit" />
	</form:form>
	</div>
</body>
</html>
