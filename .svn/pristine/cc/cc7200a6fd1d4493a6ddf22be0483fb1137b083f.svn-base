<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String url = request.getParameter("url")==null?"":request.getParameter("url"); 
	String filename= request.getParameter("filename")==null?"":request.getParameter("filename");
	String filetype= request.getParameter("filetype")==null?"":request.getParameter("filetype");
	
%>




<base href="<%=basePath%>">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <meta name="description" content="这是一个基于 bootstrap 按钮式下拉菜单组件的搜索建议插件">  
    <meta name="Keywords" content="Bootstrap Search Suggest,bootstrap,搜索建议插件"/>  
    <meta name="author" content="lizhiwen@meizu.com">  
    <link href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">  

<title>添加配置信息</title>

<link rel="shortcut icon" href="favicon.ico">
<link href="./page/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="./page/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="./page/css/animate.css" rel="stylesheet">
<link href="./page/css/style.css?v=4.1.0" rel="stylesheet">
<link href="./page/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
    <link href="./page/css/plugins/iCheck/custom.css" rel="stylesheet">
	
	




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
		magin-left:10px;
		border-bottom:1px solid #AAA;
		 width:500px;
		
	}
	.biglabel{


		
		font-size:20px;
		vertical-align: bottom;
		margin-bottom:0px;
		width:150px;
		
	}
	
	td{
		padding:5px;
	}
	
	 textarea{ 	 
	 	border-color: #AADDFF;
	 	width:5000px;
	 	height:50px
	 
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

</style>
</head>

<body onload="getPythonConfigIndex(1,5)">


	<div class="col-sm-6">
		<div class="tabs-container">
			<ul class="nav nav-tabs">
				<li  class="active"><a data-toggle="tab" href="#tab-1"
					aria-expanded="true" style=" font-size: 27px;"> 配置爬虫</a></li>
				<li  class=""><a id="fileconfig" data-toggle="tab" href="#tab-2"
					aria-expanded="false" style=" font-size: 27px;">配置文件</a></li>
			</ul>
			<div class="tab-content">
				<div id="tab-1" class="tab-pane active">
					<div style="text-align:left;">
						<div
							style="background-color:#46ABE1;width:100%;height:50px;color:#FFFFFF; line-height:10px;              	 
  overflow:hidden;   ">
							<h2 style="margin-top:10px;text-align:center;">
								<strong>添加汇集数据配置</strong>
							</h2>

						</div>
						<div class="row">
							<div class="col-sm-8">
								<form id="add_form" role="form" class="form-inline"
									onsubmit="return sub()" action="AddPythonConfig" method="post">

									<div class="ibox-content">
										<label class="biglabel">搜索的url地址:</label> <input type="text"
											class="biginput" name="pythonurl" class="form-control"
											id="pythonurl" />
									</div>



									<div class="ibox-content">

										<label class="biglabel">公司名称&nbsp:&nbsp&nbsp&nbsp</label>

										<div class="input-group" style="width: 300px;">
											<input type="text" class="biginput" class="form-control"
												name="pythoncompanyname" id="pythoncompanyname" />
											<div class="input-group-btn">

												<ul class="dropdown-menu dropdown-menu-right" role="menu">
												</ul>
											</div>
										</div>
										<input type="hidden" style="width:50px;" class="biginput"
											name="pythoncompanyid" class="form-control"
											id="pythoncompanyid" placeholder="公司id（隐藏）" />
									</div>



									<div style="text-align: center;" class="tjdiv"
										class="ibox-content" class="input-group">

										<span class="tjspan"> <label
											style="vertical-align: top;" class="biglabel">配&nbsp&nbsp置&nbsp&nbsp条&nbsp&nbsp件&nbsp:&nbsp&nbsp&nbsp</label>
										</span>


										<table style="margin:10px;" id="mytable" cellspacing="10">

											<tr>
												
												<td>
				                                    <div class="input-group">
				                                        <input placeholder='内容' type="text" class="form-control" name="content" id="content" >
				                                        <div class="input-group-btn">
				                                            <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
				                                        </div>
				                                    </div>
												</td>
												<td><input type="text" id="columnvalue"
													placeholder="左标签" class="form-control">
												</td>
												<td><input type="text" id="columnvalue"
													name="columnvalue" placeholder="右标签" class="form-control">
												</td>
												<td><a style="color:green;font-size:20px;"
													onclick="addtr()"><strong>+</strong>
												</a>
												</td>
											</tr>


										</table>

									</div>


									<div class="ibox-content">

										<label style="vertical-align: top;margin-top:0px;"
											class="biglabel">配&nbsp&nbsp置&nbsp&nbsp说&nbsp&nbsp明&nbsp:&nbsp&nbsp&nbsp</label>

										<textarea style="width:500px;" class="form-control"
											id="pythonremarks" name="pythonremarks" placeholder="这里输入内容"
											onfocus="if(value=='填写备注信息...'){value=''}"
											onblur="if (value.trim() ==''){value='填写备注信息...'}">填写备注信息...</textarea>

									</div>


									<div class="ibox-content">
										<a class="btn btn-primary"
											style="background-color:#18A689;color:#FFF;width:100px;"
											type="submit" onclick="go()">返回</a> <input
											class="btn btn-primary" type="submit"
											style="width:100px;margin-left:30px;" value="提交" />
									</div>


								</form>
							</div>
						</div>
					</div>
				</div>

				<div id="tab-2" class="tab-pane">
					<div
						style="background-color:#46ABE1;width:100%;height:50px;color:#FFFFFF; line-height:10px;              	 
  overflow:hidden;   ">
						<h2 style="margin-top:10px;text-align:center;">
							<strong>添加文件存储</strong>
						</h2>

					</div>
					<form id="file_form" role="form" class="form-inline"  action=""
						method="post">
						<input id="filepath" name="filepath" type="hidden" />
						<input id="filetype" name="filetype" type="hidden" />
						<input id="language" name="language" type="hidden" />

						<div class="ibox-content">
							<label class="biglabel">搜索的url地址:</label> <input type="text"
								class="biginput" name="url" class="form-control" id="url" />
						</div>

						<div class="ibox-content">

							<label class="biglabel">公司名称&nbsp:&nbsp&nbsp&nbsp</label>

							<div class="input-group" style="width: 300px;">
								<input type="text"  class="biginput" class="form-control"
									name="companyname" id="companyname" />
								<div class="input-group-btn">

									<ul class="dropdown-menu dropdown-menu-right" role="menu">
									</ul>
								</div>
							</div>
							<input type="hidden" style="width:50px;" class="biginput"
								name="companyid" class="form-control" id="companyid"
								placeholder="公司id（隐藏）" />
						</div>
						<div class="ibox-content">
							<label class="biglabel">内容(标签):</label>
								<div class="input-group">
				                                        <input class="biginput" placeholder='内容' type="text" class="form-control" name="tids" id="tids" >
				                                        <div class="input-group-btn">
				                                            <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
				                                        </div>
				                                    </div>
						</div>
						
						
						
						
						
						
						
						<div class="ibox-content">
							<label class="biglabel">文件名字:</label> <input type="text"
								class="biginput" name="filename" class="form-control"
								id="filename" />
						</div>
						<div class="ibox-content">
							<label class="biglabel">文件类型:</label> <input type="text"
								class="biginput" name="type" class="form-control" id="type" />
						</div>


						<div class="ibox-content">
							<a class="btn btn-primary"
								style="background-color:#18A689;color:#FFF;width:100px;"
								type="submit" onclick="go()">返回</a> <input
								class="btn btn-primary" type="submit"
								style="width:100px;margin-left:30px;" onclick="file_sub()"  value="提交" />
								
								
								
						</div>
					</form>
					
					<iframe id="save" name="save"  style="display:none"></iframe>
					<iframe id="form_iframe" name="form_iframe" style="display:none"></iframe>
					
				</div>
			</div>


		</div>
	</div>

</body>



<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>  
    <script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>  
    <script src="bootstrap-suggest.js"></script>  

<!-- 全局js -->
<script src="./page/js/jquery.min.js?v=2.1.4"></script>
<script src="./page/js/bootstrap.min.js?v=3.3.6"></script>
<!-- 自定义js -->
<script src="./page/js/content.js?v=1.0.0"></script>

<!-- Sweet alert -->
<script src="./page/js/plugins/sweetalert/sweetalert.min.js"></script>






<script src="./page/js/jquery-form.js"></script>
<script src="./page/js/plugins/suggest/bootstrap-suggest.min.js"></script>
 <script type="text/javascript">
 /*----------------------------页面元素填充----------------------------------*/
var url="<%=url%>";
var filename="<%=filename%>"
var filetype = "<%=filetype%>";
$("#pythonurl").val(url);
$("#url").val(url);
$("#type").val(filetype);
$("#filename").val(filename);

//自动选择配置页面
if($("#type").val()!=""){
	$("#fileconfig").click();
}

	
/*-----------------------------公共方法----------------------------------*/
//弹窗提示params:警告名，警告类型
function myalert(title,type){swal({title : title,text : "",type : type});}

//返回上一页
function go() {
	var theparent = window.parent.document;
	$("#add_div", theparent).css("display", "none");
	$("#data", theparent).css("display", "inline-block");
}

/*--------------------------------公司名补全---------------------------------------*/
		//自动补全
		var baiduBsSuggest = $("#pythoncompanyname,#companyname").bsSuggest({
			allowNoKeyword : false, //是否允许无关键字时请求数据
			delayUntilKeyup : true,//获取焦点或输入时发出请求

			multiWord : true, //以分隔符号分割的多关键字支持
			separator : ",", //多关键字支持时的分隔符，默认为空格
			getDataMethod : "url", //获取数据的方式，总是从 URL 获取
			url : './QueryCompanybycompanyname1?limit=5&start=1&company_name=',
			idField : "id",
			keyField : "company_name",

			processData : function(json) { // url 获取数据时，对数据的处理，作为 getData 的回调函数
				return json;
			}
		}).on('onDataRequestSuccess', function(e, result) {
			console.log('onDataRequestSuccess: ', result);
		}).on('onSetSelectValue', function(e, keyword) {
			console.log('onSetSelectValue: ', keyword);
			$("#pythoncompanyid").val(keyword.id);
		}).on('onUnsetSelectValue', function(e) {
			console.log("onUnsetSelectValue");
		});


/*--------------------------------form提交设置----------------------------------------*/

		
		//文件提交
		function file_sub(){		
			$("#file_form").attr("target","save");

			$.get("http://139.196.29.45/save",$("#file_form").serialize(),function(json){

				if(JSON.parse(json).status=="successful"){
					$("#filepath").val("http://139.196.29.45:50075/webhdfs/v1/downloads/"+"<%=filename%>"
					+"?op=OPEN&namenoderpcaddress=139.196.29.45:9000&offset=0");
					$("#filetype").val($("#type").val());
					$("#language").val("china");
					$("#file_form").attr("target","form_iframe");
					$("#file_form").attr("action","addCompanyFiles");
					$("#file_form").submit();
					
					myalert("添加文件成功，等待跳转...","success");
					setTimeout(go, 4000);
				}else{
					myalert("添加文件失败，数据源无法下载...","error");
	
				}
			});
		}


		//ajaxForm数据提交
		$(document).ready(function() {

			//普通数据
			var add_form_options = {
				type : 'post',
				dataType : 'json',
				url : "AddPythonConfig",
				success : function(data) {

					var code = data["code"];
					if (code == '0') {
						myalert("添加成功，等待跳转...","success");
						setTimeout(go, 1500);
					}
				}
			};
			//注册提交方式
			$("#add_form").ajaxForm(add_form_options);

		});
		
	
/*-----------------------------------条件-----------------------------------------------*/
		//添加一组条件
		function addtr() {
			var newtr = "<tr >"
					+ "<td><div class='input-group'><input placeholder='内容' type='text' class='form-control' name='content' id='content' ><div class='input-group-btn'><ul class='dropdown-menu dropdown-menu-right' role='menu'></ul></div></div></td>"
					+ "<td><input type='text' placeholder='左标签'  class='form-control'></td>"
					+ "<td><input type='text' placeholder='右标签'  class='form-control'></td>"
					+ "<td><a style='font-size:35px;color: red;vertical-align: middle;' onclick='deletetr(this)'><strong>-</strong></a></td>"
					+ "</tr>";
			var ntr = $("#mytable").append(newtr);
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
		   $("input[name=\"content\"],#tids").bsSuggest({	           
		            data:content
		   });
        }

/*-----------------------------------表单检查-----------------------------------------------*/
		//普通数据form提交时检查
		function sub() {
			var flag = 1;

			if ($("#pythonremarks").val() == "填写备注信息...") {
				myalert("请填写备注信息","error");
				flag = 0;
				return false;
			}

			var count = 0;

			//检查条件是否为空并把name属性按序号命名
			$("#mytable").find("tr").each(
					function() {
						var tds = $(this).find("td");
						var a = tds.find("input");

						if ($(a[0]).val() == "" || $(a[1]).val() == ""
								|| $(a[2]).val() == "") {
							myalert("条件项不能为空","error");
							flag = 0;
							return false;
						}

						var columnname = $(a[0]).attr("name",
								"pythonkey[" + (count) + "].key");
						var columnvalue = $(a[1]).attr("name",
								"pythonkey[" + (count) + "].leftTag");
						var columnvalue = $(a[2]).attr("name",
								"pythonkey[" + (count) + "].rightTag");
						count++;

					});

			if (flag == 1)
				return true;
			else
				return false;
		}
		
		
	</script>
</html>