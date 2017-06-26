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
var records="";
	var arrayNewList = new Array();
	var timeNum = 0;
	$(function() {
		pageInit();
	});

	function pageInit() {
		jQuery("#list10").jqGrid(
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
					rowNum : Number(records),
					pager : '#pager10',
					sortname : 'id',
					viewrecords : true,
					sortorder : "desc",
					multiselect : true,
					caption : "数据库",

					cellEdit : true,
					cellsubmit : 'clientArray',
					onCellSelect : function(ids) {
						var rowData = $("#list10").jqGrid('getRowData', ids);
						jQuery("#list10_d").jqGrid(
								'setGridParam',
								{
									url : "./getTableColumnNew?tablename="
											+ rowData.tablename,
									page : 1
								});
						jQuery("#list10_d").jqGrid('setCaption',
								"表名: " + rowData.tablename).trigger(
								'reloadGrid');
					},
					gridComplete : function() {

					}

				});

		jQuery("#list10_d").jqGrid(
				{
					url : "",
					datatype : "json",
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

					pager : 1,

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
						var arrp = new Array();
						var id = $("#list10").jqGrid("getGridParam", "selrow");
						var rowData = $("#list10").jqGrid('getRowData', id);
						var ftablename = rowData.tablename;

						for ( var i = 0; i < arrayNewList.length; i++) {
							var stablename = arrayNewList[i].tablename;
							if ($.trim(stablename) == $.trim(ftablename)) {
								arrp.push(arrayNewList[i]);
							}
						}

						for ( var k = 0; k < arrp.length; k++) {
							jQuery("#list10_d").jqGrid('setSelection',
									arrp[k].rowid);
						}

					},
					onSelectRow : function(aRowids, status) {
						var id = $("#list10").jqGrid("getGridParam", "selrow");

						var rowData = $("#list10_d").jqGrid('getRowData',
								aRowids);
						var rowData2 = $("#list10_d").getGridParam("caption");
						rowData2 = rowData2.replace("表名:", "");

						if (status == true) {
							saveData(aRowids, rowData.colunmname, $
									.trim(rowData2), rowData.othername,
									rowData.type);
						} else {
							deleteIndexData(aRowids, rowData.colunmname, $
									.trim(rowData2), rowData.othername,
									rowData.type);
						}

						var rd = $("#list10_d").jqGrid("getGridParam",
								"selarrrow");

						var curChk = $("#" + id + "").find(":checkbox");

						if (rd.length == 0) {
							curChk.prop("checked", false);

						} else {
							curChk.prop("checked", true);
						}

					}
				});

	}

	function saveData(rowid, columnname, tablename, othername, type) {

		var a = new Object();
		a.rowid = rowid;
		a.columnname = columnname;
		a.tablename = tablename;
		a.othername = othername;
		a.type = type;

		var ifhas = 0;
		for ( var i = 0; i < arrayNewList.length; i++) {
			if (arrayNewList[i].tablename == a.tablename
					&& arrayNewList[i].columnname == a.columnname) {
				ifhas = 1;
				break;
			}
			ifhas = 0;
		}

		if (ifhas == 0) {
			arrayNewList.push(a);
		}
	}

	function deleteIndexData(rowid, columnname, tablename, othername, type) {
		var a = new Object();
		a.rowid = rowid;
		a.columnname = columnname;
		a.tablename = tablename;
		var ifhas = 0;
		for ( var i = 0; i < arrayNewList.length; i++) {
			if (arrayNewList[i].tablename == a.tablename
					&& arrayNewList[i].columnname == a.columnname) {
				arrayNewList.splice(i, 1);
			}
		}

	}

	function ps2() {

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

		var pd = $("#list10_d").jqGrid('getGridParam', 'selarrrow');
		var rowData = $("#list10_d").jqGrid("getRowData");
		var time = 0;
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
			d += $("#list10").jqGrid("getRowData")[$("#list10").jqGrid(
					'getGridParam', 'selarrrow')[i] - 1].tablename
					+ ",";
		});

		//r = "tablename:" + d + "colunmname:" + a + "othername:" + b + "type:"
		//		+ c;

		rr = "";
		aa = "";
		bb = "";
		cc = "";
		dd = "";
		ddtablename = "";
		Num = 0;
		var tableLog_div = new Array();
		var tableName_div = new Array();
		for ( var i = 0; i < arrayNewList.length; i++) {

			dd = arrayNewList[i].tablename;
			aa = arrayNewList[i].columnname + ",";
			bb = arrayNewList[i].othername + ",";
			cc = arrayNewList[i].type + ",";

			for ( var j = i + 1; j < arrayNewList.length; j++) {

				if (arrayNewList[i]["tablename"] == (arrayNewList[j]["tablename"])) {

					aa += arrayNewList[j].columnname + ",";
					bb += arrayNewList[j].othername + ",";
					cc += arrayNewList[j].type + ",";
					// delete arrayNewList [j];

					arrayNewList.splice(j, 1);
					j = j - 1;

				}

			}
			tableName_div.push(dd);

			r = "tablename:" + dd + "," + "colunmname:" + aa + "othername:"
					+ bb + "type:" + cc;

			$("#postdata").html(arrayNewList).css("background-color", "yellow");

			time = time + 1000;
			//self.setInterval(function(){timeNum(tableName_div,Num);},500);

			//ddtablename += tableName_div + "<a style=\"float:right\">√</a><br>";
			//$("#dialog").html(ddtablename);
			//$("#dialog").html(ddtablename);
			//var Div = document.create_rElement("div");

			$.ajax({

				cache : false,
				type : "POST",
				async : false,
				dataType : 'json',
				url : "./addDataAndTable", //把表单数据发送到ajax.jsp
				data : {
					dataList : r
				}, //要发送的是ajaxFrm表单中的数据
				error : function(request) {

					//$("#dialog").html(ddtablename);

				},
				success : function(json) {

					var s = json["code"];
					if (s == 0) {
						//alert(JSON.stringify(json));
						var table_div = new Object();
						table_div.tablename = dd;
						table_div.code = s;
						tableLog_div.push(table_div);
						//alert(JSON.stringify(tableLog_div));

					}
				}
			});
			//intz = setInterval("myFunction()", "500");

			//	  $("#dialog").html(dd);

		}
		table_all(tableLog_div);
		intz = setInterval(function() {
			myFunction(tableLog_div);
		}, "500");
	}
	function table_all(tableLog_div) {
	$("#dialog").html("");
		for ( var i = 0; i < tableLog_div.length; i++) {

			var node = document.createElement("div");
			node.id=tableLog_div[i].tablename;
			var textnode = document.createTextNode(tableLog_div[i].tablename);
			node.appendChild(textnode);
			document.getElementById("dialog").appendChild(node);
			//li.setAttribute("id", tableLog_div[i].tablename);
			//alert(tableLog_div.length);
		}
		
var suc = document.createElement("div");
suc.id="suc";
document.getElementById("dialog").appendChild(suc);
suc.style.cssText += 'text-align:center';;  
	}
	function myFunction(tableLog_div) {
	//	alert(tableLog_div.length);
		timeNum++;
		
		
		document.getElementById(tableLog_div[timeNum-1].tablename).innerHTML+="<a style=\"float:right\">√</a><br>";
 //   document.createTextNode("<a style=\"float:right\">√</a><br>");
 // alert(tableLog_div[i].tablename);
//oDiv.appendChild(div2);
    
		/* var node = document.createElement("Li");
		var textnode = document.createTextNode(timeNum);
		node.appendChild(textnode);
		document.getElementById("dialog").appendChild(node); */
		if (timeNum == tableLog_div.length) {
			clearInterval(intz);
			
			document.getElementById("suc").innerHTML+="<a>导入成功！</a><br>";
			var inta = self.setInterval(function() {
				$("#dialog").dialog("close");
				var intb = self.setInterval(function() {
					window.location.href = "./pages/test/TableLog.jsp";
				}, 1000);
			}, 3000);
		}

	}
</script>

</head>
<body>
	<div style="">
		<table id="list10"></table>
		<div id="pager10"></div>

		<table id="list10_d"></table>
		<div id="pager10_d"></div>

		<input class="button" type="button" onclick="ps2()" value="提交" /> <b>Request:
		</b> <span id="postdata"></span> <br /> <br />
		<table id="pdata"></table>
		<div id="ppdata"></div>
		<br />
		<div id="dialog" title="导入中。。">正在加载。。。</div>
	</div>
</body>
</html>