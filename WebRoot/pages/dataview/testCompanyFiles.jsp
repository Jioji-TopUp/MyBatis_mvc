<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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



	<!-- 自定义css -->
	<link href="./pages/css//menu.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="./pages/css/button.css">
	<link rel="stylesheet" type="text/css" href="./pages/css/table.css">
	<link rel="stylesheet" type="text/css" href="./pages/css/font.css">
	<!-- 自定义js -->
	<script src="./pages/js/table.js"></script>
</head>

<body id="abcd" class="gray-bg" onload="init()" style="width:100%;overflow:scroll; ">
	<div class="wrapper wrapper-content  animated fadeInRight">

		<div class="row">
			<div class="ibox ">
				<div class="ibox-title">

					<div>

						<div style="width:100%;" class="ibox-content">
							

							<div
								style="white-space:nowrap;height:400px;overflow:auto;float:left;width:18%"
								id="menuTree" class="menuTree"></div>

							<div
								style="*clear:right;display:inline-block;float:left;border:1px solid #b2b2b2;width:1px;height:300px;"></div>
							<div
								style="white-space:nowrap;float:left;width:75%;padding-left:5px;">
								<div class="table-responsive" id="adminUser"></div>
								<div id="adminUser_page" style="text-align: center;"></div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-sm-4">


				
			<!-- 右侧数据 -->
			<div style="height: 800px;display: inline-block;width: 800px;text-align:center">
				<div id="CompanyFilesList"></div>
				<div id="CompanyFilesPager"></div>
				<input type="hidden" id="companyId" value="0"/>
			</div>

</div>
			</div>
		</div>
		

	
	</div>


		<script>
		/*----------左侧数据菜单-------------*/
		
			function init() {
				$.ajax({
							type : "get",
							url : "./getCompanyFilesList",
							dataType : 'json',
							data : {

							},
							success : function(json) {
								document.getElementById("menuTree").innerHTML = forTree(json.list);
								menuTree = function() {
									//给有子对象的元素加
									$("#menuTree ul").each(
											function(index, element) {
												var ulContent = $(element)
														.html();
												var spanContent = $(element)
														.siblings("span")
														.html();
												if (ulContent) {
													$(element).siblings("span")
															.html(spanContent);
												}
											});

									$("#menuTree")
											.find("div span")
											.click(
													function() {
														var ul = $(this)
																.siblings("ul");
														var spanStr = $(this)
																.html();
														var spanContent = spanStr
																.substr(
																		3,
																		spanStr.length);
														if (ul.find("div")
																.html() != null) {
															if (ul
																	.css("display") == "none") {
																ul.show(300);
															} else {
																ul.hide(300);
															}
														}
													});
								}();

								$("#btn_open").click(function() {
									$("#menuTree ul").show(300);
									curzt("-");
								});

								/*收缩*/
								$("#btn_close").click(function() {
									$("#menuTree ul").hide(300);
									curzt("+");
								});

							},
							beforeSend : function() {

							},
							complete : function(XMLHttpRequest, textStatus) {

							},
							error : function() {

							}
						});

			}

			forTree = function(o) {
				str = "";
				for ( var i = 0; i < o.length; i++) {
					var urlstr = "";
					urlstr = "<div><span onclick=\"showCompanyData('"+o[i].companyid+"')\">" + "<a>" + o[i].companyname
							+ "</a></span>";
					urlstr = urlstr + "</div>";
					str = str + urlstr;
				}
				//console.log(str);
				return str;
			};
			
			function showCompanyData(companyid){
				
				$("#companyId").val(companyid);
				
				//右侧数据展现
				CompanyFilesList(1,5);
			
			}

			function curzt(v) {
				$("#menuTree span").each(function(index, element) {
					var ul = $(this).siblings("ul");
					var spanStr = $(this).html();
					var spanContent = spanStr.substr(3, spanStr.length);
					if (ul.find("div").html() != null) {
						$(this).html("[" + v + "] " + spanContent);
					}
				});
			}
		</script>

<script type="text/javascript">
	/*------------右侧数据列表-------------*/
	
	
	
	function CompanyFilesList(page,interval) {
		var companyId=$("#companyId").val();

		var start = (page - 1) * interval;
		$.ajax({
			type : "get",
			url : "./getCompanyFiles",
			dataType : 'json',
			data : {
				start : start,
				interval : interval,
				companyid :companyId
			},
			success : function(json) {
				var table="<table >";				
				var tabletitle = "<thead><th>文件名</th><th >文件路径</th><th >文件类型</th><th >提交时间</th><th >标签</th></thead>";
				var tablebody="";
								
				
				var list=json["list"];
				for ( var p in list) {
					var a = "<a href='"
						+list[p].filepath
						+"' target='_blank'>"
						+list[p].filepath+"</a>";
					tablebody = tablebody
							+ "<tr >";
					tablebody = tablebody
							+ "<td width='10%'>"
							+ list[p].filename + "</td>";
					tablebody = tablebody
							+ "<td width='10%' >"
							+a
						
							+ "</td>";
							
					tablebody = tablebody
							+ "<td width='10%'>"
							+ list[p].filetype + "</td>";
							
					tablebody = tablebody
							+ "<td width='10%'>"
							+ list[p].posttime + "</td>";
					tablebody = tablebody
							+ "<td width='10%'>"
							+ list[p].tids + "</td>";
					
					
					tablebody=tablebody+"</tr>";
				}
				table = table+tabletitle+tablebody + "</table>";
				$("#CompanyFilesList").html(table);
				
				var count = json["count"];
				
				var page=Math.ceil((start+1)/interval);
            	totalpage=Math.ceil(count/interval);
            	
            	var m_str2="<a class='btn btn-white r' onclick='pageprev("+page+","+interval+")'>上一页</a>";
				m_str2=m_str2+"<a class='btn btn-white r' onclick='pagenext("+page+","+interval+","+totalpage+")'>下一页</a>";
				m_str2=m_str2+"<span class='btn btn-white' style='border:1px solid #DDDDDD'>第"+page+"页/共"+totalpage+"页</span>";
				

            	
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
			CompanyFilesList(page,interval);
		}else{
			alert("已到末页");
		}
	}
	
	function pageprev(page,interval){
		if(page>1){
			page=page-1;
			CompanyFilesList(page,interval);
		}else{
			alert("已到第一页");
		}
	}	

</script>

<input type="hidden" id="pageindex"></input>
</body>
</html>
