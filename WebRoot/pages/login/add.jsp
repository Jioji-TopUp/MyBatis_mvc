<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add.jsp' starting page</title>
    
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
<script type="text/javascript" src="./page/js/contabs.js"></script>
<script type="text/javascript" src="./res/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="./res/js/jquery-ui-1.10.3.min.js"></script>
<link rel="stylesheet" href="./res/css/jquery-ui.min.css"
	type="text/css"></link>
<script type="text/javascript" src="./res/js/jquery-form.js"></script>
  </head>
  
  <body>
  <!-- <form action="./add" name="data">
	username<input type="text" name="loginName"><br/>
	password<input type="password" name="passWord"><br/>
	<input type="submit"  >
	</form><br> -->
	
	
	 <form id="AddCompany_form" name="data">
	username<input type="text" name="loginName"><br/>
	password<input type="password" name="passWord"><br/>
	
	</form>
	<input type="button" value="add" onclick="Add_user()" >
	
	<script type="text/javascript">
	function Add_user() {
 	var form = new FormData(document
				.getElementById("AddCompany_form"));
				
		
		$.ajax({
			type : "post",
			url : "./add",
			dataType : 'json',
			data : form,
			processData : false,
			contentType : false,
			success : function(json) {
			
				var code = json["code"];
				if (code == '0') {
				alert("success");
					swal({
						title : "添加成功",
						text : "",
						type : "success"
					});
					/* $("#myModal5").modal("hide");
					$("#myModal5").removeData("bs.modal"); */
				} else {
					swal({
						title : "添加失败",
						text : "",
						type : "error"
					});
					}
				/* <!-- 	$("#myModal5").modal("hide"); -->
				}
				<!-- getCompanyIndex(1, 5); --> */
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
