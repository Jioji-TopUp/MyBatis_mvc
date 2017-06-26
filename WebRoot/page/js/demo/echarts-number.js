$(function() {

	number();

});
var sss = null;
var s1 = new Array();
var s2 = [ 0, 0, 0, 0, 0 ];
var dayNum = new Array();
function getTime() {
	number();
};
function number() {

	$.ajax({
		type : "get",
		url : "../OrderInfostatis",
		dataType : 'json',
		async : false,
		data : {
			startTime : document.getElementById("start").value,
			endTime : document.getElementById("end").value
		},
		success : function(json) {
			if (json.length != 0) {
				for ( var i = 0; i < json.length; i++) {

					switch (parseInt(json[i]["name"])) {
					case 0:
						s2[0] = json[i]["value"];

						break;
					case 1:
						s2[1] = json[i]["value"];

						break;
					case 2:
						s2[2] = json[i]["value"];

						break;
					case 3:
						s2[3] = json[i]["value"];
						break;
					default:
						s2[4] = json[i]["value"];
						break;

					}
				}
			} else {
				s2 = [ 0, 0, 0, 0, 0 ];
			}
			var baroption = barChart.getOption();
			baroption.series[0].data = s2;
			barChart.setOption(baroption, true);
			// alert(s2);
		},
		beforeSend : function() {

		},
		complete : function(XMLHttpRequest, textStatus) {

		},
		error : function() {

		}
	});
}

$(function() {
	barChart = echarts.init(document.getElementById("echarts-bar-chart"));
	var yMax = 100;
	var baroption = {
		title : {
			text : '订单量'
		},
		tooltip : {
			trigger : 'axis'
		},
		color : [ '#39aef5' ],
		legend : {
			data : [ '订单统计' ]
		},
		grid : {
			x : 40,
			x2 : 40,
			y2 : 24
		},
		calculable : true,
		xAxis : [ {
			type : 'category',
			data : [ '等待店家确定', '器械使用中', '等待评价', '完成交易', '取消订单' ]
		} ],
		yAxis : [ {
			type : 'value',
			max : 50
		} ],
		series : [ {
			name : '订单统计',
			type : 'bar',
			data : s2,
			markPoint : {
				data : [

				]
			},
			markLine : {
				data : [ {
					type : 'average',
					name : '平均值'
				} ]
			}

		} ]
	};
	barChart.setOption(baroption);
	window.onresize = barChart.resize;
});
