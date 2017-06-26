<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String companyid = "0";
	if (request.getParameter("companyid") != null) {
		companyid = request.getParameter("companyid");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'CompanyColumns.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->


<link rel="shortcut icon" href="favicon.ico">
<link href="./page/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="./page/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="./page/css/animate.css" rel="stylesheet">
<link href="./page/css/style.css?v=4.1.0" rel="stylesheet">
<link href="./page/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
<script language="javascript" type="text/javascript"
	src="<%=request.getContextPath()%>/My97DatePicker/WdatePicker.js">
	
</script>
<script type="text/javascript" src="./res/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="./res/js/jquery-ui-1.10.3.min.js"></script>
<link rel="stylesheet" href="./res/css/jquery-ui.min.css"
	type="text/css"></link>

<style type="text/css">
td {
	text-align: center;
	width: 212px;
}
</style>
<script type="text/javascript">
	function CompanyDataList(page, interval) {
		var companyid = $("#companyidhidden").val();
		var start = (page - 1) * interval;
		$
				.ajax({
					type : "get",
					url : "./getCompanyData",
					dataType : 'json',
					data : {
						start : start,
						interval : interval,
						companyid : companyid
					},
					success : function(json) {
						var table = "<table class='table table-bordered table-striped'>";
						var tabletitle = "<tr>";
						var tablebody = "";

						var mcolumns = json["columns"];
						var columnnames = [];
						for ( var s in mcolumns) {
							tabletitle = tabletitle + "<td >" + mcolumns[s]
									+ "</td>";
							columnnames.push(mcolumns[s]);
						}
						tabletitle = tabletitle + "</tr>";

						var list = json["list"];
						for ( var p in list) {
							var columnandvalues = list[p].mcolumn;
							tablebody = tablebody
									+ "<tr style=\"background-color:#FFFFFF\" >";
							for ( var i = 0; i < mcolumns.length; i++) {
								for ( var y in columnandvalues) {
									if (columnandvalues[y].columnname == mcolumns[i]) {
										tablebody = tablebody
												+ "<td style=\"width:212px;text-align: center;\">"
												+ columnandvalues[y].columnvalue
												+ "</td>";
									} else {
										tablebody = tablebody
												+ "<td style=\"width:212px;text-align: center;\">"
												+ "</td>";
									}
								}
							}
							tablebody = tablebody + "</tr>";
						}
						table = table + tabletitle + tablebody + "</table>";
						$("#CompanyDataList").html(table);

						var count = json["count"];

						//分页工具
						var page = Math.ceil((start + 1) / interval);
						totalpage = Math.ceil(count / interval);

						var m_str2 = "<a class='btn btn-white' onclick='pageprev("
								+ page + "," + interval + ")'>上一页</a>";
						m_str2 = m_str2
								+ "<a class='btn btn-white' onclick='pagenext("
								+ page + "," + interval + "," + totalpage
								+ ")'>下一页</a>";
						m_str2 = m_str2 + "<span >第" + page + "页/共" + totalpage
								+ "页</span>";

						$("#CompanyDataPager").html(m_str2);

					},
					beforeSend : function() {

					},
					complete : function(XMLHttpRequest, textStatus) {

					},
					error : function() {

					}
				});

	}

	function pagenext(page, interval, totalpage) {
		if (page < totalpage) {
			page = page + 1;
			FaultInfoList(page, interval);
		} else {
			alert("已到末页");
		}
	}

	function pageprev(page, interval) {
		if (page > 1) {
			page = page - 1;
			FaultInfoList(page, interval);
		} else {
			alert("已到第一页");
		}
	}
</script>
</head>


<body onload="CompanyDataList(1,5)">
	<div id="CompanyDataList"></div>
	<div id="CompanyDataPager"></div>
	<input type="hidden" id="companyidhidden" value=<%=companyid%>>
</body>


<script>
	
</script>
</html>
