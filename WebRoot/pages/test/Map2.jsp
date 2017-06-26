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
			var myZoomCtrl = new ZoomControl();
			map.addControl(myZoomCtrl);

		}

		function openInfo(content, e) {
			var p = e.target;
			var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
			var infoWindow = new BMap.InfoWindow(content); // 创建信息窗口对象 
			map.openInfoWindow(infoWindow, point); //开启信息窗口

			document.getElementById('imgDemo').onload = function() {
				infoWindow.redraw(); //防止在网速较慢，图片未加载时，生成的信息框高度比图片的总高度小，导致图片部分被隐藏
			}

		}

		function ZoomControl() {
			// 默认停靠位置和偏移量
			this.defaultAnchor = BMAP_ANCHOR_TOP_LEFT;
			this.defaultOffset = new BMap.Size(10, 10);
		}

		ZoomControl.prototype = new BMap.Control();

		ZoomControl.prototype.initialize = function(map) {
			var div = document.createElement("div");

			var div1 = document.createElement("div");
			div1.appendChild(document.createTextNode("查看开工工地"));
			div1.style.cursor = "pointer";
			div1.style.border = "1px solid gray";
			div1.style.backgroundColor = "white";
			div1.onclick = function(e) {
				//markerClusterer.clearMarkers();
				map.clearOverlays();
				getConstructionInfoAll();
			}
			var div2 = document.createElement("div");
			div2.appendChild(document.createTextNode("查看租赁设备"));
			div2.style.cursor = "pointer";
			div2.style.border = "1px solid gray";
			div2.style.backgroundColor = "white";
			div2.onclick = function(e) {
				//markerClusterer.clearMarkers();
				map.clearOverlays();
				getRentalInfoAll();
			}

			div.appendChild(div1);
			div.appendChild(div2);
			map.getContainer().appendChild(div);
			return div;
		}

		function addClickHandler(id, marker, type) {
			if (type == "ConstructionInfo") {
				marker.addEventListener("click", function(e) {
					getConstructionInfoOne(id, e);
				});
			} else {
				marker.addEventListener("click", function(e) {
					getRentalInfoOne(id, e);
				});
			}

		}

		function getConstructionInfoAll() {
			$
					.ajax({
						type : "get",
						url : "./getConstructionInfoAll",
						dataType : 'json',
						data : {

						},
						success : function(json) {
							var list = json["list"];
							var markers = [];
							for ( var p in list) {
								var point = new BMap.Point(list[p].lng,
										list[p].lat);
								var marker = new BMap.Marker(point);
								map.addOverlay(marker);
								addClickHandler(list[p]._id, marker,
										"ConstructionInfo");
								markers.push(marker);
							}
							markerClusterer.clearMarkers();
							markerClusterer = new BMapLib.MarkerClusterer(map,
									{
										markers : markers
									});

						},
						beforeSend : function() {

						},
						complete : function(XMLHttpRequest, textStatus) {

						},
						error : function() {

						}
					});
		}

		function getConstructionInfoOne(id, e) {
			$
					.ajax({
						type : "get",
						url : "./QueryConstructionInfoById",
						dataType : 'json',
						data : {
							_id : id
						},
						success : function(json) {
							var list = json["list"];
							for ( var p in list) {
								var content = "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>"
										+ list[p].title
										+ "</h4>"
										+ "<img style='float:right;margin:4px' id='imgDemo' src='./"+list[p].pic+"' width='139' height='104' title='"+list[p].title+"'/>"
										+ "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>"
										+ list[p].describe + "</p>" + "</div>";
								openInfo(content, e);
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

		var marker = new ComplexCustomOverlay(point, "银湖海岸城2套", "银湖海岸城2套");
				map.addOverlay(marker);
						
						addClickHandler(list[p]._id, marker, "RentalInfo");
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

		function getRentalInfoOne(id, e) {
			$
					.ajax({
						type : "get",
						url : "./mobileQueryRentalInfoAndRentalInfoPic",
						dataType : 'json',
						data : {
							_id : id
						},
						success : function(json) {
							var content = "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>"
									+ json.title
									+ "</h4>"
									+ "<img style='float:right;margin:4px' id='imgDemo' src='./"+json.pic_url+"' width='139' height='104' title='"+json.title+"'/>"
									+ "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>"
									+ json.username + "</p>" + "</div>";
							openInfo(content, e);

						},
						beforeSend : function() {

						},
						complete : function(XMLHttpRequest, textStatus) {

						},
						error : function() {

						}
					});
		}

		function getBounds() {
			var bs = map.getBounds();
			var bssw = bs.getSouthWest();
			var bsne = bs.getNorthEast();
			var topLat = bsne.lat;
			var bottomLat = bssw.lat;
			var leftLng = bssw.lng;
			var rightLng = bsne.lng;

		}

		function ComplexCustomOverlay(point, text, mouseoverText) {
			this._point = point;
			this._text = text;
			this._overText = mouseoverText;
		}
		ComplexCustomOverlay.prototype = new BMap.Overlay();
		ComplexCustomOverlay.prototype.initialize = function(map) {
			this._map = map;
			var div = this._div = document.createElement("div");
			div.style.position = "absolute";
			div.style.zIndex = BMap.Overlay.getZIndex(this._point.lat);
			div.style.backgroundColor = "#EE5D5B";
			div.style.border = "1px solid #BC3B3A";
			div.style.color = "white";
			div.style.height = "18px";
			div.style.padding = "2px";
			div.style.lineHeight = "18px";
			div.style.whiteSpace = "nowrap";
			div.style.MozUserSelect = "none";
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

			div.onmouseover = function() {
				this.style.backgroundColor = "#6BADCA";
				this.style.borderColor = "#0000ff";
				this.getElementsByTagName("span")[0].innerHTML = that._overText;
				arrow.style.backgroundPosition = "0px -20px";
			}

			div.onmouseout = function() {
				this.style.backgroundColor = "#EE5D5B";
				this.style.borderColor = "#BC3B3A";
				this.getElementsByTagName("span")[0].innerHTML = that._text;
				arrow.style.backgroundPosition = "0px 0px";
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
