<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dianjuhe.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <style type="text/css">  
        body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}  
        #allmap{width:100%;height:80%;}  
        #r-result{width:100%;}  
    </style>  
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=您的密钥"></script>  
    <script type="text/javascript" src="http://api.map.baidu.com/library/TextIconOverlay/1.2/src/TextIconOverlay_min.js"></script>  
    <script type="text/javascript" src="http://api.map.baidu.com/library/MarkerClusterer/1.2/src/MarkerClusterer_min.js"></script>  


  </head>
  
  <body>  
    <div id="allmap"></div>  
    <div id="r-result">  
        <input type="button" onclick="add_overlay();" value="添加点聚合" />  
        <input type="button" onclick="remove_overlay();" value="重新生成点聚合" />  
    </div>  
</body>  
</html>  
<script type="text/javascript">  
    // 百度地图API功能  
    var map = new BMap.Map("allmap");  
    map.centerAndZoom(new BMap.Point(116.404, 39.915), 4);  
    map.enableScrollWheelZoom();  
  
    var MAX = 10;  
    var markers = [];  
    var markerClusterer = null;  
    for (var i = 0; i < MAX; i++) {  
        var pt = new BMap.Point(Math.random()*40+85, Math.random()*30+21);  
        var marker = new BMap.Marker(pt);  
        map.addOverlay(marker);  
        markers.push(marker);  
    }  
    
    //最简单的用法，生成一个marker数组，然后调用markerClusterer类即可。  
    markerClusterer = new BMapLib.MarkerClusterer(map, {markers:markers});    
</script>  
</html>
