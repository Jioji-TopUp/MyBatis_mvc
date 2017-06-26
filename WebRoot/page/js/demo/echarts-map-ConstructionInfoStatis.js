
	var china = [
               {name: '北京',value: 0},
               {name: '天津',value: 0},
               {name: '上海',value: 0},
               {name: '重庆',value: 0},
               {name: '河北',value: 0},
               {name: '河南',value: 0},
               {name: '云南',value: 0},
               {name: '辽宁',value:0},
               {name: '黑龙江',value:0},
               {name: '湖南',value: 0},
               {name: '安徽',value: 0},
               {name: '山东',value: 0},
               {name: '新疆',value: 0},
               {name: '江苏',value: 0},
               {name: '浙江',value: 0},
               {name: '江西',value: 0},
               {name: '湖北',value: 0},
               {name: '广西',value: 0},
               {name: '甘肃',value: 0},
               {name: '山西',value: 0},
               {name: '内蒙古',value:0},
               {name: '陕西',value: 0},
               {name: '吉林',value: 0},
               {name: '福建',value: 0},
               {name: '贵州',value: 0},
               {name: '广东',value: 0},
               {name: '青海',value: 0},
               {name: '西藏',value: 0},
               {name: '四川',value: 0},
               {name: '宁夏',value: 0},
               {name: '海南',value: 0},
               {name: '台湾',value: 0},
               {name: '香港',value: 0},
               {name: '澳门',value: 0}
           ],sss;
	var ss = new Array();
	var dayNum = new Array();
	
$(function() {
	constructionInfoStatis();

	});

	function constructionInfoStatis() {
	$.ajax({
		type : "get",
		url : "../ConstructionInfoStatis",
		dataType : 'json',
		async : false,
		data : {
			startTime : document.getElementById("start").value,
			endTime : document.getElementById("end").value
		},
		success : function(json) {
			sss=china.slice(); ;
			if(json.length!=0){
			for(var j=0;j<sss.length;j++){			
					sss[j]["value"]=0;
			}
			for ( var i = 0; i < json.length; i++) {
				for(var j=0;j<sss.length;j++){
					if (json[i]["name"].search(sss[j]["name"])!=-1)
						sss[j]["value"]+=json[i]["value"];
				}
			}}
			else{
				sss=[];
			}
			for(var m=0;m<sss.length;m++){
				if(sss[m]["value"]==0)
			sss.splice(m, 1);
		}
			var mapoption = mapChart.getOption();
			mapoption.series[0].data = sss;
			mapChart.setOption(mapoption, true);
//alert(JSON.stringify(sss));
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
			text : '全国开工统计',
			subtext : '',
			x : 'center'
		},
		tooltip : {
			trigger : 'item'
		},
		color: ['#39aef5'],
		legend : {
			orient : 'vertical',
			x : 'left',
			data : ['数量'],
			
		},
		dataRange : {
			min : 0,
			max : 500,
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
		series : [{
			name : '数量',
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
			data : sss
		
		} ]
	};
	mapChart.setOption(mapoption);
	$(window).resize(mapChart.resize);
