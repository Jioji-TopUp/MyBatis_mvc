<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'HashMapTest.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="res/js/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="res/js/HashMap.js"></script>
  </head>
  
  <body onload="test()">
	<script type="text/javascript">
		function test() {
			var map = new HashMap();
			map.put("key1", "Value1");
			map.put("key2", "Value2");
			map.put("key3", "Value3");
			map.put("key4", "Value4");
			map.put("key5", "Value5");
			alert("size：" + map.size() + " key1：" + map.get("key1"));
			map.remove("key1");
			map.put("key3", "newValue");
			var values = map.values();
			map.remove("key1");
			map.put("key3","newValue")
			alert(map.containsKey("key1"));
			
			var values = map.values(); 
   for(var i in values){ 
       document.write(i+"："+values[i]+"   "); 
   } 
		}
	</script>
</body>
</html>
