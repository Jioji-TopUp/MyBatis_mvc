<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<base href="<%=basePath%>" target='_blank' >

<title>My JSP 'CompanyColumns.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


		<link rel="stylesheet" type="text/css" href="./page/css2/semantic.loader.css" />
		<link rel="stylesheet" type="text/css" href="./page/css2/style.min.css" />
		
<link rel="stylesheet" href="css/icon.css" />
		<script type="text/javascript" src="./page/js2/jquery.min.js" ></script>
		<script type="text/javascript" src="./page/js2/semantic.min.js" ></script>
		<script type="text/javascript" src="./page/js2/application.min.js"></script>



	</head>

	<body>
		<div class="ui left vertical sidebar menu"></div>

		<div class="pusher" style="min-height: 100%; height: initial;">
			<canvas class="hidden-xs" style="display: block; visibility: visible; opacity: 1;" width="1421" height="754"></canvas>

			<div class="ui fixed main menu" style="background-color: rgb(59, 131, 192);">
				<div class="column">




					<div class="right menu">
						
						
						<a class="icon item">
							<div class="ui right pointing dropdown icon" tabindex="0">
								<i class="settings icon"></i>
								<div class="menu transition hidden settings-menu" tabindex="-1">
									<div class="header">界面风格</div>
									<div class="item active selected" data-style="Blue">
										<div class="ui blue empty circular label"></div>蓝色风格</div>
									<div class="item" data-style="Black">
										<div class="ui black empty circular label"></div>黑色风格</div>
									<div class="header">辅助功能</div>
									<div class="item popup coloron" data-html="色盲模式下，搜索结果中的关键词将以加粗方式显示！" data-variation="wide"><i class="hide icon"></i> 色盲模式</div>
									<div class="item popup coloroff active selected" data-html="非色盲模式下，搜索结果中的关键词将以加红方式显示！" data-variation="wide"><i class="unhide icon"></i> 常规模式</div>
								</div>
							</div>
						</a>
					</div>
				</div>
				<div class="ui bottom attached indicating tiny searching progress success" data-percent="100">
					<div class="bar" style="transition-duration: 300ms; width: 100%;"></div>
				</div>
				<div class="ui inline cookie nag">

					<i class="close icon"></i>
				</div>
	
			</div>

			<div class="column container">
				<div class="page-main" style="display: none;">
					<div class="google-logo blue"></div>
<!-- 
					<div class="ui left icon action input">
						<i class="fire icon"></i>
						<input class="keywords" name="keywords" type="text" placeholder="Web Searching..." ></input>

						<div class="ui submit button blue"><i class="search icon"></i> <span class="mobile-hide" onclick="search()">Searching</span></div>
					</div>
 -->
				</div>

				<div class="page-search" style="display: block;">
					<div class="ui tertiary segment" style="">
						<div class="ui grid">
							<div class="row">
								<div class="three wide column mobile-hide">

								</div>
								<div class="thirteen wide column">
									<div class="ui left icon action input">
										<i class="fire icon"></i>
										<input id="keywords" class="keywords" name="keywords" type="text" placeholder="Web Searching...">
										<div class="ui submit button blue" onclick="search()"><i class="search icon" ></i> <span class="mobile-hide" >Search</span></div>
									</div>
								</div>
							</div>
						</div>
				</div>

				<div class="ui column grid">
					<div class="row">
						<div class="three wide column mobile-hide hide">

							<div class="ui stacked segment vertical menu search-option hide" style="display: block;width: 500px;">
								<div class="item">
									<a class="title">供应商</a><i class="gys icon"></i>
									<div class="content">
										<div class="ui form">
											<div class="grouped fields">
												<div class="field">

													<input id="gongying" class="keywords" name="keywords" type="text" placeholder="Search">

												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="item">
									<a class="title">时间范围</a><i class="calendar icon"></i>
									<div class="content">
										<div class="ui form">
											<div class="grouped fields">
												<div class="field">
													<div class="ui selection dropdown" tabindex="0">
														<div class="default text">时间不限</div>
														<span style="float: right;">▼</span>
														<input id="time" type="hidden" name="qdr" value="none">
														<div class="menu transition hidden" tabindex="-1" style="">
															<div data-value="none" class="item">时间不限</div>
															<div data-value="h" class="item">1 小时内</div>
															<div data-value="d" class="item">24 小时内</div>
															<div data-value="w" class="item">1 周内</div>
															<div data-value="m" class="item">1 月内</div>
															<div data-value="y" class="item">1 年内</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
						
								

								<div class="item web-option">
									<a class="title">语言范围</a><i class="world icon"></i>
									<div class="content">
										<div class="ui form">
											<div class="grouped fields">
												<div class="field">
													<div class="ui selection dropdown" tabindex="0">
														<div class="default text">所有语言</div>
														<span style="float: right;">▼</span>
														<input id="language" type="hidden" name="lr" value="none">
														<div class="menu transition hidden" tabindex="-1" style="">
															<div data-value="none" class="item">所有语言</div>
															<div data-value="lang_en" class="item">英文网页</div>
															<div data-value="lang_zh-CN" class="item">简体中文网页</div>
															<div data-value="lang_zh-TW" class="item">繁体中文网页</div>
															<div data-value="lang_zh-CN|lang_zh-TW" class="item">中文网页</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="item web-option">
									<a class="title">结果条数</a><i class="browser icon"></i>
									<div class="content">
										<div class="ui form">
											<div class="grouped fields">
												<div class="field">
													<div class="ui selection dropdown" tabindex="0">
														<div id="result_count" class="default text">10条（快）</div>
														<span style="float: right;">▼</span>
														<input type="hidden" name="num" value="">
														<div class="menu transition hidden" tabindex="-1" style="">
															<div data-value="none" class="item">10条（快）</div>
															<div data-value="20" class="item">20条</div>
															<div data-value="30" class="item">30条</div>
															<div data-value="40" class="item">40条</div>
															<div data-value="50" class="item">50条</div>
															<div data-value="100" class="item">100条（慢）</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="item web-option">
									<a class="title">文件类型</a><i class="file text outline icon"></i>
									<div class="content">
										<div class="ui form">
											<div class="grouped fields">
												<div class="field">
													<div class="ui selection dropdown" tabindex="0">
														<div class="default text">任意类型</div>
														<span style="float: right;">▼</span>
														<input id="filetype" type="hidden" name="filetype" value="none">
														<div class="menu transition hidden" tabindex="-1" style="">
															<div data-value="none" class="item">任意类型</div>
															<div data-value="pdf" class="item" >PDF (.pdf)</div>
															<div data-value="ppt" class="item">PPT (.ppt)</div>
															<div data-value="doc" class="item">Word (.doc)</div>
															<div data-value="swf" class="item">Flash (.swf)</div>
															<div data-value="xls" class="item">Excel (.xls)</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="item web-option">
									<a class="title">选择搜索引擎</a><i class="rain icon"></i>
									<div class="content">
										<div class="ui form">
											<div class="grouped fields">
												<div class="field"><div class="ui checkbox"><input name="sousuo" type="checkbox" value="baidu" checked="checked"  ><label>Baidu</label></div></div>
												<div class="field"><div class="ui checkbox"><input name="sousuo" type="checkbox" value="soso"><label>Soso</label></div></div>
												<div class="field"><div class="ui checkbox"><input name="sousuo" type="checkbox" value="sogou"><label>Sogou</label></div></div>
												<div class="field"><div class="ui checkbox"><input name="sousuo" type="checkbox" value="360doc"><label>360 doc</label></div></div>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
						
						<!-- 中间数据 -->
						<div id="data" style="display:none"  class="thirteen wide column">
						
							<div class="ui stacked segment search-result" style="display: block; background-color: rgb(255, 255, 255);">
								<a class="ui ribbon label" onclick="javascript:alert('process: 5.106s');">找到约 <span id="findResultCount" ></span> 条结果
									<nobr> <span id="findTime"></span>&nbsp;</nobr>
								</a>

								<div class="column search-insertad" style="margin-top:10px;">

									<div class="googleadsense-search-desktop">
										<!-- googto搜索结果顶部 -->

										<script>
											//(adsbygoogle = window.adsbygoogle || []).push({});
										</script>
									</div>

								</div>

								<div class="ui left aligned compact segment search-spell" style="display: none;">
									<span class="spell"></span>
									<a class="spell" href="#"></a>
									<div class="ui horizontal divider">OR</div>
									<span class="search_orig">仍然搜索：<a class="spell_orig" href="#"></a></span>
								</div>

								<div class="column search-related" style="display: none;">
									<a class="ui label blue">相关搜索：</a>
								</div>

								<div class="ui stacked compact segment search-card" style="display: none;"></div>

								<div id="resultdata" class="ui selection list search-result-list" style="margin-top: 0px; max-width: 630px;">
									<!--<div class="item">
										<div class="item-title">
											<h3><i class="file outline icon" style="display: none;"></i><a id="result" href="http://news.fx678.com/news/oil/index.shtml" target="_blank">搜索到521家企业信息</a></h3></div>
										<div class="item-full">
											<p class="u"></p>
											<p class="s"><span class="f">新增 - </span>12家企业信息！<em>已成功加入到数据库进行分析处理!</em></p>
										</div>
									</div>
									  <div class="item">
										<div class="item-title">
											<h3><i class="file outline icon" style="display: none;"></i><a href="http://baike.baidu.com/item/%E7%9F%B3%E6%B2%B9" target="_blank">搜索到1254条相关新闻</a></h3></div>
										<div class="item-full">
											<p class="s"><span class="f">新增 - </span>26条新闻信息！<wbr><em>已成功加入到数据库进行分析处理！</em></p>
										</div>
									</div>
									<div class="item">
										<div class="item-title">
											<h3><i class="file outline icon" style="display: none;"></i><a href="http://www.cngold.org/img_date/yuanyou.html" target="_blank">搜索到29个PDF文档</a></h3></div>
										<div class="item-full">
											<p class="s"><span class="f">新增 - </span>0个文档！<em>暂无相关处理！</em></p>
										</div>
									</div>
									<div class="item">
										<div class="item-title">
											<h3><i class="file outline icon" style="display: none;"></i><a href="http://energy.people.com.cn/GB/71897/" target="_blank">本次搜索统计|点击查看处理详情&gt;&gt;</a></h3></div>
										<div class="item-full">
											<p class="s">共有<em>53264</em>条数据要进行处理！<wbr>预计耗时<em>3</em>分钟!</p>
										</div>
									</div>
								</div>-->

								<div class="column search-related-list" style="display: block;">
									<div class="row">
										<a class="ui tag label">相关搜索</a>
									</div>

									<div class="ui list">
										<a class="item ajax" href="/?q=%E7%9F%B3%E6%B2%B9%E4%BB%B7%E6%A0%BC">XX价格</a>
									</div>
									<div class="ui list">
										<a class="item ajax" href="/?q=%E4%B8%AD%E7%9F%B3%E6%B2%B9">XX走势</a>
									</div>
								</div>

								<div class="ui top right attached label search-wiki-button blue" style="display: block;"><i class="tags icon"></i> <span class="text">CBD</span></div>
								<div class="ui bottom right attached label">
									<a href="javascript:;" class="gotop"><i class="upload icon"></i> TOP</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="ui right aligned footer vertical segment page-footer" style="background-color: rgb(229, 229, 229);">
			<a class="ui tag label blue">©2017-2017 CBD</a>
			<div class="ui label mobile-hide blue">
				BY:
				<a class="detail" href="mailto:googto.org@domainsbyproxy.com"><i class="mail icon"></i>CBD</a>
			</div>
		</div>
		</div>

	
		</div>
		
		
		
		<script type="text/javascript">
			//http://hdfsop.cloud.sinocbd.com/search/origin?lr=语言engine=搜索引擎&q=关键字&ft=文件类型&time=距离现在多少小时多个关键字用空格移开
			function search(){
				//获取当前时间
				var beginDate = new Date();
				var endData;
				
			
				//获取页面参数
				var gongying = $("#gongying").val();
				var keywords = $("#keywords").val();
				var time = $("#time").val();
				var language = $("#language").val()=="none"?"":"&lr="+$("#language").val();
				var result_count = $("#result_count").val();
				var filetype = $("#filetype").val();
			
				  var sousuo_value =[];  
				  var sousuoStr ="" ;  
				  $("input[name='sousuo']:checked").each(function(){    
				  	sousuo_value.push($(this).val());  
				  	sousuoStr += $(this).val()+",";
				  });  
				
				 
					
					//合成url 备用
						var url = "http://hdfsop.cloud.sinocbd.com/search?engine=baidu"
								//+sousuoStr
								+"&q="
								+keywords								
								+((filetype=="none")?"":("&ft="+filetype))
								+((time=="none")?"":("&qdr="+time))
								+language;
						
				//	var u = "http://hdfsop.cloud.sinocbd.com/search?engine=baidu&q=ffff&ft=pdf";
					
					//ajax取值
				/*	$.ajax({
						async:false,
						processData: false, 
					
						type : "get",
						url : u,
						dataType : 'jsonp',
						//jsonp: 'jsoncallback',
  						timeout: 5000,
						
						data : {

						},
						success : function(callback(json)) {
							
							
							alert("22");
							
						},
						beforeSend : function() {

						},
						complete : function(XMLHttpRequest, textStatus) {

						},
						error : function() {
alert("99");
						}
					});*/
					
					
					$.getJSON(url,
      function(json){
	      //json  zanshi
					
					//var json = {"links":{"0":"http:\/\/www.baidu.com\/link?url=7ig_PyRB-pmsCbUJaqWQYxmQrdWMIWzHZl4C3BAXugx-jlTCaYJL_gvkWgUPx2QSbP8iV2oO0ZkIj9Tqkfoya4eLpuuak6rfUiBCAUeQxZW","1":"http:\/\/www.baidu.com\/link?url=wbBcaqasPTV0mPtIl71xPd7kQv7cf3Q95gW21nI3Ft_","2":"http:\/\/www.baidu.com\/link?url=keMEZarX9l0BpQ47PjTHd2vnHRIOVabDFr7tQ6PYPoz-XJr_08yvAmuVO2_qoMN-a-78N366dIBl2FlPMQKWtK","3":"http:\/\/www.baidu.com\/link?url=n4aW6WlnqqHX8T1xtuEQPez9V5oRJ9E3buGET6x2HwF4sXkxWhYh61yqUPAQonw67upJYXGEDCkWMUEgdU2Caq","4":"http:\/\/www.baidu.com\/link?url=WFtWeS7LKApjLaXhFZ-z3TNveOi60GVBZ4Sbe7PhH1lxE2pNwe9IN0mL2Bq7Wams","5":"http:\/\/www.baidu.com\/link?url=xH9bMzjkNwBaZuDgeK7n3nIIGL-jcN0LxZbIe1Rz5Fu","6":"http:\/\/www.baidu.com\/link?url=Fbkp8Z8hZliUwBCtSpbFzQmBVrRZHP9WcL00qdNRP_7sfBJxfQkZ02CAHLK8N5YK9HxDdtCU1kSug69bGdzjwg1QWnURf_c4QxiDrzSNNx7","7":"http:\/\/www.baidu.com\/link?url=9dJmDMld_1mA2_fJ6DDWRHLUXMCJzTaU8Zw9ulqQ_u_J39EqRB-eCDf7YV5peuvp","8":"http:\/\/www.baidu.com\/link?url=fsOnpjd6qD1ZqLMEqO0Yo-wDX_62fBa1R4sE1ryvtqi","9":"http:\/\/www.baidu.com\/link?url=k20IucapVCri3BSsa7RpiMeTfmn_UoRRmWSimzGaJQu"},"titles":{"0":"FFF\u56e2_\u767e\u5ea6\u767e\u79d1","1":"FFFFOUND!","2":"ffff\u662f\u4ec0\u4e48_\u767e\u5ea6\u77e5\u9053","3":"\u767e\u5ea6\u7ffb\u8bd1","4":"B\u7ad9\u4e0a\u5f39\u5e55FFFFFFFFFFFFFFFF\u662f\u4ec0\u4e48\u610f\u601d\uff1f_bilibili\u5427_\u767e\u5ea6\u8d34\u5427","5":"\u770b80\u540e\u64cdB","6":"\n\u628a\u5341\u516d\u8fdb\u52360xFFFF\u8f6c\u6362\u6210\u5341\u8fdb\u5236\u7b49\u4e8e-1\u5417?\u4e3a\u4ec0\u4e48?\u80fd\u8be6\u7ec6\u8bf4\u4e0b\u600e\u4e48\u7b97\u5417?\u8c22\u8c22!_\u767e\u5ea6\u4f5c\u4e1a\u5e2e","7":"ffff_\u674e\u6bc5\u5427_\u767e\u5ea6\u8d34\u5427","8":"ffff\u662f\u4ec0\u4e48\u610f\u601d_ffff\u5728\u7ebf\u7ffb\u8bd1_\u82f1\u8bed_\u8bfb\u97f3_\u7528\u6cd5_\u4f8b\u53e5_\u6d77\u8bcd\u8bcd\u5178","9":"\u4e71\u4f26\u7535\u5f71"}};
					
					var titles = json["titles"];
					var links = json["links"];
					var count = 0;
					
					var adddiv = "";
					
					for(var i in titles){
						count++;
						//alert(titles[i]);
						//alert(links[i]);
						var t = titles[i];
						if(titles[i]==""){
							t = "该条数据为找到标题";
						}
						adddiv += "<div class='item-title'><h3><i class='file outline icon' style='display: none;'></i><a  href='"+links[i]+"' target='_blank'>"+t+"</a></h3></div><div class='item-full'><p class='u'></p><p class='s'><em>已成功加入到数据库进行分析处理!</em></p></div>";
					}
					
					$("#resultdata").html(adddiv);

					//暂时在这  合成结果
					$("#data").css("display","inline-block");
					//返回数据条数
					$("#findResultCount").html(count);
					/*返回数据时间
					endData = new Date();
					var findTime = endData.getTime()-begin.getTime();
					var time = findTime%(60*1000);
					$("#findTime").html(time);*/
					
					//数据
        });

					
					
					
			}

		</script>
	
	</body>


</html>