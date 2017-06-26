<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String date="1";
	if(request.getParameter("date")!=null){
		date=request.getParameter("date");
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
<link href="./page/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="./page/js/jquery.min.js?v=2.1.4"></script>
<script src="./page/js/bootstrap.min.js?v=3.3.6"></script>
<script src="./page/js/content.js?v=1.0.0"></script>
<script src="./page/js/plugins/sweetalert/sweetalert.min.js"></script>


<link rel="stylesheet" href="./res/css/jquery-ui.min.css" type="text/css"></link>
<link rel="stylesheet" href="res/jqgrid/css/ui.jqgrid.css" />
<link rel="stylesheet" href="res/jqgrid/css/css/redmond/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="res/js/jquery-1.10.2.js"></script>


<script type="text/javascript">
	
	function CompanyFilesListByDate(page,interval) {
		var start = (page - 1) * interval;
		var date=$("#datehidden").val();
		$.ajax({
			type : "get",
			url : "./getCompanyFilesListByDate",
			dataType : 'json',
			data : {
				start : start,
				interval : interval,
				date :date
			},
			success : function(json) {
				var table="<table >";
				
				//拼接thead				
				var tabletitle = "";
				var thvalues = ["文件名","文件路径","文件类型","提交时间","标签"];
				tabletitle += gettitleWithValues(thvalues);
				
				//拼接tr
				var tablebody="";
				var list=json["list"];
				for ( var p in list) {
					
					var v = list[p];
					var tdvalues = [v.filename,v.filepath,v.filetype,v.posttime,v.tids];
					tablebody += getrowWithValues(tdvalues);
				
				}
				
				table = table+tabletitle+tablebody + "</table>";
				$("#CompanyFilesList").html(table);
				
				
				
				var count = json["count"];
				
				var page=Math.ceil((start+1)/interval);
            	totalpage=Math.ceil(count/interval);
            	
            	var m_str2="";
            	m_str2=m_str2+"<a class='btn btn-white r' onclick='pageprev("+page+","+interval+")'>上一页</a>";
				m_str2=m_str2+"<a class='btn btn-white r' onclick='pagenext("+page+","+interval+","+totalpage+")'>下一页</a>";
				m_str2=m_str2+"<span class='btn btn-white'>第"+page+"页/共"+totalpage+"页</span>";
            	
	            $("#CompanyFilesPager").html(m_str2);

			},
			beforeSend : function() {

			},
			complete : function(XMLHttpRequest, textStatus) {

			},
			error : function() {

			}
		});
		
	}
	
	function pagenext(page,interval,totalpage){
		if(page<totalpage){
			page=page+1;
			CompanyFilesListByDate(page,interval);
		}else{
			alert("已到末页");
		}
	}
	
	function pageprev(page,interval){
		if(page>1){
			page=page-1;
			CompanyFilesListByDate(page,interval);
		}else{
			alert("已到第一页");
		}
	}	

</script>

	<!-- 自定义css -->
	<link href="./pages/css//menu.css" type="text/css"  rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="./pages/css/button.css">
	<link rel="stylesheet" type="text/css" href="./pages/css/table.css">
	<link rel="stylesheet" type="text/css" href="./pages/css/font.css">
	<link rel="stylesheet" type="text/css" href="./pages/css/div.css">
	
	<!-- 自定义js -->
	<script src="./pages/js/table.js"></script>
</head>


<body onload="CompanyFilesListByDate(1,5)" style="width:100%;overflow:scroll; ">
	<a href="./pages/dataview/testDataStatics.jsp" class="btn btn-white" ><img style="margin-right:5px;width:25px;height:25px;" alt="" src="./pages/css/img/back.jpg" />&nbsp;返回</a>
	

	<div class="tablelist" >

		<div id="CompanyFilesList"></div>
		<div id="CompanyFilesPager"></div>
		<input type="hidden" id="datehidden" value=<%=date%>>
	</div>
</body>
</html>
