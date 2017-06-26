<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String key="k1";
	if(request.getParameter("key")!=null){
		key=request.getParameter("key");
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




<script type="text/javascript">
	/*-----右侧数据表----*/
	function CompanyDataList(page,interval) {
		var key=$("#keyhidden").val();
		var value=$("#valuehidden").val();
		var start = (page - 1) * interval;
		$.ajax({
			type : "get",
			url : "./getCompanyFilesByCondition",
			dataType : 'json',
			data : {
				start : start,
				interval : interval,
				key :key,
				value:value
			},
			success : function(json) {
				var table="<table >";				
				
				//拼接th
				var thvalues = ["文件名","文件路径","文件类型","提交时间","标签"];
				var tabletitle = gettitleWithValues(thvalues);
				
				//拼接td
				var tablebody="";
				var list=json["list"];
				for ( var p in list) {
				
					var v = list[p];
					var a = "<a href='"
						+v.filepath
						+"' target='_blank'>"
						+v.filepath+"</a>";
					var tdvalues = [v.filename,a,v.filetype,v.posttime,v.tids];
					tablebody += getrowWithValues(tdvalues);
					
				}
				table = table+tabletitle+tablebody + "</table>";
				
				$("#CompanyFilesList").html(table);
				
				
				//分页栏
				var count = json["count"];
				
				var page=Math.ceil((start+1)/interval);
            	totalpage=Math.ceil(count/interval);
            	
            	var m_str2="";
            	m_str2 += "<a class='btn btn-white r' onclick='pageprev("+page+","+interval+")'>上一页</a>";
				m_str2=m_str2+"<a class='btn btn-white r' onclick='pagenext("+page+","+interval+","+totalpage+")'>下一页</a>";
				m_str2=m_str2+"<span class='btn btn-white '>第"+page+"页/共"+totalpage+"页</span>";
            	
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
			CompanyDataList(page,interval);
		}else{
			alert("已到末页");
		}
	}
	
	function pageprev(page,interval){
		if(page>1){
			page=page-1;
			CompanyDataList(page,interval);
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
	<!-- 自定义js -->
	<script src="./pages/js/table.js"></script>


</head>

<body id="abcd" class="gray-bg" onload="init()" style="width:100%;overflow:scroll; ">
	<div class="wrapper wrapper-content  animated fadeInRight">

		<div class="row">
			<div class="ibox ">
				<div class="ibox-title">

				<a href="./pages/dataview/testDataStatics.jsp" class="btn btn-white" ><img style="margin-right:5px;width:25px;height:25px;" alt="" src="./pages/css/img/back.jpg" />&nbsp;返回</a>

					<div>

						<div style="width:100%;" class="ibox-content">
							<p></p>

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
					
					<div style="height: 500px;display: inline-block;width: 800px ;text-align:center" >
						<div id="CompanyFilesList"></div>
						<div id="CompanyFilesPager"></div>
					</div>
				</div>



			</div>
		</div>



		<script>
			function init() {
				var key=$("#keyhidden").val();
				$
						.ajax({
							type : "get",
							url : "./getCompanyFilesGroupByCondition",
							dataType : 'json',
							data : {
								key : key

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
					urlstr = "<div><span onclick=\"showCompanyData('"
							+ o[i]._id + "')\">" + "<a>" + o[i]._id
							+ "</a></span>";
					urlstr = urlstr + "</div>";
					str = str + urlstr;
				}
				console.log(str);
				return str;
			};

			function showCompanyData(companyid) {
				$("#valuehidden").val(companyid);
				CompanyDataList(1,5);
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
		<input type="hidden" id="keyhidden" value=<%=key%> />
		<input type="hidden" id="valuehidden" value="0" />
</body>
</html>
