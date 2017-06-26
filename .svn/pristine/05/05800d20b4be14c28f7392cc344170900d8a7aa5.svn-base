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


<link rel="stylesheet" href="./res/css/jquery-ui.min.css"
	type="text/css"></link>
<link rel="stylesheet" href="res/jqgrid/css/ui.jqgrid.css" />
<link rel="stylesheet"
	href="res/jqgrid/css/css/redmond/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="res/js/jquery-1.10.2.js"></script>

<script type="text/javascript">
	
	function CompanyDataListByDate(page,interval) {
		var start = (page - 1) * interval;
		var date=$("#datehidden").val();
		$.ajax({
			type : "get",
			url : "./getCompanyDataListByDate",
			dataType : 'json',
			data : {
				start : start,
				interval : interval,
				date :date
			},
			success : function(json) {
				var table="<table class='table table-bordered table-striped'>";				
				var tabletitle = "<tr>";
				var tablebody="";
								
				var mcolumns=json["columns"];
				var columnnames=[]; 
				for ( var s in mcolumns) {
					tabletitle=tabletitle+"<td >"+mcolumns[s]+"</td>";
					columnnames.push(mcolumns[s]);
				}
				tabletitle=tabletitle+"</tr>";
				
				var list=json["list"];
				for ( var p in list) {
					var columnandvalues=list[p].mcolumn;
					tablebody = tablebody
							+ "<tr style=\"background-color:#FFFFFF\" >";
					for ( var columnandvalue in columnandvalues) {
						var mcolumnname=columnandvalues[columnandvalue].columnname;
						if($.inArray(mcolumnname, columnnames)>=0){
							var mcolumnvalue=columnandvalues[columnandvalue].columnvalue;
							tablebody = tablebody
							+ "<td style=\"width:212px;text-align: center;\">"
							+ mcolumnvalue + "</td>";
						}
					}
					tablebody=tablebody+"</tr>";
				}
				table = table+tabletitle+tablebody + "</table>";
				$("#CompanyDataList").html(table);
				
				var count = json["count"];
				
				//分页工具
				var page=Math.ceil((start+1)/interval);
            	totalpage=Math.ceil(count/interval);

            	var m_str2="<a class='btn btn-white' onclick='pageprev("+page+","+interval+")'>上一页</a>";
				m_str2=m_str2+"<a class='btn btn-white' onclick='pagenext("+page+","+interval+","+totalpage+")'>下一页</a>";
				m_str2=m_str2+"<span >第"+page+"页/共"+totalpage+"页</span>";
            	
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
	
	function pagenext(page,interval,totalpage){
		if(page<totalpage){
			page=page+1;
			CompanyDataListByDate(page,interval);
		}else{
			alert("已到末页");
		}
	}
	
	function pageprev(page,interval){
		if(page>1){
			page=page-1;
			CompanyDataListByDate(page,interval);
		}else{
			alert("已到第一页");
		}
	}	

</script>
</head>


<body onload="CompanyDataListByDate(1,2)">
	<div id="CompanyDataList"></div>
	<div id="CompanyDataPager"></div>
	<input type="hidden" id="datehidden" value=<%=date%>>
</body>
</html>
