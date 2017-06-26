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

<title>My JSP 'DataStatics.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="keywords" content="">
<meta name="description" content="">

<link rel="shortcut icon" href="favicon.ico">
<link href="./page/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="./page/css/font-awesome.css?v=4.4.0" rel="stylesheet">

<link href="./page/css/animate.css" rel="stylesheet">
<link href="./page/css/style.css?v=4.1.0" rel="stylesheet">
<style type="text/css">
.laydate_body.laydate_top {
	border-top: 1px solid #33aaff;
	background-color: #33aaff
}
</style>
<script src="./page/js/jquery.min.js?v=2.1.4"></script>
<script src="./page/js/bootstrap.min.js?v=3.3.6"></script>
<script src="./page/js/plugins/echarts/echarts-all.js"></script>
<script src="./page/js/content.js?v=1.0.0"></script>
<script src="./page/js/plugins/layer/laydate/laydate.js"></script>
</head>

<body class="gray-bg" onload="init()">

	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<!--  <form class="form-horizontal m-t">
				<div class="form-group" style="width:800px">
					<label class="col-sm-2 control-label">日期查询：</label>
					<div class="col-sm-10">
						<input placeholder="开始日期" class="form-control layer-date"
							id="start"> <input placeholder="结束日期"
							class="form-control layer-date" id="end">
						<button type="button" class="btn btn-primary layer-date"
							onclick="getTime()">查询</button>
					</div>
				</div>
			</form>
			-->

			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h5>柱状图</h5>
					<div class="ibox-tools">
						<a class="collapse-link"> <i class="fa fa-chevron-up"></i> </a> <a
							class="dropdown-toggle" data-toggle="dropdown"
							href="graph_flot.html#"> <i class="fa fa-wrench"></i> </a>
						<ul class="dropdown-menu dropdown-user">
							<li><a href="graph_flot.html#">ECharts图例</a>
							</li>

						</ul>
						<a class="close-link"> <i class="fa fa-times"></i> </a>
					</div>
				</div>
				<div class="ibox-content">

					<div style="height:350px" class="echarts" id="echarts-bar-chart"></div>
				</div>

			</div>


		</div>
	</div>

	<div>
		数据采集自<span id="DataGroupByUrl"></span>个网站,利用了<span id="DataGroupByMainKeyWords"></span>个关键词
	</div>
	<div>
		文件采集自<span id="FilesGroupByUrl"></span>个网站,利用了<span id="FilesGroupByMainKeyWords"></span>个关键词
		,共有<span id="FilesGroupByLanguage"></span>类语言文件
	</div>
	<script>
		function init() {
			var dayNum1 = new Array();
			var dayNum2 = new Array();
			var timejson;
			$
					.ajax({
						type : "get",
						url : "./getAllCompanyDataAndFilesByDate",
						dataType : 'json',
						async : false,
						data : {

						},
						success : function(json) {

							for ( var i = 0; i < json["time"].length; i++)
								;
							{
								dayNum1[i] = 0;
								dayNum2[i] = 0;
							}

							for ( var i = 0; i < json["filelist"].length; i++) {
								dayNum1[json["filelist"][i]["companyid"]] = json["filelist"][i]["totalfiles"];
							}

							for ( var i = 0; i < json["datalist"].length; i++) {
								dayNum2[json["datalist"][i]["companyid"]] = json["datalist"][i]["totalnum"];
							}

							timejson = json["time"];

						},
						beforeSend : function() {
						},
						complete : function(XMLHttpRequest, textStatus) {

						},
						error : function() {

						}
					});

			var barChart = echarts.init(document
					.getElementById("echarts-bar-chart"));
			var baroption = {
				title : {
					text : '本月获取文件和数据数量统计'
				},
				color : [ '#3398DB', '#2258DB' ],
				tooltip : {
					trigger : 'axis'
				},
				legend : {
					data : [ '文件数量', '数据数量' ]
				},
				grid : {
					x : 30,
					x2 : 40,
					y2 : 24
				},
				calculable : true,
				xAxis : [ {
					type : 'category',
					data : timejson
				} ],
				yAxis : [ {
					type : 'value'
				} ],
				series : [ {
					name : '文件数量',
					type : 'bar',
					data : dayNum1,

				}, {
					name : '数据数量',
					type : 'bar',
					data : dayNum2,

				} ]
			};
			barChart.setOption(baroption);
			barChart
					.on(
							'click',
							function(param) {
								var date = timejson[param.dataIndex];
								var type = param.seriesIndex;
								date = date.substring(date.length - 2,
										date.length - 1);
								//console.log(date);
								if (type == 0) {
									window.location.href = "./pages/dataview/CompanyFilesByDate.jsp?date="
											+ date;
								} else {
									window.location.href = "./pages/dataview/CompanyDataByDate.jsp?date="
											+ date;
								}

							});
			window.onresize = barChart.resize;

			DataAndFilesStaticGroupByCondition();
		}

		function DataAndFilesStaticGroupByCondition() {
			$.ajax({
				type : "get",
				url : "./getDataAndFilesStaticGroupByCondition",
				dataType : 'json',
				async : false,
				data : {
					
				},
				success : function(json) {
					$('#DataGroupByMainKeyWords').html(json.datamainkeywords);
					$('#DataGroupByUrl').html(json.dataurl);
					$('#FilesGroupByMainKeyWords').html(json.filesmainkeywords);
					$('#FilesGroupByUrl').html(json.filesurl);
					$('#FilesGroupByLanguage').html(json.fileslanguage);

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
</body>
</html>
