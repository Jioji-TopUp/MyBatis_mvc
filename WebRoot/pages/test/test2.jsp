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
<link rel="stylesheet" href="res/jqgrid/css/ui.jqgrid.css" />
<link rel="stylesheet"
	href="res/jqgrid/css/css/redmond/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="res/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="res/jqgrid/js/jquery.jqGrid.src.js"></script>
<script type="text/javascript" src="res/jqgrid/js/i18n/grid.locale-cn.js"></script>
<script type="text/javascript">
	$(function() {
		pageInit();
	});

	function pageInit() {
		jQuery("#list10")
				.jqGrid(
						{
							width : 500,
							url : "./getAllTablesNew",
							datatype : "json",
							postData : {

							},
							jsonReader : {
								root : "rows",
								page : "currpage",
								total : "totalpages",
								records : "totalrecords",
								repeatitems : false,
								id : "0"
							},
							colNames : [ '表名', '别名', '创建日期' ],
							colModel : [ {
								name : 'tablename',
								index : 'tablename',
								width : 90
							}, {
								name : 'othername',
								index : 'othername',
								width : 80
							}, {
								name : 'createtime',
								index : 'createtime',
								width : 80
							} ],
							rowNum : 10,
							rowList : [ 10, 20, 30 ],
							pager : '#pager10',
							sortname : 'id',
							viewrecords : true,
							sortorder : "desc",
							multiselect : false,
							caption : "Invoice Header",
							onSelectRow : function(ids) {
								var rowData = $("#list10").jqGrid('getRowData',
										ids);
								jQuery("#list10_d")
										.jqGrid(
												{
													url : "./getTableColumnNew",
													datatype : "json",
													postData : {
														jdbcDriver : "org.gjt.mm.mysql.Driver",
														dbUrl : "jdbc:mysql://192.168.3.59:3306/SinoCBD",
														dbUsername : "hadoop",
														dbPassword : "hadoop",
														tablename : ids,
													},
													jsonReader : {
														root : "rows",
														page : "currpage",
														total : "totalpages",
														records : "totalrecords",
														repeatitems : false,
														id : "0"
													},
													colNames : [ '字段名', '别名',
															'类型' ],
													colModel : [ {
														name : 'colunmname',
														index : 'colunmname',
														width : 90
													}, {
														name : 'othername',
														index : 'othername',
														width : 80,
														editable : true
													}, {
														name : 'type',
														index : 'type',
														width : 80,
													}, ],
													rowNum : 10,
													rowList : [ 10, 20, 30 ],
													pager : '#pager10_d',
													sortname : 'id',
													viewrecords : true,
													sortorder : "desc",
													multiselect : true,
													cellEdit : true,
													cellsubmit : 'clientArray',
													caption : "Invoice Detail"
												});
								jQuery("#list10_d").jqGrid('setCaption',
										"Invoice Detail: " + ids).trigger(
										'reloadGrid');
							}
						});

	}
</script>

</head>
<body>
	<table id="list10"></table>
	<div id="pager10"></div>
	<br/> Invoice Detail
	<table id="list10_d"></table>
	<div id="pager10_d"></div>
</body>
</html>