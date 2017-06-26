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
ComplexCustomOverlay.prototype.initialize = function(map) {
	this._map = map;
	var div = this._div;
	div.style.zIndex = BMap.Overlay.getZIndex(this._point.lat);
	div.style.position = "absolute";
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
	span.appendChild(document.createTextNode(this._text));
	var that = this;

	var arrow = this._arrow = document.createElement("div");
	//arrow.style.background = "url(http://map.baidu.com/fwmap/upload/r/map/fwmap/static/house/images/label.png) no-repeat";
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
ComplexCustomOverlay.prototype.draw = function() {
	var map = this._map;
	var pixel = map.pointToOverlayPixel(this._point);
	this._div.style.left = pixel.x - parseInt(this._arrow.style.left) + "px";
	this._div.style.top = pixel.y - 30 + "px";
}

//6、自定义覆盖物添加事件方法
ComplexCustomOverlay.prototype.addEventListener = function(event, fun) {
	this._div['on' + event] = fun;
}