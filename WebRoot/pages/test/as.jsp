<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC  "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'FaultPostForMobile.jsp' starting page</title>

<script type="text/javascript" src="./res/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="./res/js/jquery-ui-1.10.3.min.js"></script>
<link rel="stylesheet" href="./res/css/jquery-ui.min.css" type="text/css"></link>
<link rel="stylesheet" href="./res/css/product.css" type="text/css"></link>
<style type="text/css">
#dialog {
	display: none;
	font-size: 12;
}
</style>
<script type="text/javascript">
	function prom() {
		// var name=prompt("请输入您的名字","");

		$("#dialog").dialog();
		if (name) {
			alert("欢迎您：" + name);
		}
	}

	function keleyidialog() {
		$("#dialog").dialog({
			resizable : true,
			height : 350,
			width : 450,

			modal : true,

			buttons : {
				"确定" : function() {
					prom();
					document.getElementById("formgetAllTables").submit();
				},
				"取消" : function() {
					$(this).dialog("close");
				}
			}
		});
	}
</script>

</head>
<body>

	
		<input class="button" type="button" onclick="keleyidialog()"
			value="添加数据" />
	<div id="dialog" title="导入中。。">123123</div>
	</div>
</body>
</html>
