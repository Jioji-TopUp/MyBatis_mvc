<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title>My JSP 'TableLog.jsp' starting page</title>
<link rel="stylesheet" href="./res/css/jquery-ui.min.css"
	type="text/css"></link>
<link rel="stylesheet" href="res/jqgrid/css/ui.jqgrid.css" />
<link rel="stylesheet"
	href="res/jqgrid/css/css/redmond/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="res/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="res/jqgrid/js/jquery.jqGrid.src.js"></script>
<script type="text/javascript"
	src="res/jqgrid/js/i18n/grid.locale-cn.js"></script>

<script type="text/javascript">
var records="";
	//初始化jqGrid
	$(function() {
		pageInit();
	});
	//TableLog表格显示
	function pageInit() {

		jQuery("#list5").jqGrid({
			width : 500,
			height : 400,
			url : "./getAlreadyPostTable",
			datatype : "json",
			postData : {

			},
			jsonReader : {
				root : "rows",
				page : "currpage",
				total : "totalpages",
				records :"totalrecords",
				repeatitems : false,
				id : "0"
			},
			colNames : [ '表名', '字段名', '用户', '操作日期' ],
			colModel : [ {
				name : 'tablename',
				index : 'tablename',
				width : 100
			}, {
				name : 'columns',
				index : 'columns',
				width : 100,
				hidden : true
			}, {
				name : 'username',
				index : 'username',
				width : 100
			}, {
				name : 'posttime',
				index : 'posttime',
				width : 150
			} ],
			
			rowNum : Number(records),
			pager : '#pager5',
			viewrecords : true,
			sortname : "name",//初始化的时候排序的字段
			sortorder : "asc",//排序方式,可选desc,asc
			multiselect : false,
			caption : "TableLog",
			subGrid : true,
			subGridRowExpanded : function(subgrid_id, row_id) {//(2)子表格容器的id和需要展开子表格的行id 
				var rowData = $("#list5").jqGrid('getRowData', row_id);
				//alert(rowData.columns);
				bindSubGrid(subgrid_id, row_id, rowData.columns);
			}
		});
	}

	//二级表格的显示
	function bindSubGrid(subgrid_id, row_id, columns) {
		var subgrid_table_id;
		strs = columns.split(",");
		var list = new Array();
		for ( var i = 0; i < strs.length; i++) {
			list[i] = "{'columns':'" + strs[i] + "'}";
		}
		rows = "[" + list + "]";
		var rowss = eval("(" + rows + ")");
		//alert(typeof rowss);
		//var rows="[{'colunmname':'email','othername':'email','type':'varchar(255)'},{'colunmname':'password','othername':'password','type':'varchar(255)'}]";
		//var rowss = eval("(" + rows + ")"); 
		//alert(typeof rowss);

		subgrid_table_id = subgrid_id + "_t"; // (3)根据subgrid_id定义对应的子表格的table的id  

		var subgrid_pager_id;
		
		subgrid_pager_id = subgrid_id + "_pgr"; // (4)根据subgrid_id定义对应的子表格的pager的id 


		// (5)动态添加子表格的table和pager  
		$("#" + subgrid_id)
				.html(
						"<table id='"+subgrid_table_id+"' class='scroll'></table><div id='"+subgrid_pager_id+"' class='scroll'></div>");
		// (6)创建jqGrid对象  
		$("#" + subgrid_table_id).jqGrid({

			datatype : "local",
			data : rowss,

			colNames : [ '字段名' ],
			colModel : [ {
				name : "columns",
				index : "columns",
				width : 122,

			} ],

			height : '100%',
			mtype : "post",
			viewrecord : true,

		});
	}
</script>
</head>


<body>
	<!-- 表格容器 -->
	<table id="list5"></table>
	<div id="pager5"></div>
	<br>

</body>
</html>
