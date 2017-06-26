<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" uri="/WEB-INF/zy-page.tld" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'displaylist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->


<script language="javascript" type="text/javascript"
src="<%=request.getContextPath()%>/My97DatePicker/WdatePicker.js">	
</script>
<script type="text/javascript" src="./res/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="./page/js/contabs.js"></script>

<link rel="stylesheet" href="./res/css/jquery-ui.min.css"
	type="text/css"></link>
<script type="text/javascript" src="./res/js/jquery-form.js"></script>
  </head>
  
 <body onload="getCompanyIndex(1,5)">

  




	<script type="text/javascript">
	
		function getCompanyIndex(page, interval) {
		
		
			var start = (page - 1) * interval;
			
			// var company_name=document.getElementById("company_name").value;
			
			$.ajax({
						type : "post",
						url : "./displaylist",
						
						dataType : 'json',
						data : {
                            //company_name:company_name,
							start : start,
							limit:interval,
						
						},
						success : function(json) {
							
							var returnnum = json["code"];
							
							if (returnnum == '1') {
							//	$("#CompanyIndex_Company")
							//			.html("没有查询到供应商信息");

							} else {
								
								var m_str1 = "";

							//	m_str1 = "<table class='table table-bordered table-striped'><thead><tr><th style=\"text-align: center;\">公司名称</th><th style=\"text-align: center;\">总部地址</th><th style=\"text-align: center;\">公司类型</th><th style=\"text-align: center;\">航空总部地址</th><th style=\"text-align: center;\">操作</th></tr></thead><tbody>";
								m_str1 = "<table class='table table-bordered table-striped'><thead><tr><th style=\"text-align: center;\">用户名id</th><th style=\"text-align: center;\">用户名名称</th><th style=\"text-align: center;\">用户名 密码</th></thead><tbody>";
								
								var list = json["list"];

								for ( var p in list) {
								
								
									m_str1 = m_str1 + "<tr  >";


									m_str1 = m_str1
											+ "<td style=\"width:200px;text-align: center;\">"
											+ list[p].login_id + "</td>";

									m_str1 = m_str1
											+ "<td style=\"width:100px;text-align: center;\">"
											+ list[p].login_username+ "</td>";
									m_str1 = m_str1
											+ "<td style=\"width:100px;text-align: center;\">"
											+ list[p].login_password + "</td>";
											
								/* 	m_str1 = m_str1
											+ "<td style=\"width:100px;text-align: center;\">"
											+ list[p].aerospace_address + "</td>";
				 */

                                    /*        var ss="href=\"./pages/company/companyDetails.jsp?id=";
                                           var sss="href=\"./page/echars-graph-id.html?id=";
                                           if(list[p].id !=1&&list[p].id !=2)
                                           {ss="onclick='chakanxinxi()'";
                                           sss=ss;
                                           }else
                                           {ss=ss+list[p].id;
                                           sss=sss+list[p].id;
                                           } */

                                      
							/* 		m_str1 = m_str1
											+ "<td style=\"width:400px;text-align:center;\">"
											+ "<a style=\"width:50px\" class=\"btn  btn-info btn-sm\"  "+ ss + "\")\"> 详情</a>&nbsp"
											+ "<a style=\"width:80px;\"  class=\"btn  btn-success btn-sm J_menuItem\"  "+ sss + "\")\">查看关系图</a></td></tr>"
											; */

								}
								m_str1 = m_str1 + "</tbody></table>";
								$("#CompanyIndex_Company").html(m_str1);

								var count = json["count"];
							
								
								var page = Math.ceil((start + 1) / interval);
								totalpage = Math.ceil(count / interval);

								var m_str2 = "<button type=\"button\" class='btn btn-white' onclick='CompanyIndex_pageprev("
										+ page + "," + interval + ")'>上一页</button>";
								m_str2 = m_str2
										+ "<button type=\"button\" class='btn btn-white' onclick='CompanyIndex_pagenext("
										+ page + "," + interval + ","
										+ totalpage + ")'>下一页</button>";
								m_str2 = m_str2 + "<span class='btn btn-white'>第" + page + "页/共"
										+ totalpage + "页</span>";

								$("#CompanyIndex_Company_page")
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

		function CompanyIndex_pagenext(page, interval, totalpage) {

			if (page < totalpage) {
				page = page + 1;
				getCompanyIndex(page, interval);
			} else {
				alert("已到末页");
			}
		}

		function CompanyIndex_pageprev(page, interval) {
			if (page > 1) {
				page = page - 1;
				getCompanyIndex(page, interval);
			} else {
				alert("已到第一页");
			}
		}
		
		</script>
     
    <div class="ibox-content" style="text-align: center;">



			<div class="table-responsive" id="CompanyIndex_Company"></div>
			<div id="CompanyIndex_Company_page"></div>
		
		</div>
    
    
       </body>  
       <script src="./page/js/jquery.min.js?v=2.1.4"></script>
<script src="./page/js/bootstrap.min.js?v=3.3.6"></script>
    
    
    
    
 
</html>
