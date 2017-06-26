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

<title>My JSP 'gongyingshang.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
body,ul,li {
	margin: 0;
	padding: 0;
}

body {
	background-color: #e4e9f1;
	color: #002446;
	margin: 0;
}

input,select,textarea,th,td {
	font-size: 1em;
}

ol.tree {
	padding: 0 0 0 30px;
	width: 300px;
}

li {
	position: relative;
	margin-left: -15px;
	list-style: none;
}

li.file {
	margin-left: -18px !important;
}

li.file a {
	background: url(document.png) 0 0 no-repeat;
	color: #002446;
	padding-left: 21px;
	text-decoration: none;
	display: block;
}

li input {
	position: absolute;
	left: 0;
	margin-left: 0;
	opacity: 0;
	z-index: 2;
	cursor: pointer;
	height: 1em;
	width: 1em;
	top: 0;
}

input+ol {
	display: none;
}

input+ol>li {
	height: 0;
	overflow: hidden;
	margin-left: -14px !important;
	padding-left: 1px;
}

li label {
	cursor: pointer;
	display: block;
	padding-left: 17px;
	background: url(toggle-small-expand.png) no-repeat 0px 1px;
}

input:checked+ol {
	background: url(toggle-small.png) 44px 5px no-repeat;
	margin: -22px 0 0 -44px;
	padding: 27px 0 0 80px;
	height: auto;
	display: block;
}

input:checked+ol>li {
	height: auto;
}
</style>

</head>

<body>
	<div>
		<h4 style='margin:0 0 5px 0;padding:0.2em 0'>内蒙古内蒙古二连浩特驿通旅游开发有限责任有限公司-二连浩特旅游综合服务中心室内装修装饰项目</h4>
		<p style='font-size:10px; margin:0 0 5px 0;padding:0.2em 0'>工程日期：2017-04-19
			至 2017-06-19</p>
		<p style='font-size:10px; margin:0 0 5px 0;padding:0.2em 0'>详细地址：内蒙古锡林郭勒盟二连浩特市国门景区</p>
		<img style='float:right;margin:4px' id='imgDemo'
			src='res/images/noImg.png' width='139' height='104'
			title='内蒙古内蒙古二连浩特驿通旅游开发有限责任有限公司-二连浩特旅游综合服务中心室内装修装饰项目' />
		<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>对数幢数层高的旅游综合服务中心进行室内装修,
			建筑面积2983平方米2017-03-02   版本1     室内外装修       截止到2017年3月上旬, 项目室内设计完成,
			正在进行室内施工单位招标</p>
		<a style='font-size:10px; margin:0 0 5px 0;padding:0.2em 0'
			href=http://jsgc168.com/gcxx/show-353147.html>查看详情</a>

		<ol class="tree">
			<li><label for="folder1">水产养殖</label> <input type="checkbox"
				id="folder1" checked="checked" />
				<ol>
					<li class="file"><a href="#">实时数据</a></li>
					<li><label for="subfolder1">实时数据</label> <input
						type="checkbox" id="subfolder1" />
						<ol>
							<li class="file"><a href="">下级</a></li>
							<li><label for="subsubfolder1">下级</label> <input
								type="checkbox" id="subsubfolder1" />
								<ol>

									<li class="file"><a href="">下级</a></li>
									<li><label for="subsubfolder2">下级</label> <input
										type="checkbox" id="subsubfolder2" />
										<ol>
											<li class="file"><a href="">无限级</a></li>
											<li class="file"><a href="">无限级</a></li>
											<li class="file"><a href="">无限级</a></li>

											<li class="file"><a href="">无限级</a></li>
											<li class="file"><a href="">无限级</a></li>
											<li class="file"><a href="">无限级</a></li>
										</ol>
									</li>
								</ol>
							</li>

							<li class="file"><a href="">下级</a></li>
							<li class="file"><a href="">下级</a></li>
							<li class="file"><a href="">下级</a></li>
							<li class="file"><a href="">下级</a></li>
						</ol>
					</li>
				</ol>
			</li>

		</ol>
	</div>
</body>
</html>
