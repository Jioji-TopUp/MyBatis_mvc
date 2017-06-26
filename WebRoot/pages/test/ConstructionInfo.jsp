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

<title>My JSP 'ConstructionInfo.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<form:form action="addConstructionInfo" method="post"
		modelAttribute="constructionInfoForm">
		
		
		title:<input type="text" name="title">
		<br>
		decribe:<input type="text" name="decribe">
		<br>
		main_pic_id:<input type="text" name="main_pic_id">
		<br>
		userid:<input type="text" name="userid">
		<br>
		resourse:<input type="text" name="resourse">
		<br>
		location:<input type="text" name="location">
		<br>
		lon:<input type="text" name="lon">
		<br>
		lat:<input type="text" name="lat">
		<br>

		<input type="submit" value="Submit" />
	</form:form>
</body>
</html>
