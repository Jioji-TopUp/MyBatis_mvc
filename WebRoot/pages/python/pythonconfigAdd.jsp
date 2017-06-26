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

<form id="add_form" role="form" class="form-inline" onsubmit="return sub()" action="AddPythonConfig" method="post">

    <div style="text-align:left;" >
        <div style="background-color:#46ABE1;width:100%;height:50px;color:#FFFFFF; line-height:10px;              	 
  overflow:hidden;   " >
                        <h2 style="margin-top:10px;text-align:center;"><strong>添加汇集数据配置</strong></h2>

                    </div>
    	<div class="row">
            <div class="col-sm-8" style="margin-left:300px;">
                <div class="ibox float-e-margins">
                    
                </div>
                    <div class="ibox-content">
                    	<label class="biglabel">搜索的url地址:</label>
                    	<input type="text" class="biginput"  name="pythonurl"  class="form-control" id="pythonurl" />
                    </div>
                    
                    
                    
      				 <div class="ibox-content">
                         <label class="biglabel" >公司名称&nbsp:&nbsp&nbsp&nbsp</label>
                    
	                    <div class="input-group" style="width: 300px;">  
	                        <input  type="text" class="biginput" class="form-control" name="pythoncompanyname" id="pythoncompanyname" />  
	                        <div class="input-group-btn">  

	                            <ul id="pythoncompanynameul" class="dropdown-menu dropdown-menu-right" role="menu">  
	                            </ul>  
	                        </div>
	                     </div>
	                     <input type="hidden" style="width:50px;" class="biginput" name="pythoncompanyid"  class="form-control" id="pythoncompanyid" placeholder="公司id（隐藏）"/>
	                     
                    </div>
                    

                    <div style="text-align: center;"  class="tjdiv" class="ibox-content" class="input-group"   >
                   
                    <span class="tjspan">
								<label style="vertical-align: top;" class="biglabel" >配&nbsp&nbsp置&nbsp&nbsp条&nbsp&nbsp件&nbsp:&nbsp&nbsp&nbsp</label>
							</span>
						
							
                        	<table style="margin:10px;" id="mytable"  cellspacing="10">
                        		
                        		<tr >            
		                            <td>
				                       <div class="input-group">
				                          <input placeholder='内容' type="text" class="form-control" name="content" id="content" >
				                          <div class="input-group-btn">
				                              <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
				                          </div>
				                       </div>
									</td>
								    <td> <input type="text" id="columnvalue"  placeholder="左标签"  class="form-control"></td>
                        			<td> <input type="text" id="columnvalue" name="columnvalue" placeholder="右标签"  class="form-control"></td>
                        			<td><a style="color:green;font-size:20px;" onclick="addtr()"><strong>+</strong></a></td>																		
                        		</tr>
                        		
                           
                           </table>
                     
                    </div>
                    
                    
                    <div class="ibox-content">
                 
                   	   <label style="vertical-align: top;margin-top:0px;" class="biglabel">配&nbsp&nbsp置&nbsp&nbsp说&nbsp&nbsp明&nbsp:&nbsp&nbsp&nbsp</label>
                   	 
						<textarea style="width:500px;" class="form-control" id="pythonremarks" name="pythonremarks" placeholder="这里输入内容"  
							onfocus="if(value=='填写备注信息...'){value=''}"
    onblur="if (value.trim() ==''){value='填写备注信息...'}">填写备注信息...</textarea>
                    </div>
                    
                   
                    <div class="ibox-content" style="margin-left:150px">                    	
                    	<a  class="btn btn-primary" style="background-color:#18A689;color:#FFF;width:100px;" type="submit" onclick="go()" >返回</a>
                    	<input class="btn btn-primary"  type="submit"  style="width:100px;margin-left:30px;" value="提交" />
                    </div>
                </div>
            </div>
           
        </div>
    	<div>
    		
    	</div>
    </div>
 </form>  
           
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
 
 $("#pythonurl").val("<%=url%>");
 


//自动补全
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
 
 
 //返回上一页
function go(){
	//window.history.go(-1);
	window.history.back();
}

 
 	//ajaxForm提交
 	$(document).ready(function(){
 		//提交配置
 		var options = {  
			type:      'post',       
			dataType:  'json' , 
			url: "AddPythonConfig",
   			success: function(data) {
   			
      			var code = data["code"];
				if (code == '0') {
					swal({
						title : "添加成功，等待跳转...",
						text : "",
						type : "success"
					});		
					setTimeout(go, 1500);
   		 		} 	
   			 } 
   		 };
   	 		//注册提交方式
      	 $("#add_form").ajaxForm(options); 

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
		   $("input[name=\"content\"]").bsSuggest({	           
		            data:content
		   });
        }
        
        
   		//form提交时检查
   	function sub(){
   		var flag = 1;
   		
   		
   		if($("#pythonremarks").val()=="填写备注信息..."){
   			alert("请填写备注信息");
   			flag = 0;return false;
   		}
   		
   		var count = 0;
   		
   				//检查条件是否为空并把name属性按序号命名
   		 $("#mytable").find("tr").each(function () { 
				var tds = $(this).find("td");
				var a = tds.find("input");
				
				if($(a[0]).val()==""||$(a[1]).val()==""||$(a[2]).val()==""){
					alert("条件项不能为空");
					flag=0;return false;
				}
				
				var columnname = $(a[0]).attr("name","pythonkey["+(count)+"].key");
				var columnvalue = $(a[1]).attr("name","pythonkey["+(count)+"].leftTag");
				var columnvalue = $(a[2]).attr("name","pythonkey["+(count)+"].rightTag");
				count++;
				
			}); 

   		if(flag==1)
   			return true;
   		else
   			return false; 
	}
    		
		
   

    </script>
</html>