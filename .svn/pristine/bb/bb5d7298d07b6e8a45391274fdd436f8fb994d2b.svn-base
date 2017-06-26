var sss = null;
var ss = new Array();
var dayNum = new Array();
$(function() {
	userLoginStatics();

});

function userLoginStatics() {
	$.ajax({
		type : "get",
		url : "../getUserLoginStatics",
		dataType : 'json',
		async : false,
		data : {
			startTime : document.getElementById("start").value,
			endTime : document.getElementById("end").value
		},
		success : function(json) {
			var tem = new Array();
			// alert(JSON.stringify(json));
			var value = 0;
			for ( var i = 0; i < json.length; i++) {

				if (json[i]["name"].search("上海") != -1
						|| json[i]["name"].search("shanghai") != -1
						|| json[i]["name"] == "point(120 30)") {
					value += json[i]["value"];
					delete json[i];

				} else {
					tem.push(json[i]);
				}

			}
			tem.push({
				name : "上海",
				value : value
			});
			ss = tem;
			var mapoption = mapChart.getOption();
			mapoption.series[0].data = ss;
			mapChart.setOption(mapoption, true);
			// alert(JSON.stringify(ss));
		},
		beforeSend : function() {

		},
		complete : function(XMLHttpRequest, textStatus) {

		},
		error : function() {

		}
	});
}

mapChart = echarts.init(document.getElementById("echarts-map-chart"));
var mapoption = {
	title : {
		text : '用户活跃度',
		subtext : '',
		x : 'center'
	},
	tooltip : {
		trigger : 'item'
	},
	color : [ '#39aef5' ],
	legend : {
		orient : 'vertical',
		x : 'left',
		data : [ '活跃度' ],

	},
	dataRange : {
		min : 0,
		max : 2500,
		x : 'left',
		y : 'bottom',
		text : [ '高', '低' ], // 文本，默认为数值文本
		calculable : true,

	},
	toolbox : {
		show : true,
		orient : 'vertical',
		x : 'right',
		y : 'center',
		feature : {
			mark : {
				show : true
			},
			dataView : {
				show : true,
				readOnly : false
			},
			restore : {
				show : true
			},
			saveAsImage : {
				show : true
			}
		}
	},
	roamController : {
		show : true,
		x : 'right',
		mapTypeControl : {
			'china' : true
		}
	},
	series : [ {
		name : '活跃度',
		type : 'map',
		mapType : 'china',
		itemStyle : {
			normal : {
				label : {
					show : true
				}
			},
			emphasis : {
				label : {
					show : true
				}
			}
		},
		data : ss

	} ]
};
mapChart.setOption(mapoption);
$(window).resize(mapChart.resize);
