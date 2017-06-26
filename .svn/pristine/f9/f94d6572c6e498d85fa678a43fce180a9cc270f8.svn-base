<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
		#container{width:100%;height:500px;}
		p{margin-left:5px; font-size:14px;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=39VsPwWnD61e6Ru57Ev8yZH4O1WV67jy"></script>
	<title>添加自定义覆盖物</title>
</head>
<body>
	<div id="container"></div>
	<p>图示中为房产覆盖物，鼠标移到覆盖物上，自动显示房屋套数</p>
</body>
</html>
<script type="text/javascript">
	var map = new BMap.Map("container");            // 创建Map实例
     var point = new BMap.Point(116.404, 39.915);    // 创建点坐标
     map.centerAndZoom(point, 15);                     // 初始化地图,设置中心点坐标和地图级别。
 
     //1、定义构造函数并继承Overlay
     // 定义自定义覆盖物的构造函数  
     function ComplexCustomOverlay(point, text, mouseoverText) {
         this._div = document.createElement("div");
         this._point = point;
         this._text = text;
         this._overText = mouseoverText;
     }
     // 继承API的BMap.Overlay
     ComplexCustomOverlay.prototype = new BMap.Overlay();
        
 
     //2、初始化自定义覆盖物
     // 实现初始化方法  
     ComplexCustomOverlay.prototype.initialize = function (map) {
         this._map = map;
         var div = this._div;
         div.style.position = "absolute";
         div.style.zIndex = BMap.Overlay.getZIndex(this._point.lat);
         div.style.backgroundColor = "#EE5D5B";
         //div.style.border = "1px solid #BC3B3A";
         div.style.color = "white";
         div.style.height = "18px";
         div.style.padding = "2px";
         div.style.lineHeight = "18px";
         div.style.whiteSpace = "nowrap";
         //div.style.MozUserSelect = "none";
         div.style.fontSize = "12px"
         var span = this._span = document.createElement("span");
         div.appendChild(span);
         span.appendChild(document.createTextNode(this._text));
         var that = this;
 
         var arrow = this._arrow = document.createElement("div");
         arrow.style.background = "url(http://map.baidu.com/fwmap/upload/r/map/fwmap/static/house/images/label.png) no-repeat";
         arrow.style.position = "absolute";
         arrow.style.width = "11px";
         arrow.style.height = "10px";
         arrow.style.top = "22px";
         arrow.style.left = "10px";
         arrow.style.overflow = "hidden";
         div.appendChild(arrow);
         // 将div添加到覆盖物容器中  
         map.getPanes().labelPane.appendChild(div);
         // 保存div实例 
         this._div = div;
 
         // 需要将div元素作为方法的返回值，当调用该覆盖物的show、  
         // hide方法，或者对覆盖物进行移除时，API都将操作此元素。  
         return div;
     }
 
     //3、绘制覆盖物
     // 实现绘制方法  
     ComplexCustomOverlay.prototype.draw = function () {
         var map = this._map;
         var pixel = map.pointToOverlayPixel(this._point);
         this._div.style.left = pixel.x - parseInt(this._arrow.style.left) + "px";
         this._div.style.top = pixel.y - 30 + "px";
     }
 
     //6、自定义覆盖物添加事件方法
     ComplexCustomOverlay.prototype.addEventListener = function (event, fun) {
         this._div['on' + event] = fun;
     }
 
     //7、添加自定义覆盖物  
     var txt = "银湖海岸城", mouseoverTxt = txt + "| " + parseInt(Math.random() * 1000, 10) + "套";
 
     var myCompOverlay = new ComplexCustomOverlay(new BMap.Point(116.407845, 39.914101), "银湖海岸城", mouseoverTxt);
     map.addOverlay(myCompOverlay);
 
     //8、 为自定义覆盖物添加点击事件
     var infoWindow1 = new BMap.InfoWindow("普通标注", { offset: new BMap.Size(30, -30) });
     myCompOverlay.addEventListener("click", function () {
         map.openInfoWindow(infoWindow1, new BMap.Point(116.407845, 39.914101));
         //map.setCenter(new BMap.Point(116.407845, 39.914101));
     });
 
     myCompOverlay.addEventListener("mouseover", function () {
         if (this._div) {
             this._div.style.backgroundColor = "#6BADCA";
         }
         document.getElementsByTagName("span")[0].innerHTML = mouseoverTxt;
     });
 
     myCompOverlay.addEventListener("mouseout", function () {
         if (this._div) {
             this._div.style.backgroundColor = "#EE5D5B";
         }
         document.getElementsByTagName("span")[0].innerHTML = txt;
     });
	
</script>
