<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	//T_userForm a=(T_userForm)session.getAttribute("user");
%>

<link rel="stylesheet" href="res/css/product.css" type="text/css"></link>

<style>

</style>
<script type="text/javascript">
	function productOnload(){

		getProductList(1,5);
		
	}
	
	function showFaultList(pro_id){
		
	}
	
	 function getProductList(page,interval) { 
       	var start = (page - 1) * interval;
       
		$.ajax({
			type : "get",
			url : "./getAllTabels",
			dataType : 'json',
			data : {
				//belongto_Enterprise_id:10001,
				
				start : start,
				interval : interval,
			},
			success : function(json) {
			
								var returnnum = json["returnnum"];
				if(returnnum=='1'){
				    $("#product_PageIterator").css("display", "none");
						$("#productList").html("没有查询到企业产品信息");
						
				}else{
				
				var m_str1 = "";
				
				
				
				m_str1 = "<table class='pro_table'><tr><th>产品图片</th><th>产品ID</th><th>产品名称</th><th>产品型号</th><th>二维码</th><th>操作</th></th>";
				var list = json["list"];

				for ( var p in list) {
					m_str1 = m_str1
							+ "<tr onmouseover=\"showFaultList("+list[p].pro_id+")\" style=\"background-color:#FFFFFF\" >";
					m_str1 = m_str1
							+ "<td style=\"text-align: center;\"><img src=\"./pro_pic?Id="+list[p].base_pic_id+"\" width=\"64\" height=\"64\"></td>";
					m_str1 = m_str1
							+ "<td style=\"width:50px;text-align: center;\">"
							+ list[p].pro_id + "</td>";
					m_str1 = m_str1
							+ "<td style=\"width:200px;text-align: center;\">"
							+ list[p].pro_name + "</td>";
					m_str1 = m_str1
							+ "<td style=\"width:100px;text-align: center;\">"
							+ list[p].pro_model + "</td>";
					m_str1 = m_str1
							+ "<td style=\"width:400px;text-align: center;\"><a class=\"button\" onclick=\"addqrcodebatchOnload('"+list[p].pro_id+"')\">添加二维码信息</a><a class=\"button\" onclick=\"ckqrcodebatchOnload('"+list[p].pro_id+"')\">查看二维码信息</a></td>";		
					m_str1 = m_str1
							+ "<td style=\"width:400px;text-align: center;\">"
							+"<input class=\"buttonAdd showCSS\"type=\"button\" onclick=\"productbasedetail('"+list[p].pro_id+"')\" value=\"查看产品详情信息\">"
							+"<input class=\"buttonAdd showCSS\"type=\"button\" onclick=\"imgupload('"+list[p].pro_id+"')\" value=\"添加图片\">"	
							+"<input class=\"buttonEdit\"type=\"button\" onclick=\"updateproduct('"+list[p].pro_id+"')\" value=\"修改\">"	
							+"<input class=\"buttonRemove\"type=\"button\" onclick=\"chk('"+list[p].pro_id+"')\" value=\"删除\"></td>";
					
					
				}
				m_str1 = m_str1 + "</table>";
				
				$("#productList").html(m_str1);
				
				
				var count = json["count"];
				
				var page=Math.ceil((start+1)/interval);
            	 totalpage=Math.ceil(count/interval);
            	

            	var m_str2="<a class='button' onclick='product_pageprev("+page+","+interval+")'>上一页</a>";
				m_str2=m_str2+"<a class='button' onclick='product_pagenext("+page+","+interval+","+totalpage+")'>下一页</a>";
				m_str2=m_str2+"<span >第"+page+"页/共"+totalpage+"页</span>";
            	
            	$("#product_PageIterator").css("display", "block");
	            $("#product_PageIterator").html(m_str2);
	            
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
	

	function product_pagenext(page,interval,totalpage){

		if(page<totalpage){
			page=page+1;
			getProductList(page,interval);
		}else{
			alert("已到末页");
		}
	}
	

	function product_pageprev(page,interval){
		if(page>1){
			page=page-1;
			getProductList(page,interval);
		}else{
			alert("已到第一页");
		}
	}	
	

	function chk(id) {
		if (confirm("你确定要删除吗？")) {
		$.ajax({
                cache: true,
                type: "get",
                url:"./deleteproductbase",
                 dataType : 'json',
                data:{
				//belongto_Enterprise_id:10001,
				pro_id:id,
			},
                success: function(json) {
                
				m_str1 = "删除成功";
				productOnload();

                },
                error: function(request) {
                    alert("error");
                }
              
            });
			
		}
	}
	function chk2(id) {

		location.href = "/zykyNew/updateproduct?pro_id=" + id;

	}
	function chk3(id) {

		location.href = "/zykyNew/toUpload?pro_id=" + id;

	}
</script>
<div id="product" style="display:none"  >

		<div class="right-box-content" style="width: 1000px;text-align: center;">
		
		
		
			<div id="productList"></div>
			<div id="product_PageIterator"></div>
		
		</div>
	
	
</div>
