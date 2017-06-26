function mDisplayControl(div,select, OffsetX, OffsetY) {
	// 默认停靠位置和偏移量
	this.defaultAnchor = BMAP_ANCHOR_TOP_LEFT;
	this.defaultOffset = new BMap.Size(OffsetX, OffsetY);
	this._div = div;
	this._select=select;
}

// 通过JavaScript的prototype属性继承于BMap.Control
mDisplayControl.prototype = new BMap.Control();

// 自定义控件必须实现自己的initialize方法,并且将控件的DOM元素返回
// 在本方法中创建个div元素作为控件的容器,并将其添加到地图容器中
mDisplayControl.prototype.initialize = function(map) {
	var div = this._div;
	// 设置样式

	// 添加DOM元素到地图中
	map.getContainer().appendChild(div);
	this._div = div;
	// 将DOM元素返回
	return div;
}

mDisplayControl.prototype.addEventListener = function(event, fun) {
	//this._div['on' + event] = fun;
	this._select['on' + event] = fun;
}