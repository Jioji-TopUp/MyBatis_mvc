<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
	
</script>
<script type="text/javascript" src="res/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="res/js/HashMap.js"></script>
<script type="text/javascript" src="res/js/ComplexCustomOverlay.js"></script>
<script type="text/javascript" src="res/js/MarkerClusterer.js"></script>
<script type="text/javascript" src="res/js/TextIconOverlay.js"></script>
<script type="text/javascript" src="res/js/mDisplayControl.js"></script>
</head>

<body onload="init()">
	<div id="container"></div>
	<script type="text/javascript">
		var map;
		var showzoom = 9;
		var AreadyInScreenMarkersClusterer = null;
		var ProvinceMarkers = new HashMap();
		var HostMarkers = [];
		var AuxiliaryMarkers = [];
		var WeldingMaterialMarkers = [];
		var SteelProductsMarkers = [];
		var RepairMarkers = [];
		var showMarkers = [];

		function init() {
			map = new BMap.Map("container");
			var point = new BMap.Point(121, 31);
			map.centerAndZoom(point, 5);
			map.addControl(new BMap.MapTypeControl());
			map.enableScrollWheelZoom(true);
			AreadyInScreenMarkersClusterer = new BMapLib.MarkerClusterer(map);
			AreadyInScreenMarkersClusterer.setMaxZoom(showzoom + 1);
			AreadyInScreenMarkersClusterer.setGridSize(20);
			

			getSupplierInfoGroupByProvince();

			createControlBar();

			map.addEventListener("zoomend", function() {
				if (map.getZoom() < showzoom) {
					getSupplierInfoGroupByProvince();
				} else {
					getSupplierInfoInScreen();
				}
			});

			map.addEventListener("dragend", function() {
				if (map.getZoom() < showzoom) {
					getSupplierInfoGroupByProvince();
				} else {
					getSupplierInfoInScreen();
				}
			});

		}

		function createControlBar() {
		
		
			/*var divtotal = document.createElement("div");
			divtotal.setAttribute("style","height:100px;width:100px");
			*/
			for ( var i = 0; i < 5; i++) {
				var labeltext = "a";
				var divcolor="green";
				if (i == 0) {
					labeltext = "主机";
					divcolor="green";
				}
				if (i == 1) {
					labeltext = "辅机";
					divcolor="red";
				}
				if (i == 2) {
					labeltext = "焊材";
					divcolor="blue";
				}
				if (i == 3) {
					labeltext = "钢材";
					divcolor="yellow";
				}
				if (i == 4) {
					labeltext = "其他";
					divcolor="orange";
				}
				var div = document.createElement("div");
				div.setAttribute("style","height:20px;width:50px;border:0px;background-color:white;"+
				"cursor:pointer;font-size:12px;font-family:'Microsoft YaHei','微软雅黑';"+
				"color:"+divcolor+";");
				
				console.log(div);
				
				var select = document.createElement("input");
				select.setAttribute("type", "checkbox");
				select.setAttribute("value", "1");
				select.setAttribute("id", i);
				select.setAttribute("checked", true);
				var label = document.createElement("label");
				label.appendChild(document.createTextNode(labeltext));
				div.appendChild(select);
				div.appendChild(label);

				var display = new mDisplayControl(div,select, 10, 10 + 20 * i);
				
				
				map.addControl(display);

				showMarkers.push("1");

				display.addEventListener("click", function() {
					var p=this.getAttribute("id");
					if (map.getZoom() >= showzoom) {
						if (showMarkers[p] == "0") {
							showMarkers[p] = "1";
						} else {
							showMarkers[p] = "0";
						}
						getSupplierInfoInScreen();
					}
				});
				
			}

		}

		function getSupplierInfoGroupByProvince() {
			AreadyInScreenMarkersClusterer.clearMarkers();
			$.ajax({
				type : "get",
				url : "./getSupplierInfoGroupByProvince",
				dataType : 'json',
				data : {},
				success : function(json) {
					var list = json["list"];

					for ( var p in list) {
						var point = new BMap.Point(list[p].lng, list[p].lat);
						var marker = new ComplexCustomOverlay(point,
								list[p].total, list[p]._id);

						if (list[p]._id != '') {
							if (!ProvinceMarkers.containsKey(list[p]._id)) {
								ProvinceMarkers.put(list[p]._id, marker);
								addCustomClickHandler(list[p]._id, point,
										marker);
							}
						}

					}

				},
				beforeSend : function() {

				},
				complete : function(XMLHttpRequest, textStatus) {
					var keySet = ProvinceMarkers.keys();
					for ( var i in keySet) {
						var marker = ProvinceMarkers.get(keySet[i]);
						map.addOverlay(marker);
					}
				},
				error : function() {

				}
			});
		}

		function addCustomClickHandler(id, point, marker) {
			marker.addEventListener("click", function(e) {
				map.centerAndZoom(point, showzoom);
				getSupplierInfoInScreen();
			});
		}

		function getSupplierInfoInScreen() {
			var keySet = ProvinceMarkers.keys();
			for ( var i in keySet) {
				var marker = ProvinceMarkers.get(keySet[i]);
				map.removeOverlay(marker);
			}
			ProvinceMarkers.clear();

			var bs = map.getBounds();
			var bssw = bs.getSouthWest();
			var bsne = bs.getNorthEast();
			var maxlat = bsne.lat;
			var minlat = bssw.lat;
			var minlon = bssw.lng;
			var maxlon = bsne.lng;

			$
					.ajax({
						type : "get",
						url : "./getSupplierInfoInScreen",
						dataType : 'json',
						data : {
							maxlon : maxlon,
							maxlat : maxlat,
							minlon : minlon,
							minlat : minlat,
							isOn : showMarkers
						},
						traditional : true,
						success : function(json) {
							var list = json["list"];
							HostMarkers = [];
							AuxiliaryMarkers = [];
							WeldingMaterialMarkers = [];
							SteelProductsMarkers = [];
							RepairMarkers = [];
							for ( var p in list) {
								var marker = getMarker(list[p]._id,
										list[p].firmtype, list[p].lng,
										list[p].lat);

							}
							AreadyInScreenMarkersClusterer.clearMarkers();
							AreadyInScreenMarkersClusterer
									.addMarkers(HostMarkers);
							AreadyInScreenMarkersClusterer
									.addMarkers(AuxiliaryMarkers);
							AreadyInScreenMarkersClusterer
									.addMarkers(WeldingMaterialMarkers);
							AreadyInScreenMarkersClusterer
									.addMarkers(SteelProductsMarkers);
							AreadyInScreenMarkersClusterer
									.addMarkers(RepairMarkers);
						},
						beforeSend : function() {

						},
						complete : function(XMLHttpRequest, textStatus) {

						},
						error : function() {

						}
					});
		}

		function getMarker(id, firmtype, lng, lat) {
			var picurl = "./res/images/markers/red.png";
			if (firmtype == "维修提供商") {
				picurl = "./res/images/markers/orange.png";
			}
			if (firmtype == "主机") {
				picurl = "./res/images/markers/green.png";
			}
			if (firmtype == "焊料") {
				picurl = "./res/images/markers/blue.png";
			}
			if (firmtype == "钢材") {
				picurl = "./res/images/markers/yellow.png";
			}
			if (firmtype == "辅机") {
				picurl = "./res/images/markers/red.png";
			}
			var myIcon = new BMap.Icon(picurl, new BMap.Size(23, 25));
			var point = new BMap.Point(lng, lat);
			var marker = new BMap.Marker(point, {
				icon : myIcon
			});
			addClickHandler(id, marker);
			if (firmtype == "维修提供商") {
				RepairMarkers.push(marker);
			}
			if (firmtype == "主机") {
				HostMarkers.push(marker);
			}
			if (firmtype == "焊料") {
				WeldingMaterialMarkers.push(marker);
			}
			if (firmtype == "钢材") {
				SteelProductsMarkers.push(marker);
			}
			if (firmtype == "辅机") {
				AuxiliaryMarkers.push(marker);
			}

			return marker;
		}

		function addClickHandler(id, marker) {
			marker.addEventListener("click", function(e) {
				getSupplierInfoOne(id, e);
			});
		}

		function getSupplierInfoOne(id, e) {
			$
					.ajax({
						type : "get",
						url : "./QuerySupplierInfoById",
						dataType : 'json',
						data : {
							_id : id
						},
						success : function(json) {
							var list = json["list"];
							for ( var p in list) {
								var content = "<div><h4 style='margin:0 0 5px 0;padding:0.2em 0'>"
										+ list[p].title
										+ "</h4>"
										+ "<p style='font-size:10px; margin:0 0 5px 0;padding:0.2em 0'>"
										+ "供应商性质："
										+ list[p].firmtype
										+ "</p>"
										+ "<p style='font-size:10px; margin:0 0 5px 0;padding:0.2em 0'>"
										+ "详细地址："
										+ list[p].address
										+ "</p>"
										+ "<img style='float:right;margin:4px' id='imgDemo' src='res/images/noImg.png' width='139' height='104' title='"+list[p].title+"'/>"
										+ "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>"
										+ list[p].describe
										+ "</p>"
										+ "<a style='font-size:10px; margin:0 0 5px 0;padding:0.2em 0' href="+list[p].url+">"
										+ "查看详情" + "</a>" + "</div>";
								console.warn(content);
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

		function openInfo(content, e) {
			var p = e.target;
			var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
			var infoWindow = new BMap.InfoWindow(content);
			map.openInfoWindow(infoWindow, point);

			document.getElementById('imgDemo').onload = function() {
				infoWindow.redraw();
			};
		}
	</script>
</body>
</html>
