<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'Map.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<style type="text/css">
html {
	height: 100%
}

body {
	height: 100%;
	margin: 0px;
	padding: 0px
}

#container {
	height: 100%
}
</style>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=39VsPwWnD61e6Ru57Ev8yZH4O1WV67jy">
</script><script type="text/javascript" src="http://api.map.baidu.com/library/TextIconOverlay/1.2/src/TextIconOverlay_min.js"></script>  
<script type="text/javascript" src="http://api.map.baidu.com/library/MarkerClusterer/1.2/src/MarkerClusterer_min.js"></script>  

<script type="text/javascript" src="res/js/jquery-1.10.2.js"></script>
</head>

<body onload="init()">
	<div id="container"></div>
	<script type="text/javascript">
		var map;
		var markerClusterer = null;

		function init() {
			map = new BMap.Map("container");
			var point = new BMap.Point(121, 31);
			map.centerAndZoom(point, 5);
			map.addControl(new BMap.MapTypeControl());
			map.enableScrollWheelZoom(true);
			getRentalInfoAll();
		}

		function getRentalInfoAll() {
			$.ajax({
				type : "get",
				url : "./getRentalInfoAll",
				dataType : 'json',
				data : {},
				success : function(json) {
					var list = json["list"];

					for ( var p in list) {
						var point = new BMap.Point(list[p].longitude,
								list[p].latitude);
						var marker = new ComplexCustomOverlay(point, "200");
						map.addOverlay(marker);
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

		function ComplexCustomOverlay(point, text) {
			this._point = point;
			this._text = text;
		}
		ComplexCustomOverlay.prototype = new BMap.Overlay();
		ComplexCustomOverlay.prototype.initialize = function(map) {
			this._map = map;
			var div = this._div = document.createElement("div");
			div.style.position = "absolute";
			div.style.zIndex = BMap.Overlay.getZIndex(this._point.lat);
			div.style.background = "#EE5D5B";
			div.style.borderRadius="25px";
			div.style.border = "solid rgb(100,100,100) 1px;";
			div.style.color = "white";
			div.style.height = "40px";
			div.style.width = "40px";
			div.style.padding = "2px";
			div.style.lineHeight = "18px";
			div.style.whiteSpace = "nowrap";
			div.style.MozUserSelect = "none";
			div.style.fontSize = "12px";
			div.style.textAlign = "center";
			div.style.verticalAlign= "middle";
			var span = this._span = document.createElement("span");
			div.appendChild(span);
			div.appendChild(document.createTextNode(this._text));
			
			var that = this;

			var arrow = this._arrow = document.createElement("div");
			arrow.style.backgroundColor = "";
			arrow.style.position = "absolute";
			arrow.style.width = "11px";
			arrow.style.height = "10px";
			arrow.style.top = "0px";
			arrow.style.left = "0px";
			arrow.style.overflow = "hidden";
			div.appendChild(arrow);
			
			div.onclick = function() {
				alert("eqweqwe");
			}

			this._map.getPanes().labelPane.appendChild(div);

			return div;
		}
		ComplexCustomOverlay.prototype.draw = function() {
			var map = this._map;
			var pixel = map.pointToOverlayPixel(this._point);
			this._div.style.left = pixel.x - parseInt(this._arrow.style.left)
					+ "px";
			this._div.style.top = pixel.y - 30 + "px";
		}
	</script>
</body>
</html>
