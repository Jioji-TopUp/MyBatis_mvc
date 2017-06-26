<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String companyid="001";
	String keyword="0";
	if(request.getParameter("companyid")!=null&&request.getParameter("keyword")!=null){
		companyid=request.getParameter("companyid");
		keyword=request.getParameter("keyword");
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
<script src="./page/js/jquery.min.js?v=2.1.4"></script>
<script src="./page/js/bootstrap.min.js?v=3.3.6"></script>
<script src="./page/js/content.js?v=1.0.0"></script>
<script src="./page/js/plugins/sweetalert/sweetalert.min.js"></script>


<link rel="stylesheet" href="./res/css/jquery-ui.min.css"
	type="text/css"></link>
<link rel="stylesheet" href="res/jqgrid/css/ui.jqgrid.css" />
<link rel="stylesheet"
	href="res/jqgrid/css/css/redmond/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="res/js/jquery-1.10.2.js"></script>




	<!-- 自定义css -->
	<link href="./pages/css//menu.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="./pages/css/button.css">
	<link rel="stylesheet" type="text/css" href="./pages/css/table.css">
	<link rel="stylesheet" type="text/css" href="./pages/css/font.css">
	<!-- 自定义js -->
	<script src="./pages/js/table.js"></script>
</head>


<body onload="CompanyDataListByDate(1,5),CompanyFilesListByDate(1,5)" style="width:100%;overflow:scroll; ">

	<div style="height:auto!important;   height:500px;   min-height:500px;   ;display: inline-block;width: 1000px ;text-align:center">
		
		<div ><Strong style="font-size:20px">根据数据查到的结果</Strong></div>
		<p></p>
		<div id="CompanyDataList"></div>
		<div id="CompanyDataPager"></div>
		<input type="hidden" id="companyidhidden" value=<%=companyid%>>
		<input type="hidden" id="keywordhidden" value=<%=keyword%>>
	</div>
	
	
	
	
	<div style="height: 500px;display: inline-block;width: 1000px ;text-align:center" >
		<div style="font-size:20px"><Strong>根据文件查到的结果</Strong></div>
		<p></p>
		<div id="CompanyFilesList"></div>
		<div id="CompanyFilesPager"></div>

	</div>
	
	
	<script type="text/javascript">
	/*----------------上方Data表-------------*/
	
	function CompanyDataListByDate(page,interval) {
		var start = (page - 1) * interval;
		var companyid=$("#companyidhidden").val();
		var keyword=$("#keywordhidden").val();		
		$.ajax({
			type : "get",
			url : "./getCompanyDataByCompanyIdAndKeywords",
			dataType : 'json',
			data : {
				start : start,
				interval : interval,
				companyid :companyid,
				keyword:keyword
			},
			success : function(json) {
				//拼接table
				var table="<table>";				
				var tabletitle = "<thead>";
				var tablebody="";
								
				var mcolumns=json["columns"];
				var columnnames=[]; 
				for ( var s in mcolumns) {
					tabletitle=tabletitle+"<th>"+mcolumns[s]+"</th>";
					columnnames.push(mcolumns[s]);
				}
				tabletitle=tabletitle+"</thead>";
				
				var list=json["list"];
				
				/*--------------------*/
				for ( var p in list) {
			
					var columnandvalues=list[p].mcolumn;
					tablebody = tablebody
							+ "<tr >";
					for ( var i = 0; i < mcolumns.length; i++) {
						for ( var y in columnandvalues) {
							if (columnandvalues[y].columnname == mcolumns[i]) {
								
								var mcolumnvalue = columnandvalues[y].columnvalue;
								tablebody = tablebody
										+ "<td>"+(mcolumnvalue)+"</td>";
							} else {
								tablebody = tablebody + "<td ></td>";
							}
						}
					}
					tablebody=tablebody+"</tr>";
				}
				
				/*-------------*/
				table = table+tabletitle+tablebody + "</table>";
				$("#CompanyDataList").html(table);
				
				var count = json["count"];
				
				//分页工具
				var page=Math.ceil((start+1)/interval);
            	totalpage=Math.ceil(count/interval);

            	var m_str2="<a class='btn btn-white r' onclick='pageprev("+page+","+interval+")'>上一页</a>";
				m_str2=m_str2+"<a class='btn btn-white r' onclick='pagenext("+page+","+interval+","+totalpage+")'>下一页</a>";
				m_str2=m_str2+"<span class='btn btn-white' style='border:1px solid #DDDDDD'>第"+page+"页/共"+totalpage+"页</span>";
            	
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
	
	
	<script type="text/javascript">
	
	/*---------下方文件表-------*/
	
	function CompanyFilesListByDate(page,interval) {
		var start = (page - 1) * interval;
		var companyid=$("#companyidhidden").val();
		var keyword=$("#keywordhidden").val();		
		$.ajax({
			type : "get",
			url : "./getCompanyFilesByCompanyIdAndKeywords",
			dataType : 'json',
			data : {
				start : start,
				interval : interval,
				companyid :companyid,
				keyword:keyword
			},
			success : function(json) {
				//拼接table
				var table="<table >";	
				
				//拼接th
				var ttitle = ["文件","文件路径","文件类型","提交时间","标签"];	
				var tabletitle = gettitleWithValues(ttitle);
				var tablebody="";
				
				
				//拼接td	
				var list=json["list"];			

				for ( var p in list) {
					var v = list[p];
					var a = "<a href='"
						+v.filepath
						+"' target='_blank'>"
						+v.filepath+"</a>";
					var values=[v.filename,a,v.filetype,v.posttime,v.tids];			
					tablebody += getrowWithValues(values);	
				}
				
				//整合
				table = table+tabletitle+tablebody + "</table>";
				$("#CompanyFilesList").html(table);
				
				var count = json["count"];
				
				var page=Math.ceil((start+1)/interval);
            	totalpage=Math.ceil(count/interval);
            	
            	var m_str2="<a class='btn btn-white r' onclick='filepageprev("+page+","+interval+")'>上一页</a>";
				m_str2=m_str2+"<a class='btn btn-white r' onclick='filepagenext("+page+","+interval+","+totalpage+")'>下一页</a>";
				m_str2=m_str2+"<span  class='btn btn-white '>第"+page+"页/共"+totalpage+"页</span>";
            	
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
	
	function filepagenext(page,interval,totalpage){
		if(page<totalpage){
			page=page+1;
			CompanyFilesListByDate(page,interval);
		}else{
			alert("已到末页");
		}
	}
	
	function filepageprev(page,interval){
		if(page>1){
			page=page-1;
			CompanyFilesListByDate(page,interval);
		}else{
			alert("已到第一页");
		}
	}

</script>
</body>
</html>
