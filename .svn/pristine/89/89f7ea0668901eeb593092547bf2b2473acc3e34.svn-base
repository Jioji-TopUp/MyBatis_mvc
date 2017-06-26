<%@ page language="java" import="java.util.*,com.scbd.common.utl.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String Hdfsprefix="0";
	//Hdfsprefix = zykyInitBean.getInstance().getHdfsprefix();		
			
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

<style type="text/css">
.menuTree {
	hight: 400px;
}

.menuTree div {
	padding-left: 1px;
}

.menuTree div ul {
	overflow: hidden;
	display: none;
	height: auto;
	margin: 0;
}

.menuTree span {
	display: block;
	height: 20px;
	line-height: 25px;
	padding-left: 5px;
	margin: 1px 0;
	cursor: pointer;
	border-bottom: 1px solid #CCC;
}

.menuTree span:hover {
	background-color: #e6e6e6;
	color: #cf0404;
}

.menuTree a {
	color: #333;
	text-decoration: none;
}

.menuTree a:hover {
	color: #06F;
}

.menuTree span {
	height: 30px;
}
</style>

</head>

<body id="abcd" class="gray-bg" onload="init()">
	<div class="wrapper wrapper-content  animated fadeInRight">

		<div class="row">
			<div class="ibox ">
				<div class="ibox-title">

					<h5>
						<pre>字典管理</pre>

					</h5>

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

					<div class="ibox float-e-margins">


						<div class="modal inmodal fade" id="myModal5" tabindex="-1"
							role="dialog" aria-hidden="true">
							<div class="modal-dialog modal-lg" Style="width:400px">
								<div class="modal-content"></div>
							</div>
						</div>


					</div>
				</div>



			</div>
		</div>
	</div>


		<script>
			function init() {
				$
						.ajax({
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
				alert(companyid);
			
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
		
		<input name="hidden" value=<%=Hdfsprefix %>>
</body>

</html>
