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

.slider {
	z-index: 2;
	position: relative;
	margin-top: 0px;
	overflow-y: hidden;
	max-height: 600px;
	height: 600px;
	/* 最大高度 */
	/*  Webkit内核浏览器：Safari and Chrome*/
	-webkit-transition-property: all;
	-webkit-transition-duration: .5s;
	-webkit-transition-timing-function: cubic-bezier(0, 1, 0.5, 1);
	/*  Mozilla内核浏览器：firefox3.5+*/
	-moz-transition-property: all;
	-moz-transition-duration: .5s;
	-moz-transition-timing-function: cubic-bezier(0, 1, 0.5, 1);
	/*  Opera*/
	-o-transition-property: all;
	-o-transition-duration: .5s;
	-o-transition-timing-function: cubic-bezier(0, 1, 0.5, 1);
	/*  IE9*/
	-ms-transition-property: all;
	-ms-transition-duration: .5s;
	-ms-transition-timing-function: cubic-bezier(0, 1, 0.5, 1);
}

.slider.closed {
	max-height: 0px;
}

.slider.open {
	max-height: 500px;
}
</style>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=39VsPwWnD61e6Ru57Ev8yZH4O1WV67jy">
</script>
<script type="text/javascript"
	src="http://api.map.baidu.com/library/TextIconOverlay/1.2/src/TextIconOverlay_min.js"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/library/MarkerClusterer/1.2/src/MarkerClusterer_min.js"></script>
<link rel="stylesheet" href="res/css/baidu.css" />
<script type="text/javascript" src="res/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="res/js/HashMap.js"></script>
</head>

<body onload="init()">
	<div id="container" style="position:fixed;z-index: -10;"></div>
	<button id="button1"
		style="position:absolute;top:20px;left:460px; width:100px;height:38px; background-color:#3385ff; color:white;"
		onclick="initinfo()">查看开工信息</button>
	<div style="position:absolute;top:20px; left: 20px;" id="searchbox"
		class="clearfix">

		<div id="searchbox-container">
			<div id="sole-searchbox-content" class="searchbox-content">
				<input id="sole-input" class="searchbox-content-common" type="text"
					name="word" autocomplete="off" maxlength="256" placeholder=""
					value="" />
				<div id="clear" class="input-clear" title="清空"></div>
			</div>
		</div>
		<button id="search-button" onclick="ondata()" data-title="搜索"></button>

		<div id="toast-wrapper">
			<div id="toast">
				<img class="info-tip-img"
					src="/wolfman/static/common/images/transparent.gif" alt="" /> <span
					class="info-tip-text"></span>
			</div>
		</div>

		<ul id="cards-level0" class="cardlist"></ul>

		<ul style="position:absolute;top:50px;" id="cards-level1"
			class="cardlist">
			<button id="btnAllList"
				style=" display:none;height:auto;text-align:center; position:absolute;z-index:0; width:100%;height:40px;background-color:white;"
				onmouseover="mOver()">查看所有</button>
			<div class="slider" id="slider"></div>

		</ul>
		<ul id="cards-level2" class="cardlist"></ul>
	</div>

	<div id="r-result"></div>
	<script type="text/javascript">
	
	function mOver(){  
    	document.getElementById('slider').style.cssText="max-height: 500px";
    	showBtnAllList() ;
    
    }
var myDiv = $("#slider");
$(function ()
{

$("#container").click(function (event) 
{
document.getElementById('slider').style.cssText="max-height: 0px";

event.stopPropagation();
});
$("#clear").click(function (event) 
{
document.getElementById('btnAllList').style.display = "none";
document.getElementById('slider').style.cssText="max-height: 0px";
document.getElementById("sole-input").value="";
document.getElementById('clear').style.display = "none";
});

});
function showDiv() 
{
$(myDiv).fadeIn();
}
function showBtnAllList() 
{
$("#btnAllList").fadeIn(3000);
}

	
	function getAllList(){
map.centerAndZoom(point, 11);
map.clearOverlays();  
	document.getElementById('slider').classList.toggle('closed');
	}
		var map;
		var showzoom=6;
		var AreadyInScreenMarkers=new HashMap();
		
		function init() {
		$.ajax({
				type : "get",
				url : "./getUserLoginlog",
				dataType : 'json',
				data : {
				
				},
				success : function(json) {
				arr=json["returns"].position.split(","); 
				point = new BMap.Point(arr[0],arr[1]);
map = new BMap.Map("container");
			map.centerAndZoom(point, 11);
			map.enableScrollWheelZoom(true);
						
			var marker = new BMap.Marker(point);  // 创建标注
	map.addOverlay(marker);               // 将标注添加到地图中
	marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
var myKeys = [""];	
				},
				beforeSend : function() {

				},
				complete : function(XMLHttpRequest, textStatus) {

				},
				error : function() {

				}
			});

}
	function ondata() {
map.clearOverlays();         
	document.getElementById('clear').style.display = "block";
document.getElementById('slider').style.cssText="max-height: 500px";
$("#btnAllList").fadeIn(1000);
	myKeys=document.getElementById("sole-input").value;
	//alert(myKeys);
		document.getElementById('slider').classList.toggle('open');
		var local = new BMap.LocalSearch(map, {
		renderOptions:{map: map, panel:"slider"},
		pageCapacity:5
	});
	local.searchInBounds(myKeys, map.getBounds());
	}	
	
	
function initinfo() {
document.getElementById('btnAllList').style.display = "none";
document.getElementById('slider').style.cssText="max-height: 0px";
document.getElementById("sole-input").value="";
document.getElementById('clear').style.display = "none";
			map.clearOverlays();         
			var point = new BMap.Point(121, 31);
			map.centerAndZoom(point, 5);
			map.addControl(new BMap.MapTypeControl());

			
	
			map.addEventListener("zoomend", function() {
				if (map.getZoom() <= showzoom) {
					map.clearOverlays();
					getConstructionInfoGroupByProvince();
				}else{
				
					getConstructionInfoInScreen();
				
				}
			});

			map.addEventListener("dragend", function() {
				if (map.getZoom() <= showzoom) {
					getConstructionInfoGroupByProvince();
				}else{					
					getConstructionInfoInScreen();
				}
			});

			getConstructionInfoGroupByProvince();

		}

		function getConstructionInfoGroupByProvince() {
			$.ajax({
				type : "get",
				url : "./getConstructionInfoGroupByProvince",
				dataType : 'json',
				data : {},
				success : function(json) {
					var list = json["list"];

					for ( var p in list) {
						var point = new BMap.Point(list[p].lng, list[p].lat);
						var marker = new ComplexCustomOverlay(point,
								list[p].total, list[p]._id);
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

		function ComplexCustomOverlay(point, text, citynum) {
			this._point = point;
			this._text = text;
			this._citynum = citynum;
		}
		ComplexCustomOverlay.prototype = new BMap.Overlay();
		ComplexCustomOverlay.prototype.initialize = function(map) {
			this._map = map;
			var div = this._div = document.createElement("div");
			div.style.position = "absolute";
			div.style.zIndex = BMap.Overlay.getZIndex(this._point.lat);
			div.style.background = "url(res/images/m0.png) -5px";
			div.style.borderRadius = "25px";
			div.style.border = "solid rgb(100,100,100) 1px;";
			div.style.color = "white";
			div.style.height = "40px";
			div.style.width = "40px";
			div.style.padding = "2px";
			div.style.lineHeight = "40px";
			div.style.whiteSpace = "nowrap";
			div.style.MozUserSelect = "none";
			div.style.fontSize = "12px";
			div.style.textAlign = "center";
			
			div.style.verticalAlign = "middle";
			var span = this._span = document.createElement("span");
			div.appendChild(span);
			div.appendChild(document.createTextNode(this._text));

			var arrow = this._arrow = document.createElement("div");
			arrow.style.backgroundColor = "";
			arrow.style.position = "absolute";
			arrow.style.width = "11px";
			arrow.style.height = "10px";
			arrow.style.top = "0px";
			arrow.style.left = "0px";
			arrow.style.overflow = "hidden";
			div.appendChild(arrow);
			addCustomClickHandler(this._citynum, this._point, div);

			this._map.getPanes().labelPane.appendChild(div);

			return div;
		};
		ComplexCustomOverlay.prototype.draw = function() {
			var map = this._map;
			var pixel = map.pointToOverlayPixel(this._point);
			this._div.style.left = pixel.x - parseInt(this._arrow.style.left)
					+ "px";
			this._div.style.top = pixel.y - 30 + "px";
		};

		function getConstructionInfoByProvince(provinceid) {
			map.clearOverlays();
			$.ajax({
				type : "get",
				url : "./getConstructionInfoByProvince",
				dataType : 'json',
				data : {
					provinceid : provinceid
				},
				success : function(json) {
					var list = json["list"];

					for ( var p in list) {
						var point = new BMap.Point(list[p].lng, list[p].lat);
						var marker = new BMap.Marker(point);
						map.addOverlay(marker);
						addClickHandler(list[p]._id, marker);
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
		
		function getConstructionInfoInScreen() {
			var bs = map.getBounds();
			var bssw = bs.getSouthWest();
			var bsne = bs.getNorthEast();
			var maxlat = bsne.lat;
			var minlat = bssw.lat;
			var minlon = bssw.lng;
			var maxlon = bsne.lng;
			$.ajax({
				type : "get",
				url : "./getConstructionInfoInScreen",
				dataType : 'json',
				data : {
					maxlon:maxlon,
					maxlat:maxlat,
					minlon:minlon,
					minlat:minlat
				},
				success : function(json) {
					var list = json["list"];

					for ( var p in list) {						
						var point = new BMap.Point(list[p].lng, list[p].lat);
						var marker = new BMap.Marker(point);
						
						if(!AreadyInScreenMarkers.containsKey(list[p]._id)){
							AreadyInScreenMarkers.put(list[p]._id, marker);
							map.addOverlay(marker);
							addClickHandler(list[p]._id, marker);
						}else{
							
						}
						
					}
				},
				beforeSend : function() {

				},
				complete : function(XMLHttpRequest, textStatus) {
					deleteMarkersOutScreen();
				},
				error : function() {

				}
			});
		}
		
		function deleteMarkersOutScreen(){
			var bs = map.getBounds();
			var bssw = bs.getSouthWest();
			var bsne = bs.getNorthEast();
			var maxlat = bsne.lat;
			var minlat = bssw.lat;
			var minlon = bssw.lng;
			var maxlon = bsne.lng;
			var keySet = AreadyInScreenMarkers.keys();
			for(var i in keySet){
				var marker=AreadyInScreenMarkers.get(keySet[i]);
				if(marker.point.lng>maxlon||marker.point.lng<minlon
					||marker.point.lat>maxlat||marker.point.lat<minlat){
					AreadyInScreenMarkers.remove(keySet[i]);
				}
			}
			
			var mmarkers=map.getOverlays();
			for(var i in mmarkers){	
				if(mmarkers[i].point.lng>maxlon||mmarkers[i].point.lng<minlon
					||mmarkers[i].point.lat>maxlat||mmarkers[i].point.lat<minlat){
					map.removeOverlay(mmarkers[i]);
				}
			}
			//alert(map.getOverlays().length);
			
		}
		

		function addCustomClickHandler(id, point, div) {
			div.addEventListener("click", function(e) {
				map.centerAndZoom(point, 8);
				getConstructionInfoByProvince(id);
			});
		}

		function addClickHandler(id, marker) {
			marker.addEventListener("click", function(e) {
				getConstructionInfoOne(id, e);
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
										+"<p style='font-size:10px; margin:0 0 5px 0;padding:0.2em 0'>"
										+ "工程日期："+list[p].completion_time
										+ "</p>"
										+"<p style='font-size:10px; margin:0 0 5px 0;padding:0.2em 0'>"
										+ "详细地址："+list[p].address
										+ "</p>"
										+ "<img style='float:right;margin:4px' id='imgDemo' src='res/images/noImg.png' width='139' height='104' title='"+list[p].title+"'/>"
										+ "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>"
										+ list[p].describe + "</p>"
										+"<a style='font-size:10px; margin:0 0 5px 0;padding:0.2em 0' href="+list[p].url+">"
										+ "查看详情"
										+ "</a>"
										
										"</div>";
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
			var infoWindow = new BMap.InfoWindow(content); // 创建信息窗口对象 
			map.openInfoWindow(infoWindow, point); //开启信息窗口

			document.getElementById('imgDemo').onload = function() {
				infoWindow.redraw(); //防止在网速较慢，图片未加载时，生成的信息框高度比图片的总高度小，导致图片部分被隐藏
			};
}


		
	</script>
</body>
</html>
