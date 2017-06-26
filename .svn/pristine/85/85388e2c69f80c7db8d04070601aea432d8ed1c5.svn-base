<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<link rel="shortcut icon" href="favicon.ico">
<link href="./page/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="./page/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="./page/css/animate.css" rel="stylesheet">
<link href="./page/css/style.css?v=4.1.0" rel="stylesheet">
<link href="./page/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
<script type="text/javascript" src="./page/js/echarts-all-3.js"></script>

<script type="text/javascript" src="./page/js/worldcloud.js"></script>
<script type="text/javascript" src="./res/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="./res/js/jquery-ui-1.10.3.min.js"></script>
<link rel="stylesheet" href="./res/css/jquery-ui.min.css"
	type="text/css"></link>
</head>
<!-- 全局js -->
<script src="./page/js/jquery.min.js?v=2.1.4"></script>
<script src="./page/js/bootstrap.min.js?v=3.3.6"></script>
<!-- 自定义js -->
<script src="./page/js/content.js?v=1.0.0"></script>

<!-- Sweet alert -->
<script src="./page/js/plugins/sweetalert/sweetalert.min.js"></script>


<body>
	<div class="right-box-content">
	 <div id="main" style="width: 100%;height:50%;">
     </div>
	<div class="modal-body" style="margin:0 auto; width:396px;">
		<form id="pdfform" method="post">
			<input type="file" name="file" id="file"class="form-control"Style="margin-top:5px; width:70%;float:left" /><button type="button" class="btn btn-primary demo2" style="float:left;margin-top:5px;"
				onclick="getpdfshangchuan()">分析</button>
		</form>
		</div>
	</div>
	<div id="pdfxinxi" style="margin:0 auto;width:80%"></div>
	
	<script type="text/javascript">
	var myChart = echarts.init(document.getElementById('main'));
	
	option = {
    title:{
        text:"词云图",

    },
    tooltip: {},
    series: [{
        type: 'wordCloud',
        gridSize: 20,
        sizeRange: [12, 50],
        rotationRange: [0, 0],
        shape: 'circle',
        textStyle: {
            normal: {
                color: function() {
                    return 'rgb(' + [
                        Math.round(Math.random() * 160),
                        Math.round(Math.random() * 160),
                        Math.round(Math.random() * 160)
                    ].join(',') + ')';
                }
            },
            emphasis: {
                shadowBlur: 10,
                shadowColor: '#333'
            }
        },
        data: [{
            name: 'Sam/ S Club',
            value: '10'
        
        }, {
            name: 'Ma\cys',
            value: '61'
        }, {
            name: 'Amy Schumer',
            value: 43
        }, {
            name: 'Jurassic World',
            value: 40
        }, {
            name: 'Charter Communications',
            value: 24
        }, {
            name: 'Chick Fil A.',
            value: 22
        }, {
            name: 'Planet Fitness',
            value: 18
        }, {
            name: 'Pitch Perfect',
            value: 14
        }, {
            name: 'Express',
            value: 11
        }, {
            name: 'Home',
            value: 9
        }, {
            name: 'Johnny Depp',
            value: 8
        }, {
            name: 'Lena Dunham',
            value: 58
        }, {
            name: 'Lewis Hamilton',
            value: 5
        }, {
            name: 'KXAN.',
            value: '550'
        }, {
            name: 'Mary Ellen Mark',
            value: 462
        }, {
            name: 'Farrah Abraham',
            value: 366
        }, {
            name: 'Rita Ora',
            value: 360
        }, {
            name: 'Serena Williams',
            value: 282
        }, {
            name: 'NCAA baseball tournament',
            value: 273
        }, {
            name: 'Point Break',value: 265
        },]
    }]
};
myChart.setOption(option);
	function getpdfshangchuan() {
	$("#pdfxinxi").html("<h2 style=\"text-align:center;\">正在读取，请等待。。。</h2>");
		var form = new FormData(document.getElementById("pdfform"));

		$
				.ajax({
					type : "post",
					url : "./AddFile",
					dataType : 'json',
					data : form,
					processData : false,
					contentType : false,
					success : function(json) {
						//alert("ok");
							var list = json["list"];
						var m_str1 = "";

						m_str1 = "<table class=\"table table-striped table-hover\"><thead><tr><th style=\"text-align: center;\">内容</th></tr></thead><tbody>";
						
						//alert("as");
						for ( var p in list) {

							m_str1 = m_str1 + "<tr  >";

						
							m_str1 = m_str1
									+ "<td  style=\"width:100px;text-align: center;\">"
									+ list[p].date + "</td> ";

							m_str1 = m_str1 + "</tr>";

						}

						$("#pdfxinxi").html(m_str1);
						
							//alert("ok?");
								
						var Num=json["Num"];
						//alert(Num);
						Num=Num.replace("\\","");
						Num=Num.substring(0,Num.length-1);
						var ss="["+Num+"]";
						//$("#pdfxinxi").html(ss);
						var one = JSON.parse(ss);
						//alert(ss);
						var option = myChart.getOption();
						option.series[0].data =one;
						//alert(option.series[0].data);
						myChart.setOption(option);

					},
					beforeSend : function() {

					},
					complete : function(XMLHttpRequest, textStatus) {

					},
					error : function() {

					}
				});
	}
</script>
</body>
</html>
