<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<base href="<%=basePath%>">

<title>My JSP 'FaultPostForMobile.jsp' starting page</title>

<script type="text/javascript" src="./res/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="./res/js/jquery-ui-1.10.3.min.js"></script>
<link rel="stylesheet" href="./res/css/jquery-ui.min.css"
	type="text/css"></link>
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
			hide :" blind",
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

	function getProductList(page, interval) {
		window.location.href = "pages/test/test3.jsp";
		var start = (page - 1) * interval;

		$
				.ajax({
					type : "get",
					url : "./getAllTables",
					dataType : 'json',
					data : {
						//belongto_Enterprise_id:10001,
						jdbcDriver : org.gjt.mm.mysql.Driver,
						dbUrl : "jdbc:mysql://192.168.3.59:3306/SinoCBD",
						dbUsername : hadoop,
						password : hadoop,
					},
					success : function(json) {
						var m_str1 = "";
						m_str1 = "<table class='pro_table'><tr><th>表明</th><th>创建时间</th><th>操作</th></th>";
						var list = json["list"];
						alert(json);

					},
					beforeSend : function() {

					},
					complete : function(XMLHttpRequest, textStatus) {

					},
					error : function() {

					}
				});
	}
</script>

<body onload="keleyidialog()">
<!-- 
<div>
	<input class="button" type="button" onclick="keleyidialog()"
		value="添加数据" />
</div>
<div>
	<input class="button" type="button" onclick="getProductList(1,5)"
		value="查看数据" />
</div>

 -->
<div   id="dialog" title="添加">
	<form:form id="formgetAllTables" action="initConnectionPool"
		method="post" modelAttribute="dataSourseForm">

		<select class="form-control addinfo" name="jdbcDriver">
			<option value="org.gjt.mm.mysql.Driver">mysql</option>
			<option value="com.microsoft.sqlserver.jdbc.SQLServerDriver">sql
				server</option>
			<option value="oracle.jdbc.driver.OracleDriver">oracle</option>
		</select>dirver<br>
		<br>
		<input class="form-control addinfo" type="text" name="dbUrl">url<br>
		<br>
		<input class="form-control addinfo" type="text" name="dbUsername">username<br>
		<br>
		<input class="form-control addinfo" type="text" name="dbPassword">password<br>
		<br>

	</form:form>
</div>
</body>
