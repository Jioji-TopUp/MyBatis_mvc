<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>




<base href="<%=basePath%>">

<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>公司报表信息</title>

<link rel="shortcut icon" href="favicon.ico">
<link href="./page/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="./page/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="./page/css/animate.css" rel="stylesheet">
<link href="./page/css/style.css?v=4.1.0" rel="stylesheet">
<link href="./page/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">


<script language="javascript" type="text/javascript"
src="<%=request.getContextPath()%>/My97DatePicker/WdatePicker.js">	
</script>
<script type="text/javascript" src="./res/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="./res/js/jquery-ui-1.10.3.min.js"></script>
<link rel="stylesheet" href="./res/css/jquery-ui.min.css"
	type="text/css"></link>
<script type="text/javascript" src="./res/js/jquery-form.js"></script>

</head>

 <style type="text/css">
            td
            {text-align: center;
            background: #d5eaf0;
            }
        </style>

<script>


 function QueryCompanybyId() {

	 var id =<%=request.getParameter("id")%>; 
	 
		$.ajax({
			type : "post",
			url : "./QueryCompanybyId",
			dataType : 'json',
			data : {

				id : id,
			},
			success : function(json) {
                
				var list = json["list"];
				
				//localhost:8080
				var pinjie="<a  href=\"http://localhost:8080/zykyDemo/pages/dataview/testCompanyDataByCompanyIdAndKeywords.jsp?";
				var houmian="&start=0&interval=5\"  class=\"btn btn-primary layer-date\"  >原始数据</a>";
				
				$("#company_name").html(list[0].company_name);
				$("#company_name1").html(pinjie+"keyword=101&companyid="+list[0].id+""+houmian);
				$("#address").html(list[0].address);
				$("#address1").html(pinjie+"keyword=102&companyid="+list[0].id+""+houmian);
				$("#aerospace_address").html(list[0].aerospace_address);
				$("#aerospace_address1").html(pinjie+"keyword=103&companyid="+list[0].id+""+houmian);
				$("#type").html(list[0].type);
				$("#type1").html(pinjie+"keyword=104&companyid="+list[0].id+""+houmian);
			    $("#vision").html(list[0].vision);
			    $("#vision1").html(pinjie+"keyword=105&companyid="+list[0].id+""+houmian);
				$("#mission").html(list[0].mission);
				$("#mission1").html(pinjie+"keyword=106&companyid="+list[0].id+""+houmian);
			    $("#objective").html(list[0].objective);
			    $("#objective1").html(pinjie+"keyword=107&companyid="+list[0].id+""+houmian);
			    $("#business_description").html(list[0].business_description);
			    $("#business_description1").html(pinjie+"keyword=108&companyid="+list[0].id+""+houmian);
				$("#competitor").html(list[0].competitor);
				$("#competitor1").html(pinjie+"keyword=109&companyid="+list[0].id+""+houmian);
				$("#advantage").html(list[0].advantage);
				$("#advantage1").html(pinjie+"keyword=110&companyid="+list[0].id+""+houmian);
				$("#annual_report").html(list[0].annual_report);
				$("#annual_report1").html(pinjie+"keyword=111&companyid="+list[0].id+""+houmian);
				$("#news").html(list[0].news);	
				$("#news1").html(pinjie+"keyword=112&companyid="+list[0].id+""+houmian);	
					
					
				$("#partners").html(list[0].partners);
				$("#partners1").html(pinjie+"keyword=201&companyid="+list[0].id+""+houmian);
				$("#repair").html(list[0].repair);
				$("#repair1").html(pinjie+"keyword=202&companyid="+list[0].id+""+houmian);
				$("#spare_support").html(list[0].spare_support);
				$("#spare_support1").html(pinjie+"keyword=203&companyid="+list[0].id+""+houmian);
				
				
				
				$("#investment").html(list[0].investment);
				$("#investment1").html(pinjie+"keyword=301&companyid="+list[0].id+""+houmian );
				$("#oem").html(list[0].oem);
				$("#oem1").html(pinjie+"keyword=302&companyid="+list[0].id+""+houmian);
				$("#profit_ratio").html(list[0].profit_ratio);
				$("#profit_ratio1").html(pinjie+"keyword=303&companyid="+list[0].id+""+houmian);
				$("#revenues_growth").html(list[0].revenues_growth);
				$("#revenues_growth1").html(pinjie+"keyword=304&companyid="+list[0].id+""+houmian);
				$("#growth_growth").html(list[0].growth_growth);
				$("#growth_growth1").html(pinjie+"keyword=305&companyid="+list[0].id+""+houmian);
				$("#mergers_acquisitions").html(list[0].mergers_acquisitions);
				$("#mergers_acquisitions1").html(pinjie+"keyword=306&companyid="+list[0].id+""+houmian);
				$("#merger_intention").html(list[0].merger_intention);
				$("#merger_intention1").html(pinjie+"keyword=307&companyid="+list[0].id+""+houmian);
				
				
				
				$("#current_ratio").html(list[0].current_ratio);
				$("#current_ratio1").html(pinjie+"keyword=401&companyid="+list[0].id+""+houmian);			
				$("#equity_ratio").html(list[0].equity_ratio);
				$("#equity_ratio1").html(pinjie+"keyword=402&companyid="+list[0].id+""+houmian);
				$("#assets_return").html(list[0].assets_return);
				$("#assets_return1").html(pinjie+"keyword=403&companyid="+list[0].id+""+houmian);
				$("#increase").html(list[0].increase);
				$("#increase1").html(pinjie+"keyword=404&companyid="+list[0].id+""+houmian);	
				$("#shareholder_ratio").html(list[0].shareholder_ratio);
				$("#shareholder_ratio1").html(pinjie+"keyword=405&companyid="+list[0].id+""+houmian);
				$("#creditor").html(list[0].creditor);
				$("#creditor1").html(pinjie+"keyword=406&companyid="+list[0].id+""+houmian);
				$("#anditor").html(list[0].anditor);
				$("#anditor1").html(pinjie+"keyword=407&companyid="+list[0].id+""+houmian);
				
				
				
				
				$("#board").html(list[0].board);
				$("#board1").html(pinjie+"keyword=501&companyid="+list[0].id+""+houmian);
				$("#board_changes").html(list[0].board_changes);	
				$("#board_changes1").html(pinjie+"keyword=502&companyid="+list[0].id+""+houmian);						
				$("#staff_turnover").html(list[0].staff_turnover);
				$("#staff_turnover1").html(pinjie+"keyword=503&companyid="+list[0].id+""+houmian);
				$("#union_build").html(list[0].union_build);
				$("#union_build1").html(pinjie+"keyword=504&companyid="+list[0].id+""+houmian);
				$("#labor_collective").html(list[0].labor_collective);
				$("#labor_collective1").html(pinjie+"keyword=505&companyid="+list[0].id+""+houmian);
				$("#flight_project_staff").html(list[0].flight_project_staff);
				$("#flight_project_staff1").html(pinjie+"keyword=506&companyid="+list[0].id+""+houmian);
				$("#flight_project_change").html(list[0].flight_project_change);
				$("#flight_project_change1").html(pinjie+"keyword=507&companyid="+list[0].id+""+houmian);
				$("#staff").html(list[0].staff);
				$("#staff1").html(pinjie+"keyword=508&companyid="+list[0].id+""+houmian);
				
				
				
				
				$("#organization_strategy").html(list[0].organization_strategy);
				$("#organization_strategy1").html(pinjie+"keyword=601&companyid="+list[0].id+""+houmian);
				$("#supplier_problemky").html(list[0].supplier_problemky);
				$("#supplier_problemky1").html(pinjie+"keyword=602&companyid="+list[0].id+""+houmian);
				$("#supplier_problemyi").html(list[0].supplier_problemyi);
				$("#supplier_problemyi1").html(pinjie+"keyword=603&companyid="+list[0].id+""+houmian);
				$("#legal_case").html(list[0].legal_case);
				$("#legal_case1").html(pinjie+"keyword=604&companyid="+list[0].id+""+houmian);
				$("#force_majeure").html(list[0].force_majeure);
				$("#force_majeure1").html(pinjie+"keyword=605&companyid="+list[0].id+""+houmian);
				
				
				
			
				
				
			

			},
			beforeSend : function() {
			},
			complete : function(XMLHttpRequest, textStatus) {

			},
			error : function() {
			}
		});
};



</script>
<script type="text/javascript">
		function QueryNewsInfobycompanyId(page, interval) {
			var start = (page - 1) * interval;
		var company_id =<%=request.getParameter("id")%>; 

			$
					.ajax({
						type : "post",
						url : "./QueryNewsInfobycompanyId",
						dataType : 'json',
						data : {
                              company_id:company_id,
							start : start,
							limit:interval,
							
						},
						success : function(json) {

							var returnnum = json["code"];
							if (returnnum == '1') {
								$("#news_info")
										.html("没有查询到新闻信息");

							} else {

					var m_str1 = "";

								m_str1 = "<table class=\"table table-striped table-hover\"><thead><tr><th style=\"text-align: center;\">新闻标题</th><th style=\"text-align: center;\">来自网站</th><th style=\"text-align: center;\">新闻发布时间</th><th style=\"text-align: center;\">入库时间</th></tr></thead><tbody>";
								var list = json["list"];

								for ( var p in list) {
						
								
									m_str1 = m_str1 + "<tr  >";


									m_str1 = m_str1
											+ "<td style=\"width:200px;text-align: center;\">"+
											"<a href=\""+list[p].news_url+"\" target=\"_blank\">"+ list[p].news_title + "</a></td>";

									m_str1 = m_str1
											+ "<td  style=\"width:100px;text-align: center;\">"
											+ list[p].news_website + "</td>";
												m_str1 = m_str1
											+ "<td  style=\"width:100px;text-align: center;\">"
											+ list[p].news_time + "</td>";
														m_str1 = m_str1
											+ "<td  style=\"width:100px;text-align: center;\">"
											+ list[p].news_posttime+ "</td>";
								
											
										
				

									m_str1 = m_str1
											+ "</tr>";

								}
							
								$("#news_info").html(m_str1);

								var count = json["count"];

								var page = Math.ceil((start + 1) / interval);
								totalpage = Math.ceil(count / interval);

								var m_str2 = "<button type=\"button\" class='btn btn-white' onclick='news_infocount_pageprev("
										+ page + "," + interval + ")'>上一页</button>";
								m_str2 = m_str2
										+ "<button type=\"button\" class='btn btn-white' onclick='news_infocount_pagenext("
										+ page + "," + interval + ","
										+ totalpage + ")'>下一页</button>";
								m_str2 = m_str2 + "<span class='btn btn-white'>第" + page + "页/共"
										+ totalpage + "页</span>";

								$("#news_infocount")
										.html(m_str2);

							}

						},
						beforeSend : function() {

						},
						complete : function(XMLHttpRequest, textStatus) {

						},
						error : function() {

						}
					});
		}

		function news_infocount_pagenext(page, interval, totalpage) {

			if (page < totalpage) {
				page = page + 1;
				QueryNewsInfobycompanyId(page, interval);
			} else {
				alert("已到末页");
			}
		}

		function news_infocount_pageprev(page, interval) {
			if (page > 1) {
				page = page - 1;
				QueryNewsInfobycompanyId(page, interval);
			} else {
				alert("已到第一页");
			}
		}
	</script>	
	
	
	<script type="text/javascript">
		function QueryOemInfobycompanyId(page, interval) {
			var start = (page - 1) * interval;
		var company_id =<%=request.getParameter("id")%>; 

			$
					.ajax({
						type : "post",
						url : "./QueryOemInfobycompanyId",
						dataType : 'json',
						data : {
                              company_id:company_id,
							start : start,
							limit:interval,
							
						},
						success : function(json) {

							var returnnum = json["code"];
							if (returnnum == '1') {
								$("#oem_info")
										.html("没有查询到授权项目");

							} else {

								var m_str1 = "";

								m_str1 = "<table class='table table-bordered table-striped'><thead><tr><th style=\"text-align: center;\">授权公司</th><th style=\"text-align: center;\">代工项目</th><th style=\"text-align: center;\">产品类型</th><th style=\"text-align: center;\">授权时间</th></tr></thead><tbody>";
								var list = json["list"];

								for ( var p in list) {
								
								
									m_str1 = m_str1 + "<tr  >";


									m_str1 = m_str1
											+ "<td style=\"width:200px;text-align: center;\">"
											+ list[p].oem_company + "</td>";

									m_str1 = m_str1
											+ "<td style=\"width:100px;text-align: center;\">"
											+ list[p].oem_name + "</td>";
									m_str1 = m_str1
											+ "<td style=\"width:100px;text-align: center;\">"
											+ list[p].oem_type + "</td>";
											
												m_str1 = m_str1
											+ "<td style=\"width:100px;text-align: center;\">"
											+ list[p].oem_time + "</td>";
				

									m_str1 = m_str1
											+ "</tr>";

								}
								m_str1 = m_str1 + "</tbody></table>";
							
								$("#oem_info").html(m_str1);

								var count = json["count"];

								var page = Math.ceil((start + 1) / interval);
								totalpage = Math.ceil(count / interval);

								var m_str2 = "<button type=\"button\" class='btn btn-white' onclick='oem_infocount_pageprev("
										+ page + "," + interval + ")'>上一页</button>";
								m_str2 = m_str2
										+ "<button type=\"button\" class='btn btn-white' onclick='oem_infocount_pagenext("
										+ page + "," + interval + ","
										+ totalpage + ")'>下一页</button>";
								m_str2 = m_str2 + "<span class='btn btn-white'>第" + page + "页/共"
										+ totalpage + "页</span>";

								$("#oem_infocount")
										.html(m_str2);

							}

						},
						beforeSend : function() {

						},
						complete : function(XMLHttpRequest, textStatus) {

						},
						error : function() {

						}
					});
		}

		function oem_infocount_pagenext(page, interval, totalpage) {

			if (page < totalpage) {
				page = page + 1;
				QueryOemInfobycompanyId(page, interval);
			} else {
				alert("已到末页");
			}
		}

		function oem_infocount_pageprev(page, interval) {
			if (page > 1) {
				page = page - 1;
				QueryOemInfobycompanyId(page, interval);
			} else {
				alert("已到第一页");
			}
		}
	</script>
	
	
	
	
	
	
	<script type="text/javascript">
		function QueryStaffInfobycompanyId(page, interval) {
			var start = (page - 1) * interval;
			 var resources_name=document.getElementById("resources_name").value;
		var company_id =<%=request.getParameter("id")%>; 

			$
					.ajax({
						type : "post",
						url : "./StaffInfoPaginationAndName",
						dataType : 'json',
						data : {
						resources_name:resources_name,
                              company_id:company_id,
							start : start,
							limit:interval,
							
						},
						success : function(json) {

							var returnnum = json["code"];
							if (returnnum == '1') {
								$("#staff_info")
										.html("没有查询到员工信息");

							} else {


                                                       
                                         
                                            
								var m_str1 = "";

								m_str1 = "<table class=\"table table-striped table-hover\"><thead><tr><th style=\"text-align: center;\">姓名</th><th style=\"text-align: center;\">背景</th><th style=\"text-align: center;\">职位</th></tr></thead><tbody>";
								var list = json["list"];

								for ( var p in list) {
						
								
									m_str1 = m_str1 + "<tr  >";


									m_str1 = m_str1
											+ "<td style=\"width:200px;text-align: center;\">"
											+ list[p].staff_name + "</td>";

									m_str1 = m_str1
											+ "<td  style=\"width:100px;text-align: center;\">"
											+ list[p].background + "</td>";
									m_str1 = m_str1
											+ "<td style=\"width:100px;text-align: center;\">"
											+ list[p].postion + "</td>";
											
										
				

									m_str1 = m_str1
											+ "</tr>";

								}
								m_str1 = m_str1 + "</tbody></table>";
							
								$("#staff_info").html(m_str1);

								var count = json["count"];

								var page = Math.ceil((start + 1) / interval);
								totalpage = Math.ceil(count / interval);

								var m_str2 = "<button type=\"button\" class='btn btn-white' onclick='staff_infocount_pageprev("
										+ page + "," + interval + ")'>上一页</button>";
								m_str2 = m_str2
										+ "<button type=\"button\" class='btn btn-white' onclick='staff_infocount_pagenext("
										+ page + "," + interval + ","
										+ totalpage + ")'>下一页</button>";
								m_str2 = m_str2 + "<span class='btn btn-white'>第" + page + "页/共"
										+ totalpage + "页</span>";

								$("#staff_infocount")
										.html(m_str2);

							}

						},
						beforeSend : function() {

						},
						complete : function(XMLHttpRequest, textStatus) {

						},
						error : function() {

						}
					});
		}

		function staff_infocount_pagenext(page, interval, totalpage) {

			if (page < totalpage) {
				page = page + 1;
				QueryStaffInfobycompanyId(page, interval);
			} else {
				alert("已到末页");
			}
		}

		function staff_infocount_pageprev(page, interval) {
			if (page > 1) {
				page = page - 1;
				QueryStaffInfobycompanyId(page, interval);
			} else {
				alert("已到第一页");
			}
		}
	</script>
	
	
	
	
	<script type="text/javascript">
		function QueryBoardInfobycompanyId(page, interval) {
			var start = (page - 1) * interval;
			
			 var resources_name=document.getElementById("resources_name").value;
			
		var company_id =<%=request.getParameter("id")%>; 

			$
					.ajax({
						type : "post",
						url : "./BoardInfoPaginationAndName",
						dataType : 'json',
						data : {
						resources_name:resources_name,
                              company_id:company_id,
							start : start,
							limit:interval,
							
						},
						success : function(json) {

							var returnnum = json["code"];
							if (returnnum == '1') {
								$("#board_info")
										.html("没有查询到董事会成员信息");

							} else {


                                                       
                                         
                                            
								var m_str1 = "";

								m_str1 = "<table class=\"table table-striped table-hover\"><thead><tr><th style=\"text-align: center;\">姓名</th><th style=\"text-align: center;\">任职时间</th><th style=\"text-align: center;\">职位</th></tr></thead><tbody>";
								var list = json["list"];

								for ( var p in list) {
						
								
									m_str1 = m_str1 + "<tr  >";


									m_str1 = m_str1
											+ "<td style=\"width:200px;text-align: center;\">"
											+ list[p].board_name + "</td>";

									m_str1 = m_str1
											+ "<td  style=\"width:100px;text-align: center;\">"
											+ list[p].service + "</td>";
												m_str1 = m_str1
											+ "<td  style=\"width:100px;text-align: center;\">"
											+ list[p].postion + "</td>";
								
											
										
				

									m_str1 = m_str1
											+ "</tr>";

								}
								m_str1 = m_str1 + "</tbody></table>";
							
								$("#board_info").html(m_str1);

								var count = json["count"];

								var page = Math.ceil((start + 1) / interval);
								totalpage = Math.ceil(count / interval);

								var m_str2 = "<button type=\"button\" class='btn btn-white' onclick='board_infocount_pageprev("
										+ page + "," + interval + ")'>上一页</button>";
								m_str2 = m_str2
										+ "<button type=\"button\" class='btn btn-white' onclick='board_infocount_pagenext("
										+ page + "," + interval + ","
										+ totalpage + ")'>下一页</button>";
								m_str2 = m_str2 + "<span class='btn btn-white'>第" + page + "页/共"
										+ totalpage + "页</span>";

								$("#board_infocount")
										.html(m_str2);

							}

						},
						beforeSend : function() {

						},
						complete : function(XMLHttpRequest, textStatus) {

						},
						error : function() {

						}
					});
		}

		function board_infocount_pagenext(page, interval, totalpage) {

			if (page < totalpage) {
				page = page + 1;
				QueryBoardInfobycompanyId(page, interval);
			} else {
				alert("已到末页");
			}
		}

		function board_infocount_pageprev(page, interval) {
			if (page > 1) {
				page = page - 1;
				QueryBoardInfobycompanyId(page, interval);
			} else {
				alert("已到第一页");
			}
		}
	</script>
	
	
	
	
	<script type="text/javascript">
		function QuerySupplier_problemInfobycompanyId(page, interval) {
			var start = (page - 1) * interval;
		var company_id =<%=request.getParameter("id")%>; 

			$
					.ajax({
						type : "post",
						url : "./QuerySupplier_problemInfobycompanyId",
						dataType : 'json',
						data : {
                              company_id:company_id,
							start : start,
							limit:interval,
							
						},
						success : function(json) {

							var returnnum = json["code"];
							if (returnnum == '1') {
								$("#supplier_probleminfo")
										.html("没有查询到特殊问题信息");

							} else {


                                                       
                                         
                                            
								var m_str1 = "";

								m_str1 = "<table class=\"table table-striped table-hover\"><thead><tr><th style=\"text-align: center;\">标题</th><th style=\"text-align: center;\">类型</th><th style=\"text-align: center;\">产品名</th><th style=\"text-align: center;\">原因</th></tr></thead><tbody>";
								var list = json["list"];

								for ( var p in list) {
						
								
									m_str1 = m_str1 + "<tr  >";


									m_str1 = m_str1
											+ "<td style=\"width:200px;text-align: center;\">"+
											"<a href=\""+list[p].supplier_url+"\" target=\"_blank\">"+ list[p].supplier_title + "</a></td>";

									m_str1 = m_str1
											+ "<td  style=\"width:100px;text-align: center;\">"
											+ list[p].supplier_sort + "</td>";
												m_str1 = m_str1
											+ "<td  style=\"width:100px;text-align: center;\">"
											+ list[p].supplier_product + "</td>";
														m_str1 = m_str1
											+ "<td  style=\"width:100px;text-align: center;\">"
											+ list[p].supplier_reason + "</td>";
								
											
										
				

									m_str1 = m_str1
											+ "</tr>";

								}
								m_str1 = m_str1 + "</tbody></table>";
							
								$("#supplier_probleminfo").html(m_str1);

								var count = json["count"];

								var page = Math.ceil((start + 1) / interval);
								totalpage = Math.ceil(count / interval);

								var m_str2 = "<button type=\"button\" class='btn btn-white' onclick='supplier_probleminfocount_pageprev("
										+ page + "," + interval + ")'>上一页</button>";
								m_str2 = m_str2
										+ "<button type=\"button\" class='btn btn-white' onclick='supplier_probleminfocount_pagenext("
										+ page + "," + interval + ","
										+ totalpage + ")'>下一页</button>";
								m_str2 = m_str2 + "<span class='btn btn-white'>第" + page + "页/共"
										+ totalpage + "页</span>";

								$("#supplier_probleminfocount")
										.html(m_str2);

							}

						},
						beforeSend : function() {

						},
						complete : function(XMLHttpRequest, textStatus) {

						},
						error : function() {

						}
					});
		}

		function supplier_probleminfocount_pagenext(page, interval, totalpage) {

			if (page < totalpage) {
				page = page + 1;
				QuerySupplier_problemInfobycompanyId(page, interval);
			} else {
				alert("已到末页");
			}
		}

		function supplier_probleminfocount_pageprev(page, interval) {
			if (page > 1) {
				page = page - 1;
				QuerySupplier_problemInfobycompanyId(page, interval);
			} else {
				alert("已到第一页");
			}
		}
	</script>
	
	  <script>
	  function dcbg() {
        var html = "<html><head><meta charset='utf-8' /></head><body>" + document.getElementsByTagName("table")[0].outerHTML + "</body></html>";
        var blob = new Blob([html], { type: "text/html" });
        var a = document.getElementsByTagName("a")[0];
        a.href = URL.createObjectURL(blob);
        a.download = "供应商报表信息.xls";
        }
    </script>

<body onload="QueryCompanybyId()">



	<div id="CompanyDetails">

		<div class="ibox-title">
		
		
		<a  name="dcbg" class="btn btn-primary layer-date" onclick="dcbg()" >导出表格</a>
	
		<div  style="float: right;padding-right: 152px;">	
				  <a  href="javascript:history.go(-1);"  class="btn btn-primary layer-date"  >返回</a>  
				</div>
		</div>


		<div class="ibox-content" style="text-align: center;">



			<div class="table-responsive" id="CompanyDetails_Company">
				<table class='table table-bordered table-striped' >
				<tr>
				<th  style=" width:100px;text-align: center;background-color: #56a2cf;border-color: #56a2cf">类别</th>
				<th style="width:100px;text-align: center;background-color: #56a2cf;border-color: #56a2cf">Section</th>
				<th style="width:400px;text-align: center;background-color: #56a2cf;border-color: #56a2cf">指标</th>
				<th style="width:400px;text-align: center;background-color: #56a2cf;border-color: #56a2cf">Description</th>
				<th style="width:500px;text-align: center;background-color: #56a2cf;border-color: #56a2cf">结果</th>
				<th style="width:100px;text-align: center;background-color: #56a2cf;border-color: #56a2cf">原始数据</th>
					</tr>
					<tr>
					<td style="text-align: center;background-color: #89cff0" rowspan="12" >公司基本信息</td>
					<td style="text-align: center;background-color: #89cff0" rowspan="12">Basic Company Information</td>
					<td>公司名称</td>
					<td>Company Name</td>
					<td><div  style="width:400px"  id="company_name"></div> </td>
					<td><div  id="company_name1"></div></td>
					</tr>
					<tr>
					<td>公司总部地址</td>
					<td>Address of Headqiarters</td>
					<td> <div  style="width:400px"    id="address"></div></td>
					<td><div  id="address1"></div></td>
					</tr>
					<tr>
					<td>航空业务总部地址</td>
					<td>Address of Aerospace Headquarters</td>
					<td> <div  style="width:400px"    id="aerospace_address"></div></td>
					<td><div  id="aerospace_address1"></div></td>
					</tr>
					<tr>
					<td>上市公司/私人公司</td>
					<td>Listed Company/Private Company</td>
					<td> <div  style="width:400px"    id="type"></div></td>
					<td><div  id="type1"></div></td>
					</tr>
					<tr>
					<td>公司愿景</td>
					<td>Company Vision(s)</td>
					<td> <div  style="width:400px"  id="vision"></div></td>
					<td><div  id="vision1"></div></td>
					</tr>
					<tr>
					<td>公司使命</td>
					<td>Company Mission(s)</td>
					<td> <div  style="width:400px"   id="mission"></div></td>
					<td><div  id="mission1"></div></td>
					</tr>
					<tr>
					<td>公司目标</td>
					<td>Company Objective(s)</td>
					<td><div  style="width:400px"   id="objective"></div></td>
					<td><div  id="objective1"></div></td>
					</tr>
					<tr>
					<td>业务相关描述</td>
					<td>Business Description</td>
					<td> <div  style="width:400px"    id="business_description"></div></td>
					<td><div  id="business_description1"></div></td>
					</tr>
					<tr>
					<td>主要竞争对手</td>
					<td>Major Competitor(s)</td>
					<td> <div  style="width:400px"   id="competitor"></div></td>
						<td> <div  id="competitor1"></div></td>
					</tr>
					<tr>
					<td>竞争优势</td>
					<td>Competitve Advantage(s)</td>
					<td> <div  style="width:400px"    id="advantage"></div></td>
					<td> <div    id="advantage1"></div></td>
					</tr>
					<tr>
					<td>最新年的年度报告</td>
					<td>A copy of latest annual report</td>
					<td> <div  style="width:400px"    id="annual_report"></div></td>
					<td> <div   id="annual_report1"></div></td>
					</tr>
					<tr>
					<td>新闻</td>
					<td>news,presentation,or articles of new technology...</td>
					<td> <div  style="width:400px"    id="news"></div></td>
					<td> <div     id="news1"></div></td>
					</tr>
					
					
					
					
					<tr>
					<td style="text-align: center;background-color: #89cff0" rowspan="3">在中国的商业布局</td>
					<td style="text-align: center;background-color: #89cff0" rowspan="3">Business in China</td>
					<td>在中国的商业合作伙伴(合作模式)</td>
					<td>Chinese Business Parter(s)[Cooperation Model]</td>
					<td> <div  style="width:400px"   id="partners"></div></td>
					<td> <div    id="partners1"></div></td>
					</tr>
					<tr>
					<td>在中国的维修能力</td>
					<td>Repair Capability in China</td>
					<td> <div  style="width:400px"   id="repair"></div></td>
					<td> <div    id="repair1"></div></td>
					</tr>
					<tr>
					<td>在中国的备件支持能力</td>
					<td>Spare Support Capability in China</td>
					<td> <div  style="width:400px"    id="spare_support"></div></td>
					<td> <div    id="spare_support1"></div></td>
					</tr>
					
					
					
					
					<tr>
					<td style="text-align: center;background-color: #89cff0" rowspan="7">商业发展</td>
					<td style="text-align: center;background-color: #89cff0" rowspan="7">Business Development</td>
					<td>过去3个财政年度的主要投资</td>
					<td>Major Investment in Last 3 Fiscal Years</td>
					<td> <div  style="width:400px"    id="investment"></div></td>
					<td> <div     id="investment1"></div></td>
					</tr>
					<tr>
					<td>现有和新增的授权代工项目</td>
					<td>Current and New Awarded OEM Program(s)</td>
					<td> <div  style="width:400px"    id="oem"></div></td>
					<td> <div     id="oem1"></div></td>
					</tr>
					<tr>
					<td>过去3个财政年度的研发费用和收入比例</td>
					<td>Ratio of R&D Expenses and Revenues in Last 3 Fiscal Years</td>
					<td> <div  style="width:400px"    id="profit_ratio"></div></td>
					<td> <div     id="profit_ratio1"></div></td>
					</tr>
					<tr>
					<td>过去3个财政年度收入增长</td>
					<td>Growth of Revenues in Last 3 Fiscal Years</td>
					<td> <div  style="width:400px"    id="revenues_growth"></div></td>
					<td> <div    id="revenues_growth1"></div></td>
					</tr>
					<tr>
					<td>故去4个财政季度的员工人数增长</td>
					<td>Growth of Head counts in Last 4 Fiscal Quarters</td>
					<td> <div  style="width:400px"    id="growth_growth"></div></td>
					<td> <div      id="growth_growth1"></div></td>
					</tr>
					<tr>
					<td>过去3个财政年的收购和兼并</td>
					<td>Acquisition and Merger in last 3 Fiscal Years</td>
					<td> <div  style="width:400px"    id="mergers_acquisitions"></div></td>
					<td> <div     id="mergers_acquisitions1"></div></td>
					</tr>
					<tr>
					<td>公司未来的收购及合并意向(和目标)</td>
					<td>Company's Intention of Acquisition and Merger in the Coming Future(amd Purposes)</td>
					<td> <div  style="width:400px"   id="merger_intention"></div></td>
					<td> <div    id="merger_intention1"></div></td>
					</tr>
					
					
					
					
					<tr>
					<td style="text-align: center;background-color: #89cff0" rowspan="7">财务信息</td>
					<td style="text-align: center;background-color: #89cff0" rowspan="7">Financial Information</td>
					<td>过去4个季度的流动比例</td>
					<td>Current Ratio in Last 4 Quarters</td>
					<td> <div  style="width:400px"    id="current_ratio"></div></td>
					<td> <div      id="current_ratio1"></div></td>
					</tr>
						<tr>
					<td>过去4个季度权益比例</td>
					<td>Equity Ratio in Last 4 Quarters</td>
					<td> <div  style="width:400px"   id="equity_ratio"></div></td>
					<td> <div  id="equity_ratio1"></div></td>
					</tr>
						<tr>
					<td>过去4个季度的资产收益率</td>
					<td>Return on Assets in Last 4 Quarters</td>
					<td> <div  style="width:400px"   id="assets_return"></div></td>
					<td> <div     id="assets_return1"></div></td>
					</tr>
						<tr>
					<td>过去3个财政年度的年采购价 /出厂价等涨幅，供应商所在国的通货膨胀率</td>
					<td>Annual Price Escalation and Inflation in Last 3 Fiscal Years</td>
					<td> <div  style="width:400px"   id="increase"></div></td>
					<td> <div    id="increase1"></div></td>
					</tr>
						<tr>
					<td>主要股东名单和所有权比例</td>
					<td>List of Major Shareholders and of Ownership</td>
					<td> <div  style="width:400px"   id="shareholder_ratio"></div></td>
					<td> <div     id="shareholder_ratio1"></div></td>
					</tr>
						<tr>
					<td>主要债权人名单,贷款金额,到期日期</td>
					<td>List of Major Creditors,Amount of Loans,and DueDates</td>
					<td> <div  style="width:400px"   id="creditor"></div></td>
					<td> <div     id="creditor1"></div></td>
					</tr>
						<tr>
					<td>审计师姓名</td>
					<td>Name of Auditor</td>
					<td> <div  style="width:400px"   id="anditor"></div></td>
					<td> <div     id="anditor1"></div></td>
					</tr>
					
					
					
					<tr>
					<td style="text-align: center;background-color: #89cff0" rowspan="8">人力资源管理</td>
					<td style="text-align: center;background-color: #89cff0" rowspan="8">Management and Human Resources</td>
					<td>过去4个财政季度董事会的变化</td>
					<td>Changes of Board of Directors and Service Years</td>
					<td> <div  style="width:400px"    id="board_changes"></div></td>
					<td> <div   id="board_changes1"></div></td>
					</tr>
						<tr>
					<td>董事会成员名单及任职时间</td>
					<td>List of Board of Directors and Service Years</td>
					<td> <div  style="width:400px"   id="board"></div></td>
					<td> <div    id="board1"></div></td>
					</tr>
						<tr>
					<td>过去4个财政季度员工离职率</td>
					<td>Staff turnover Rate in Last 4 Fiscal Quarters</td>
					<td> <div  style="width:400px"   id="staff_turnover"></div></td>
					<td> <div    id="staff_turnover1"></div></td>
					</tr>
						<tr>
					<td>工会建设</td>
					<td>Establishment of Labors'Union</td>
					<td> <div  style="width:400px"   id="union_build"></div></td>
					<td> <div    id="union_build1"></div></td>
					</tr>
						<tr>
					<td>过去3个财政年度内劳动者集体行动的数量</td>
					<td>Number of Labors'Cikkectuve Actions in Last 3 Fiscal Years</td>
					<td> <div  style="width:400px"   id="labor_collective"></div></td>
					<td> <div    id="labor_collective1"></div></td>
					</tr>
						<tr>
					<td>直接参与商飞公司项目的人员列表及职位</td>
					<td>List of Staff Directly Involved in COMAC Programs and Titles</td>
					<td> <div  style="width:400px"   id="flight_project_staff"></div></td>
					<td> <div    id="flight_project_staff1"></div></td>
					</tr>
						<tr>
					<td>4个季度直接参与商飞公司项目的人员变动情况及原因</td>
					<td>Changes of Staff Directly Involed in COMAC Programs in Last 4 Fiscal Quartes and Reasons</td>
					<td> <div  style="width:400px"   id="flight_project_change"></div></td>
					<td> <div    id="flight_project_change1"></div></td>
					</tr>
						<tr>
					<td>供应商员工背景</td>
					<td>Background of supplier's staff</td>
					<td> <div  style="width:400px"   id="staff"></div></td>
					<td> <div    id="staff1"></div></td>
					</tr>
					
					
					
					
					
						<tr>
					<td style="text-align: center;background-color: #89cff0" rowspan="5">特殊信息</td>
					<td style="text-align: center;background-color: #89cff0" rowspan="5">Special Information</td>
					<td>新的组织和战略变革</td>
					<td>New Organization and Strategy Change</td>
					<td> <div  style="width:400px"    id="organization_strategy"></div></td>
					<td> <div     id="organization_strategy1"></div></td>
					</tr>
						<tr>
					<td>任何与供应商产品有关的飞机事故的可以原因</td>
					<td>Suspected Cause of any Aircraft Accident Related to Supplier's Product(s)</td>
					<td> <div  style="width:400px"   id="supplier_problemky"></div></td>
					<td> <div     id="supplier_problemky1"></div></td>
					</tr>
						<tr>
					<td>疑似/被证实的供应商产品质量问题而被服务召回</td>
					<td>Call Back Form the Service due to Suspected/Proven Quality Issue(s) of Supplier's Product(s)</td>
					<td> <div  style="width:400px"   id="supplier_problemyi"></div></td>
					<td> <div    id="supplier_problemyi1"></div></td>
					</tr>
						<tr>
					<td>现在和过去3个财务年度的法律案件</td>
					<td>Legal Csae Now and in Last 3 Fiscal Years</td>
					<td> <div  style="width:400px"   id="legal_case"></div></td>
					<td> <div    id="legal_case1"></div></td>
					</tr>
						<tr>
					<td>现在和过去4个财政年度的不可抗力的情况</td>
					<td>Case of Force Majeure Now and in Last 3 Fiscal Years</td>
					<td> <div  style="width:400px"   id="force_majeure"></div></td>
					<td> <div  id="force_majeure1"></div></td>
					</tr>
	
					

								</table>
			
			
			
			</div>





  
            <div class="col-sm-8 " style="width:50%">
                <div class="ibox float-e-margins border-bottom" >
                    <div class="ibox-title">
                        <h5>新闻消息</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link" onclick="QueryNewsInfobycompanyId(1,5)">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="profile.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                             
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content" style="display: none;">

                        <div>
                            <div class="feed-activity-list">

                               

                               <div id="news_info"></div>
                               <div id="news_infocount"></div>
               
                                
                          
                        </div>

                    </div>
                    
                    
                    
                </div>

            </div>		

	            </div>
	            
	            
	            
	            
	            
	            
	                  <div class="col-sm-8 " style="width:50%">
                <div class="ibox float-e-margins border-bottom" >
                    <div class="ibox-title">
                        <h5>授权代工</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link" onclick="QueryOemInfobycompanyId(1,5)">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="profile.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                             
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content" style="display: none;">

                        <div>
                            <div class="feed-activity-list">

                               

                               <div id="oem_info"></div>
                               <div id="oem_infocount"></div>
               
                                
                          
                        </div>

                    </div>
                    
                    
                    
                </div>

            </div>		

	            </div>
	
	
	
	
	
	
	     
            <div class="col-sm-8" style="width:50%">
                <div class="ibox float-e-margins border-bottom">
                    <div class="ibox-title">
                        <h5>人力资源</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link" onclick="QueryStaffInfobycompanyId(1,5)">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="profile.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                              
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content" style="display: none;">
                     
                        <div class="input-group">
                            <input  id="resources_name" name="resources_name" type="text" placeholder="根据人名查找" class="input form-control">
                            <span class="input-group-btn">
                                        <button type="button" class="btn btn btn-primary" onclick="QueryStaffInfobycompanyId(1,5);QueryBoardInfobycompanyId(1,5);"> <i class="fa fa-search"></i> 搜索</button>
                                </span>
                        </div>
                        <div class="clients-list">
                            <ul class="nav nav-tabs">
                               
                                <li class="active"><a data-toggle="tab" href="#tab-1" onclick="QueryStaffInfobycompanyId(1,5)"><i class="fa fa-user"></i> 人员背景</a>
                                </li>
                                <li class=""><a data-toggle="tab" href="#tab-2" onclick="QueryBoardInfobycompanyId(1,5)"><i class="fa fa-briefcase"></i> 董事会名单</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div id="tab-1" class="tab-pane active">
                                    <div class="full-height-scroll">
                                        <div class="table-responsive">
                                      
                                            <div id="staff_info"></div>
                                            <div id="staff_infocount"></div>
                                        </div>
                                    </div>
                                </div>
                                <div id="tab-2" class="tab-pane">
                                    <div class="full-height-scroll">
                                        <div class="table-responsive">
                                          
                                           <div id="board_info"></div>
                                            <div id="board_infocount"></div>
                                        </div>
                                    </div>
                                </div>
                             
                             
                             
                             
                            </div>
                        </div>     
                    </div>
                </div>
            </div>
	
	
	
	
	       
	                  <div class="col-sm-8 " style="width:50%">
                <div class="ibox float-e-margins border-bottom" >
                    <div class="ibox-title">
                        <h5>特殊情况</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link" onclick="QuerySupplier_problemInfobycompanyId(1,5)">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="profile.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                             
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content" style="display: none;">

                        <div>
                            <div class="feed-activity-list">

                               

                               <div id="supplier_probleminfo"></div>
                               <div id="supplier_probleminfocount"></div>
               
                                
                          
                        </div>

                    </div>
                    
                    
                    
                </div>

            </div>		

	            </div>
	   
        </div>
	
	
	</div>
	
	</div>
	
</body>





<!-- 全局js -->
<script src="./page/js/jquery.min.js?v=2.1.4"></script>
<script src="./page/js/bootstrap.min.js?v=3.3.6"></script>
<!-- 自定义js -->
<script src="./page/js/content.js?v=1.0.0"></script>

<!-- Sweet alert -->
<script src="./page/js/plugins/sweetalert/sweetalert.min.js"></script>


</html>