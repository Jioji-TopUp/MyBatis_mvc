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


<title>招投标信息</title>

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



<style>
	.biginput{
		border:0;
		outline:none;/*点击后没有边框*/
		text-align: bottom;
		text-indent:1em; 
		
		border-bottom:1px solid #AAA;
		 width:300px;"
	}
	.biglabel{
		font-size:20px;
		vertical-align: bottom;
		margin-bottom:0px;
		
	}
	
	td{
		padding:5px;
	}
	
		 textarea{ 	 
	 	border-color: #AADDFF;
	 	width:300px;
	 	height:50px
	 
	 }
	 
	 .tjtable{
	 	margin-bottom:30px;
	 }
	 
	 .tjdiv{
text-align: center;
    width:670px;
    padding:5px 30px;
   margin-top:30px;
    border:4px solid #ebcbbe;
    border-top-left-radius: 10px; 
	border-top-right-radius: 10px;
	border-bottom-right-radius:10px;
	border-bottom-left-radius:10px;
	background-color:#E5E5E5;
}
.tjspan{

    display:block;
    width:150px;
    height:30px;
    position:relative;
    top:-22px;
    left:-17px;
    text-align: center;
	border-top-left-radius: 10px; 
	border-top-right-radius: 10px;
	border-bottom-right-radius:10px;
	border-bottom-left-radius:10px;
    background-color:#E5E5E5;
}
.min{
	min-width:1000px;
	
}
</style>
</head>

<body onload="getPythonConfigIndex(1,5)">

<script type="text/javascript">
    function showInfo(msg) {
        $(".infs").each(function (i) {
            if ($(this).css("display") == "block" || $(this).css("display") == "inline") {
                $(this).fadeOut(200);
                $("#OnClick" + i).html("了解更多");
            }
        });
        if ($(".infs").eq(msg).css("display") == "none") {
            $(".infs").eq(msg).fadeIn(1000);
            $("#OnClick" + msg).html("收起");
            $(".SpanNone").eq(msg).hide();
        } else {
            $(".infs").eq(msg).hide();
            $(".SpanNone").eq(msg).fadeIn();
            $("#OnClick" + msg).html("了解更多");
        }
    } 
</script>

	<script type="text/javascript">
		function getPythonConfigIndex(page, interval) {
			var start = (page - 1) * interval;
			 var remarks=document.getElementById("remarks1").value;
	                 

			$
					.ajax({
						type : "post",
						url : "./PythonConfigPaginationAndlocation",
						dataType : 'json',
						data : {
                              remarks:remarks,
							start :start,
							limit:interval
							
						},
						success : function(json) {

							var returnnum = json["code"];
							if (returnnum == '1') {
								$("#PythonConfigIndex_PythonConfig")
										.html("没有查询到配置");

							} else {

								var m_str1 = "";

								m_str1 = "<table class='table table-hover'><thead><tr><th style=\"text-align: center;\">状态</th><th style=\"text-align: center;\">备注名称</th><th style=\"text-align: center;\">url</th><th style=\"text-align: center;\">公司名称</th><th style=\"text-align: center;\">操作</th></tr></thead><tbody>";
								var list = json["list"];
	                            var a=0;
								for ( var p in list) {
								
								
									m_str1 = m_str1 + "<tr  >";


                           var ss;
                          if(list[p].pythonstate==1){ss="<a   onclick=\"Suspend_PythonConfig('"+list[p]._id+"',"+list[p].pythonstate+")\" class=\"label label-primary\">进行中</a>";}else
                          {ss="<a onclick=\"Suspend_PythonConfig('"+list[p]._id+"',"+list[p].pythonstate+")\" class=\"label label-default\">已取消 </a>";}
									m_str1 = m_str1
											+ "<td  class=\"project-status\" style=\"width:200px;text-align: center;\">"+ss+"</td>";
                                      

									m_str1 = m_str1
											+ "<td  class=\"project-title\" style=\"width:200px;text-align: center;\"><a>"
											+ list[p].pythonremarks + "</a><br><small>创建于 "+list[p].pythontime+"</small></td>";
											
										
										var sp;
										
											
											if(list[p].pythonurl.length>50)
									{
									
									sp="<span class=\"SpanNone\" style=\" font-size:14px;\">"+list[p].pythonurl.substring(0,25)+"...</span><a href=\""+ list[p].pythonurl + "\" target=\"_blank\"><span style=\"display: none\"   class=\"infs\" style=\" font-size:14px;\"> "+list[p].pythonurl+"</span></a><div class=\"TzfLj FloatR backgNoRepeat\"> <a onclick=\"showInfo("+a+")\"><span id=\"OnClick"+a+"\">了解更多</span></a></div>";
									a++;
									}else
									{
									sp="<a href=\""+ list[p].pythonurl + "\" target=\"_blank\"> "+list[p].pythonurl+"</a>";
									}
											
											
									m_str1 = m_str1
											+ "<td style=\"width:100px;text-align: center;\">"
											+ sp + "</td>";
													m_str1 = m_str1
											+ "<td style=\"width:100px;text-align: center;\">"
											+ list[p].pythoncompanyname + "</td>";
											

									m_str1 = m_str1
											+ "<td  class=\"project-actions\" style=\"width:400px;text-align: center;\">"
												
											+ "<button style=\"width:80px\" data-target=\"#update5\"data-toggle=\"modal\" class=\"btn btn-success btn-sm\"  onclick=\"updatePythonConfig('"
											+ list[p]._id
											+ "')\">修改</button>"
											+ "<a class=\"btn btn-primary btn-sm\" href=\"./pages/python/pythonResult.jsp?url='"
									+ list[p].pythonurl
									+ "'\">"
									+ "查看爬虫结果</a>"
											+ "<button class=\"btn btn-danger btn-sm del\"type=\"button\" onclick=\"deletePythonConfig('"
											+ list[p]._id
											+ "')\">删除</button></td></tr>";

								}
								m_str1 = m_str1 + "</tbody></table>";
								$("#PythonConfigIndex_PythonConfig").html(m_str1);

								var count = json["count"];

								var page = Math.ceil((start + 1) / interval);
								totalpage = Math.ceil(count / interval);

								var m_str2 = "<button type=\"button\" class='btn btn-white' onclick='PythonConfigIndex_pageprev("
										+ page + "," + interval + ")'>上一页</button>";
								m_str2 = m_str2
										+ "<button type=\"button\" class='btn btn-white' onclick='PythonConfigIndex_pagenext("
										+ page + "," + interval + ","
										+ totalpage + ")'>下一页</button>";
								m_str2 = m_str2 + "<span class='btn btn-white'>第" + page + "页/共"
										+ totalpage + "页</span>";

								$("#PythonConfigIndex_PythonConfig_page")
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

		function PythonConfigIndex_pagenext(page, interval, totalpage) {

			if (page < totalpage) {
				page = page + 1;
				getPythonConfigIndex(page, interval);
			} else {
				alert("已到末页");
			}
		}

		function PythonConfigIndex_pageprev(page, interval) {
			if (page > 1) {
				page = page - 1;
				getPythonConfigIndex(page, interval);
			} else {
				alert("已到第一页");
			}
		}
		
		
		
			function Suspend_PythonConfig(id,pythonstate) {
	
		$.ajax({
			type : "post",
			url : "./SuspendPythonConfig",
			dataType : 'json',
			data : {
			_id:id,
			pythonstate:pythonstate
			},
			success : function(json) {
			
				getPythonConfigIndex(1, 5);
			},
			beforeSend : function() {

			},
			complete : function(XMLHttpRequest, textStatus) {

			},
			error : function() {

			}
		});}
		
	

		function deletePythonConfig(id) {
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
						url : "./DeletePythonConfig",
						dataType : 'json',
						data : {

							_id : id,
						},
						success : function(json) {

							swal("删除成功！", "您已经成功删除此信息。", "success");
							getPythonConfigIndex(1, 5);

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

	<div id="PythonConfigIndex">

		<div class="min ibox-title">

		
		 <h5>所有配置</h5><div class="min row m-b-sm m-t-sm" style="float: left;">

                            <div class="col-md-11">
                                <div class="input-group">
                                    <a   href="javascript:location.reload();" id="loading-example-btn" class="btn btn-white btn-sm"><i class="fa fa-refresh"></i> 刷新</a>
                                
                                	<span style="margin-right:100px;"   >
                                	    <a class='btn btn-sm btn-primary' href='./pages/python/pythonconfigAdd.jsp'> <i class="fa fa-add"></i>添加爬虫</a>
                                	</span>
                                	
                                   <span class="input-group-btn"> 
                                   		<input type="text" placeholder="备注名称" id="remarks1" name="remarks1"  style="width:500px;" class="input-sm form-control"> 
                                        <button type="button" onclick="getPythonConfigIndex(1,5)"  class="btn btn-sm btn-primary"> 搜索</button>
                                   </span>
                                        
                                </div>
                            </div>   
                             </div>
		
		</div>



                   

		<div class="ibox-content" style="text-align: center;">
 
                      
                          


			<div class="min table-responsive" id="PythonConfigIndex_PythonConfig"></div>
			<div id="PythonConfigIndex_PythonConfig_page"></div>

		</div>










	


		<div class="modal inmodal fade" id="update5" tabindex="-1"
			role="dialog" aria-hidden="true">
			<div class="modal-dialog modal-lg" Style="width:800px">
				<div id="editinfo" class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h5 class="modal-title">修改配置信息</h5>
						<small class="font-bold">
					</div>
				
					<div class="modal-body" style="margin:0 auto; width:800px;">
						<form action="UpdatePythonConfig" id="updatePythonConfig_form" onsubmit="return editsub()" name="updatePythonConfig_form" method="post"> 
						<!-- 修改表单 <input type="hidden" id="pythoncompanyid" name="pythoncompanyid" /> -->
						<input type="hidden" id="_id" name="_id" />	
						<input type="hidden" id="pseudodeletion" name="pseudodeletion" />
						
						<input type="hidden" id="pythonstate" name="pythonstate" />
						<input type="hidden" id="pythontime" name="pythontime" />
						
						
						<div class="ibox-content">
                    		<label class="biglabel">搜索的url地址&nbsp:&nbsp&nbsp&nbsp</label>
                    		<input type="text" class="biginput"  name="pythonurl"  class="form-control" id="pythonurl" />
                  		</div>
                  		
					<div class="ibox-content">
                         <label style="float:left;" class="biglabel" >公&nbsp&nbsp司&nbsp&nbsp名&nbsp&nbsp称&nbsp:&nbsp&nbsp&nbsp&nbsp&nbsp</label>
                    
	                    <div style="float:left;" class="input-group" >  
	                        <input type="text" class="biginput" class="form-control" name="pythoncompanyname" id="pythoncompanyname" />  
	                        <div class="input-group-btn">  

	                            <ul class="dropdown-menu dropdown-menu-right" role="menu">  
	                            </ul>  
	                        </div>
	                     </div>
	                     <input type="hidden" style="width:50px;" class="biginput" name="pythoncompanyid"  class="form-control" id="pythoncompanyid" placeholder="公司id（隐藏）"/>
	                     
                    </div>

						<div style="margin-top:50px;text-align: center;"  class="tjdiv" class="ibox-content">
						 	 <span class="tjspan">
								<label style="vertical-align: top;" class="biglabel" >&nbsp配&nbsp&nbsp置&nbsp&nbsp条&nbsp&nbsp件&nbsp:&nbsp&nbsp&nbsp</label>
							</span>
							<table class="tjtable" id="edittable" cellspacing="10"></table>
						</div>
                 
                 <div class="ibox-content">
                   	   <label style="vertical-align: top;margin-top:0px;" class="biglabel">配&nbsp&nbsp置&nbsp&nbsp说&nbsp&nbsp明&nbsp:&nbsp&nbsp&nbsp</label>
  
												<textarea style="width:500px;" id="pythonremarks" name="pythonremarks" placeholder="这里输入内容"  
							onfocus="if(value=='填写备注信息...'){value=''}"
    onblur="if (value.trim() ==''){value='填写备注信息...'}">填写备注信息...</textarea>
						
						
				<!-- 
							<input
							type="text" name="tendertitle" id="tendertitle" class="form-control"
							Style="margin-top:5px; width:100%" placeholder="配置网址">
							<input
							type="hidden" name="_id" id="_id" class="form-control"
							Style="margin-top:5px; width:100%" >
           
 				-->
						
					</div>

					<div style="margin-right:300px;" class="modal-footer" >
						<a class="btn btn-white" onclick="addtr()">添加条件</a>
						<button  type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
						<input type="submit" class="btn btn-primary" value="提交" ></input>
					</div>
					</form>
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


<script src="./page/js/jquery-form.js"></script>
<script src="./page/js/plugins/suggest/bootstrap-suggest.min.js"></script>
<script>
	$("#myModal5").on("hidden.bs.modal", function() {
		$("input").val('');
	});
	$("#update5").on("hidden.bs.modal", function() {
	
	});
	$("#update5").on("shown.bs.modal", function() {

	});



/*-----------------自动补全----------------*/
        var baiduBsSuggest = $("#pythoncompanyname").bsSuggest({
            allowNoKeyword: false, //是否允许无关键字时请求数据
            delayUntilKeyup: true,//获取焦点或输入时发出请求

            multiWord: true, //以分隔符号分割的多关键字支持
            separator: ",", //多关键字支持时的分隔符，默认为空格
            getDataMethod: "url", //获取数据的方式，总是从 URL 获取
            url: './QueryCompanybycompanyname1?limit=5&start=1&company_name=',
			idField: "id",
         	 keyField: "company_name",

           processData: function (json) { // url 获取数据时，对数据的处理，作为 getData 的回调函数
                return json;
            }
        }).on('onDataRequestSuccess', function (e, result) {
            console.log('onDataRequestSuccess: ', result);
        }).on('onSetSelectValue', function (e, keyword) {
            console.log('onSetSelectValue: ', keyword);
            $("#pythoncompanyid").val(keyword.id);
        }).on('onUnsetSelectValue', function (e) {
            console.log("onUnsetSelectValue");
        });
 
 
 

	function go(){
		$("#update5").modal("hide");
		window.location.reload();
	}

	/*---------------修改：给修复form注册成ajaxForm-----------------*/
	$(document).ready(function() {  
	 var options = {  
			type:      'post',       
			dataType:  'json' , 
	
	    	url:        "UpdatePythonConfig",
	   		 success: function(data) {
	      			var code = data["code"];
					if (code == '0') {
						swal({
							title : "修改成功，等待跳转...",
							text : "",
							type : "success"
						});
						
						setInterval(go, 3000); 			
	   		 		} 
	   		 } 
	
	   	 };
	
	       $("#updatePythonConfig_form").ajaxForm(options);            
	}); 





	/*---------------------修改：根据id准备修改数据---------------------*/
	function updatePythonConfig(id) {

		$.ajax({
			type : "post",
			url : "./QueryPythonConfigById",
			dataType : 'json',
			data : {
				_id : id,
			},
			
			success : function(json) {

				var list = json["list"][0];
				//所有数据（不包括列表）回显
				$("#editinfo").find("textarea,[type='hidden'],[type='text']").each(function(i){
					$(this).val(list[$(this).attr("name")]);
				});
			
				//条件列表回显
				var pythonkey = list["pythonkey"];
		        $("#edittable").html("");
		        for(var l in pythonkey){
		
			        var v = pythonkey[l];
			        var newtr = "<tr >"
							+ "<td><div class='input-group'><input placeholder='内容' type='text' class='form-control' name='content' id='content' value='"+v.key+"'><div class='input-group-btn'><ul class='dropdown-menu dropdown-menu-right' role='menu'></ul></div></div></td>"
							+ "<td><input type='text' placeholder='左标签''  class='form-control' value='"+v.leftTag+"'></td>"
							+ "<td><input type='text' placeholder='右标签'  class='form-control' value='"+v.rightTag+"'></td>"
					        + "<td><a style='font-size:20px;color: red;vertical-align: middle;' onclick='deletetr(this)'><strong>-</strong></a></td>"
					 		+ "</tr>";
			    	$("#edittable").append(newtr);
		         }
		         
		         $("#pythonurl1").html(list["pythonurl"]);
		         addContent();
			},
			beforeSend : function() {
			},
			complete : function(XMLHttpRequest, textStatus) {

			},
			error : function() {
			}
		});
	}

	/*---------------------条件-----------------------*/
	//添加一组条件
		function addtr() {
			var newtr = "<tr >"
					+ "<td><div class='input-group'><input placeholder='内容' type='text' class='form-control' name='content' id='content' ><div class='input-group-btn'><ul class='dropdown-menu dropdown-menu-right' role='menu'></ul></div></div></td>"
					+ "<td><input type='text' placeholder='左标签'  class='form-control'></td>"
					+ "<td><input type='text' placeholder='右标签'  class='form-control'></td>"
					+ "<td><a style='font-size:35px;color: red;vertical-align: middle;' onclick='deletetr(this)'><strong>-</strong></a></td>"
					+ "</tr>";
			var ntr = $("#edittable").append(newtr);
			addContent();
		}

		//删除一组条件
		function deletetr(obj) {
			$(obj).parent().parent().remove();
		}
		
		//准备预选条件数据并保存到content，加载页面执行一次
	 	 var content = null;
			$.ajax({
				type : "get",
				url : "./getPython_CondithionAll",
				dataType : 'json',
				data : {	
				},
				
				success : function(json) {
					content = json;
					addContent();
				},
				beforeSend : function() {
	
				},
				complete : function(XMLHttpRequest, textStatus) {
	
				},
				error : function() {
	
				}
			});
		

		//重新加载预选条件
		function addContent(){
		   $("input[name=\"content\"]").bsSuggest({	           
		            data:content
		   });
        }

    		
    	/*-----------------修改：检查数据-------------------*/	
	function editsub(){
	   var flag = 1;
	   		
		if($("#pythonremarks").val()=="填写备注信息..."){
			alert("请填写备注信息");
			flag = 0;
		}
	
		//检查条件列表并修改name属性
		$("#edittable").find("tr").each(function (count) { 
		　var tds = $(this).find("td");
			var a = tds.find("input");
			if($(a[0]).val()==""||$(a[1]).val()==""||$(a[2]).val()==""){
				alert("条件项不能为空");
				flag=0;
			}
			
			var columnname = $(a[0]).attr("name","pythonkey["+count+"].key");
			var columnvalue = $(a[1]).attr("name","pythonkey["+count+"].leftTag");
			var columnvalue = $(a[2]).attr("name","pythonkey["+count+"].rightTag");
		}); 
		
		if(flag==1)
			return true;
		else
			return false;
	}
	
	
	
	
</script>
</html>