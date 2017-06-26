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

<script type="text/javascript" src="./res/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="./res/js/jquery-ui-1.10.3.min.js"></script>

<link rel="stylesheet" href="./res/css/jquery-ui.min.css"
	type="text/css"></link>


<link rel="stylesheet" href="res/jqgrid/css/ui.jqgrid.css" />
<link rel="stylesheet"
	href="res/jqgrid/css/css/redmond/jquery-ui-1.8.16.custom.css" />


<script type="text/javascript" src="res/jqgrid/js/jquery.jqGrid.src.js"></script>
<script type="text/javascript"
	src="res/jqgrid/js/i18n/grid.locale-cn.js"></script>
<style type="text/css">
#dialog {
	display: none;
	font-size: 10;
}
</style>
<script type="text/javascript">
	var arrayNewList = new Array();

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
								width : 80,
								editable : true
							}, {
								name : 'createtime',
								index : 'createtime',
								width : 80
							} ],
							rowNum : "records",
							pager : '#pager10',
							sortname : 'id',
							viewrecords : true,
							sortorder : "desc",
							multiselect : true,
							caption : "数据库",
							cellEdit : true,
							cellsubmit : 'clientArray',
							onCellSelect : function(ids) {
								var rowData = $("#list10").jqGrid('getRowData',
										ids);
								if (ids == null) {
									ids = 0;
									var rowData = $("#list10").jqGrid(
											'getRowData', ids);
									if (jQuery("#list10_d").jqGrid(
											'getGridParam', 'records') > 0) {
										jQuery("#list10_d")
												.jqGrid(
														'setGridParam',
														{
															url : "./getTableColumnNew?tablename="
																	+ rowData.tablename,
															page : 1
														});
										subgridInit(rowData.tablename);
										jQuery("#list10_d").jqGrid(
												'setCaption',
												"表名: " + rowData.tablename)
												.trigger('reloadGrid');
									}
								} else {

									jQuery("#list10_d")
											.jqGrid(
													'setGridParam',
													{
														url : "./getTableColumnNew?tablename="
																+ rowData.tablename,
														page : 1
													});
									subgridInit(rowData.tablename);
									jQuery("#list10_d").jqGrid('setCaption',
											"表名: " + rowData.tablename)
											.trigger('reloadGrid');
								}
							},
						});
	}
	function saveData(rowid, columnname, tablename) {
		var a = new Object();
		a.rowid = rowid;
		a.columnname = columnname;
		a.tablename = tablename;
		arrayNewList.push(a);
	}

	function deleteIndexData(obj) {
		//获取obj在arrayNewList数组中的索引值
		for (i = 0; i < arrayNewList.length; i++) {
			if (arrayNewList[i] == obj) {
				//根据索引值删除arrayNewList中的数据
				arrayNewList.remove(i);
				i--;
			}
		}
	}

	function subgridInit(ids) {
		var tname = ids;

		jQuery("#list10_d").jqGrid({
			width : 500,
			url : "./getTableColumnNew?tablename=" + ids,
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
			colNames : [ '字段名', '别名', '类型' ],
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

			pager : '#pager10_d',
			rowNum : "records",

			sortname : 'id',
			mtype : "POST",
			sortname : 'id',
			viewrecords : true,
			sortorder : "desc",
			multiselect : true,
			cellEdit : true,
			cellsubmit : 'clientArray',
			caption : "Invoice Detail",
			gridComplete : function() {
				var arr = new Array();

				for ( var i = 0; i < arrayNewList.length; i++) {
					if (arrayNewList[i].tablename == tname) {
						arr.push(arrayNewList[i]);
					}
				}

				for ( var k = 0; k < arr.length; k++) {
					alert(arr[k].rowid);
					//jQuery("#list10_d").jqGrid('setSelection',arr[k].rowid);
				}

			},
			onSelectRow : function(aRowids, status) {
				var rowData = $("#list10_d").jqGrid('getRowData', aRowids);
				saveData(aRowids, rowData.colunmname, tname);
			}

		}).navGrid('#pager10_d', {
			add : false,
			edit : false,
			del : false
		});
		jQuery("#ms1").click(function() {
			var s;
			s = jQuery("#list10_d").jqGrid('getGridParam', 'selarrrow');

		});
	}

	function ps2() {

		var pd = $("#list10_d").jqGrid('getGridParam', 'selarrrow');
		var rowData = $("#list10_d").jqGrid("getRowData");

		var r = "";
		var a = b = c = d = "";
		var data = new Array();
		$
				.each(
						pd,
						function(i) {
							a += rowData[pd[i] - 1].colunmname + ",";
							b += rowData[pd[i] - 1].othername + ",";
							c += rowData[pd[i] - 1].type + ",";

							data["dataList[" + i + "].colunmname"] = rowData[pd[i] - 1].colunmname;
							data["dataList[" + i + "].othername"] = rowData[pd[i] - 1].othername;
							data["dataList[" + i + "].type"] = rowData[pd[i] - 1].type;

						});

		$.each($("#list10").jqGrid('getGridParam', 'selarrrow'), function(i) {
			d += ($("#list10").jqGrid("getRowData")[$("#list10").jqGrid(
					'getGridParam', 'selarrrow')[i] - 1].tablename)
					+ ",";
		});

		r = "tablename:" + d + "colunmname:" + a + "othername:" + b + "type:"
				+ c;

		$("#postdata").html(r).css("background-color", "yellow");

		$("#dialog").dialog({
			height : 300,
			width : 350,
			modal : true,
			hide : "blind",

			closeOnEscape : false,

			open : function(event, ui) {
				$(".ui-dialog-titlebar-close").hide();
			}

		});

		$.ajax({

			cache : false,

			type : "POST",

			url : "./addDataAndTable", //把表单数据发送到ajax.jsp

			data : {
				dataList : r
			}, //要发送的是ajaxFrm表单中的数据

			async : false,
			success : function(request) {
				alert("1");
				$("#dialog").dialog("close");
				$("#dialog").html(r); //将返回的结果显示到ajaxDiv中
			},
			error : function(data) {

				var int = self.setInterval(function() {
					$("#dialog").dialog("close");
					var int1 = self.setInterval(function() {
						window.location.href = "./pages/test/TableLog.jsp";

					}, 1000);
				}, 3000);

				$("#dialog").html(d);

			}

		});

	}
</script>

</head>

<body>

	<div style="padding-left:10%;padding-top:0">
		<table id="list10"></table>
		<div id="pager10"></div>
		<table id="list10_d"></table>
		<div id="pager10_d"></div>
		<input class="button" type="button" onclick="ps2()" value="提交" /> <b>Request:
		</b> <span id="postdata"></span> <br /> <br />
		<table id="pdata"></table>
		<div id="ppdata"></div>
		<br />
	</div>

	<input class="button" type="button" onclick="testdialog()" value="悬浮" />
	<div id="dialog" title="导入中。。">无数据</div>
</body>
</html>