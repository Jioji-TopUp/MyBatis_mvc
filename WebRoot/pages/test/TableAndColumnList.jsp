<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="res/js/jquery-1.10.2.js"></script>
<script type="text/javascript">

	function getTableList() {
		$.ajax({
			type : "get",
			url : "./getAllTables",
			dataType : 'json',
			data : {
				jdbcDriver : "org.gjt.mm.mysql.Driver",
				dbUrl : "jdbc:mysql://192.168.3.59:3306/SinoCBD",
				dbUsername : "hadoop",
				dbPassword : "hadoop",
			},
			success : function(json) {
				var m_str1 = "";
				m_str1 = "<table class='pro_table'><tr><td>数据库表名</td><td>创建时间</td></tr>";
				for (var p in json) {
					m_str1 = m_str1
							+ "<tr style=\"background-color:#FFFFFF\" >";
					m_str1 = m_str1
							+ "<td style=\"width:212px;text-align: center;\" onclick=\"getColumnList('"+json[p].tablename+"')\" >"
							+ json[p].tablename + "</td>";
					m_str1 = m_str1
							+ "<td style=\"width:212px;text-align: center;\">"
							+ json[p].createtime + "</td>";
					
					m_str1=m_str1+"</tr>";
				}
				m_str1 =m_str1+"</table>";
				$("#TableList").html(m_str1);
				
			},
			beforeSend : function() {

			},
			complete : function(XMLHttpRequest, textStatus) {

			},
			error : function() {

			}
		});
	}
	
	function getColumnList(tablename){
		alert(tablename);
		$.ajax({
			type : "get",
			url : "./getTablecolumn",
			dataType : 'json',
			data : {
				tablename : tablename,
			},
			success : function(json) {
				
				var m_str1 = "";
				m_str1 = "<table class='pro_table'><tr><td>列名</td></tr>";
				for (var p in json) {
					m_str1 = m_str1
							+ "<tr style=\"background-color:#FFFFFF\" >";
					m_str1 = m_str1
							+ "<td style=\"width:212px;text-align: center;\" >"
							+ json[p]+ "</td>";
					
					m_str1=m_str1+"</tr>";
				}
				m_str1 =m_str1+"</table>";
				$("#ColumnList").html(m_str1);
				
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
<link rel="stylesheet" href="./res/css/product.css" type="text/css"></link>
</head>
<body onload="getTableList()">
	<div id="TableList"></div>
	<div id="ColumnList"></div>
</body>
</html>