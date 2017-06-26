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


<title>爬虫结果信息</title>

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

<body onload="getPythonResultIndex(1,5)">

<script type="text/javascript">
    function showInfo(msg) {
		$("#info").html($(".infs").eq(msg).html());
       /*  $(".infs").each(function (i) {
            if ($(this).css("display") == "block" || $(this).css("display") == "inline") {
                $(this).fadeOut(200);
                $("#OnClick" + i).html("了解更多");
            }
        });
        if ($(".infs").eq(msg).css("display") == "none") {
       		//详细信息 $(".infs").eq(msg).html()
       		
       		//div显示
       		
			
       		
            $(".infs").eq(msg).fadeIn(1000);
            $("#OnClick" + msg).html("收起");
            $(".SpanNone").eq(msg).hide();
        } else {
            $(".infs").eq(msg).hide();
            $(".SpanNone").eq(msg).fadeIn();
            $("#OnClick" + msg).html("了解更多");
        } */
    } 
</script>

	<script type="text/javascript">
		function getPythonResultIndex(page, interval) {
			var start = (page - 1) * interval;
					var url =
<%=request.getParameter("url")%>

			$
					.ajax({
						type : "post",
						url : "./getcompanybyurl",
						dataType : 'json',
						data : {
                              url:url,
							start : start,
							count:interval,
							
						},
						success : function(json) {

							var returnnum = json["code"];
							if (returnnum == '1') {
								$("#PythonResultIndex_PythonResult")
										.html("没有查询到结果信息");

							} else {
 
								var m_str1 = "";
								var list = json["list"];

								m_str1 = "<table   class='table table-bordered table-striped'><thead><tr><th style=\"text-align: center;\">入库时间</th><th style=\"text-align: center;\">操作</th><th style=\"text-align: center;\">爬虫结果</th></tr></thead><tbody>";
								
								
								var a=0;
                                 
								for ( var p in list) {
								
								
									m_str1 = m_str1 + "<tr  >";
									
										m_str1 = m_str1
											+ "<td style=\"width:100px;text-align: center;\">"
											+ list[p].posttime + "</td>";
								
											

									m_str1 = m_str1
										
											+ "<td style=\"width:100px;text-align: center;\"><button class=\"btn btn-danger btn-sm del\"type=\"button\" onclick=\"DeleteCompanyData('"
											+ list[p]._id
											+ "')\">删除</button></td>";
										
									
					                     var aslist=list[p].mcolumn;
					                     
									
									for(var i in aslist)
									{
										 var sp;
									if(aslist[i].columnvalue.length>50)
									{
									
									sp="<span class=\"SpanNone\" style=\" font-size:14px;\">"+aslist[i].columnvalue.substring(0,50)+"...</span><span style=\"display: none\"   class=\"infs\" style=\" font-size:14px;\"> "+aslist[i].columnvalue+"</span><div class=\"TzfLj FloatR backgNoRepeat\"> <a data-toggle=\"modal\" data-target=\"#showinfo\" onclick=\"showInfo("+a+")\"><span id=\"OnClick"+a+"\">了解更多</span></a></div>";
									a++;
									}else
									{
									sp=aslist[i].columnvalue;
									}
								
										m_str1 = m_str1
											+ "<td style=\"width:100px;text-align: center;\"><span style=\"font-size: 14px;color: #676a6c;font-weight: 600;\">"
											+ aslist[i].columnname + "</span><br>"
											+ sp + "</td>";
											
											;

                        
									}
					
					
							m_str1 = m_str1 + "</tr  >";

									

								}
								m_str1 = m_str1 + "</tbody></table>";
								$("#PythonResultIndex_PythonResult").html(m_str1);

								var count = json["count"];

								var page = Math.ceil((start + 1) / interval);
								totalpage = Math.ceil(count / interval);

								var m_str2 = "<button type=\"button\" class='btn btn-white' onclick='PythonResultIndex_pageprev("
										+ page + "," + interval + ")'>上一页</button>";
								m_str2 = m_str2
										+ "<button type=\"button\" class='btn btn-white' onclick='PythonResultIndex_pagenext("
										+ page + "," + interval + ","
										+ totalpage + ")'>下一页</button>";
								m_str2 = m_str2 + "<span class='btn btn-white'>第" + page + "页/共"
										+ totalpage + "页</span>";

								$("#PythonResultIndex_PythonResult_page")
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

		function PythonResultIndex_pagenext(page, interval, totalpage) {

			if (page < totalpage) {
				page = page + 1;
				getPythonResultIndex(page, interval);
			} else {
				alert("已到末页");
			}
		}

		function PythonResultIndex_pageprev(page, interval) {
			if (page > 1) {
				page = page - 1;
				getPythonResultIndex(page, interval);
			} else {
				alert("已到第一页");
			}
		}


function DeleteCompanyData(id) {
			swal({
				title : "您确定要删除此信息吗",
				text : "删除后将无法恢复，请谨慎操作！",
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "#DD6B55",
				confirmButtonText : "是的，我要删除！",
				cancelButtonText : "让我再考虑一下…",
				closeOnConfirm : false,
				closeOnCancel : false
			}, function(isConfirm) {
				if (isConfirm) {
					$.ajax({
						cache : true,
						type : "get",
						url : "./DeleteCompanyData",
						dataType : 'json',
						data : {

							_id : id,
						},
						success : function(json) {

							swal("删除成功！", "您已经成功删除此信息。", "success");
							getPythonResultIndex(1, 5);

						},
						error : function(request) {
							swal("已取消", "删除失败!", "error");
						}

					});

				} else {
					swal("已取消", "您取消了删除操作！", "error");
				}
			});

		}
	
	</script>

	<div id="PythonResultIndex">
		
		<div class="ibox-title">
			<a href="./pages/python/pythonIndex.jsp" class="btn btn-white" ><img style="margin-right:5px;width:25px;height:25px;" alt="" src="./pages/css/img/back.jpg" />&nbsp;返回</a>
		
		</div>


		<div class="ibox-content" style="text-align: center;">



			<div class="table-responsive" id="PythonResultIndex_PythonResult"></div>
			<div id="PythonResultIndex_PythonResult_page"></div>

		</div>


	</div>
	
	
	
	<div class="modal inmodal fade" id="showinfo" tabindex="-1"
			role="dialog" aria-hidden="true">
			<div class="modal-dialog modal-lg" Style="width:800px">
				<div id="editinfo" class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h5 class="modal-title">详细信息</h5>
							<small class="font-bold">
						</div>
				
					<div	id="info" class="modal-body" style="margin:0 auto; width:750px; height:500px;overflow:scroll;">
						
					</div>
					
					<div style="text-align:center;;" class="modal-footer" >
						
						<button  type="button" style="background-color:red;color:#FFFFFF;" class="btn btn-white" data-dismiss="modal">关闭</button>
						
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

	<script>
		$("#showinfo").on("hidden.bs.modal", function() {
		$("input").val('');
	});
	$("#showinfo").on("hidden.bs.modal", function() {
	
	});
	$("#showinfo").on("shown.bs.modal", function() {

	});
	</script>
</html>