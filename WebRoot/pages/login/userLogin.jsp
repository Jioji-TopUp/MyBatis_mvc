<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>登录</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="res/css/product.css" type="text/css"></link>

</head>
<style type="text/css">
body {
	background-color: #326696;
	margin: 0px;
	overflow: hidden;
	font-family: Monospace;
	font-size: 13px;
	text-align: center;
	font-weight: bold;
	text-align: center;
}

a {
	color: #0078ff;
}
</style>
<body>
	<script type="text/javascript" src="res/js/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="res/js/ThreeWebGL.js"></script>
	<script type="text/javascript" src="res/js/ThreeExtras.js"></script>
	<script type="text/javascript" src="res/js/Cloud.js"></script>
	<script type="text/javascript" src="res/js/RequestAnimationFrame.js"></script>
	<script id="vs" type="x-shader/x-vertex">

			varying vec2 vUv;

			void main() {

				vUv = uv;
				gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 );

			}

		</script>
	<script id="fs" type="x-shader/x-fragment">

			uniform sampler2D map;

			uniform vec3 fogColor;
			uniform float fogNear;
			uniform float fogFar;

			varying vec2 vUv;

			void main() {

				float depth = gl_FragCoord.z / gl_FragCoord.w;
				float fogFactor = smoothstep( fogNear, fogFar, depth );

				gl_FragColor = texture2D( map, vUv );
				gl_FragColor.w *= pow( gl_FragCoord.z, 20.0 );
				gl_FragColor = mix( gl_FragColor, vec4( fogColor, gl_FragColor.w ), fogFactor );

			}

		</script>
	<script type="text/javascript">
		if (!Detector.webgl)
			Detector.addGetWebGLMessage();

		// Bg gradient

		var canvas = document.createElement('canvas');
		canvas.width = 32;
		canvas.height = window.innerHeight;

		var context = canvas.getContext('2d');

		var gradient = context.createLinearGradient(0, 0, 0, canvas.height);
		gradient.addColorStop(0, "#1e4877");
		gradient.addColorStop(0.5, "#4584b4");

		context.fillStyle = gradient;
		context.fillRect(0, 0, canvas.width, canvas.height);

		document.body.style.background = 'url(' + canvas.toDataURL('image/png')
				+ ')';

		// Clouds

		var container;
		var camera, scene, renderer, sky, mesh, geometry, material, i, h, color, colors = [], sprite, size, x, y, z;

		var mouseX = 0, mouseY = 0;
		var start_time = new Date().getTime();

		var windowHalfX = window.innerWidth / 2;
		var windowHalfY = window.innerHeight / 2;

		init();
		animate();

		function init() {

			container = document.createElement('div');
			document.body.appendChild(container);

			camera = new THREE.Camera(30, window.innerWidth
					/ window.innerHeight, 1, 3000);
			camera.position.z = 6000;

			scene = new THREE.Scene();

			geometry = new THREE.Geometry();

			var texture = THREE.ImageUtils
					.loadTexture('res/images/cloud10.png');
			texture.magFilter = THREE.LinearMipMapLinearFilter;
			texture.minFilter = THREE.LinearMipMapLinearFilter;

			var fog = new THREE.Fog(0x4584b4, -100, 3000);

			material = new THREE.MeshShaderMaterial({

				uniforms : {

					"map" : {
						type : "t",
						value : 2,
						texture : texture
					},
					"fogColor" : {
						type : "c",
						value : fog.color
					},
					"fogNear" : {
						type : "f",
						value : fog.near
					},
					"fogFar" : {
						type : "f",
						value : fog.far
					},

				},
				vertexShader : document.getElementById('vs').textContent,
				fragmentShader : document.getElementById('fs').textContent,
				depthTest : false

			});

			var plane = new THREE.Mesh(new THREE.Plane(64, 64));

			for (i = 0; i < 8000; i++) {

				plane.position.x = Math.random() * 1000 - 500;
				plane.position.y = -Math.random() * Math.random() * 200 - 15;
				plane.position.z = i;
				plane.rotation.z = Math.random() * Math.PI;
				plane.scale.x = plane.scale.y = Math.random() * Math.random()
						* 1.5 + 0.5;

				GeometryUtils.merge(geometry, plane);

			}

			mesh = new THREE.Mesh(geometry, material);
			scene.addObject(mesh);

			mesh = new THREE.Mesh(geometry, material);
			mesh.position.z = -8000;
			scene.addObject(mesh);

			renderer = new THREE.WebGLRenderer({
				antialias : false
			});
			renderer.setSize(window.innerWidth, window.innerHeight);
			container.appendChild(renderer.domElement);

			document.addEventListener('mousemove', onDocumentMouseMove, false);
			window.addEventListener('resize', onWindowResize, false);

		}

		function onDocumentMouseMove(event) {

			mouseX = (event.clientX - windowHalfX) * 0.25;
			mouseY = (event.clientY - windowHalfY) * 0.15;

		}

		function onWindowResize(event) {

			camera.aspect = window.innerWidth / window.innerHeight;
			camera.updateProjectionMatrix();

			renderer.setSize(window.innerWidth, window.innerHeight);

		}

		function animate() {

			requestAnimationFrame(animate);
			render();

		}

		function render() {

			position = ((new Date().getTime() - start_time) * 0.03) % 8000;

			camera.position.x += (mouseX - camera.target.position.x) * 0.01;
			camera.position.y += (-mouseY - camera.target.position.y) * 0.01;
			camera.position.z = -position + 8000;

			camera.target.position.x = camera.position.x;
			camera.target.position.y = camera.position.y;
			camera.target.position.z = camera.position.z - 1000;

			renderer.render(scene, camera);

		}

		function changeImg() {
			$("#authImage").attr('src', './getAuthImage?date=' + new Date());
		}

		function validateWordSize(val) {
			if (val.length >= 4) {
				validateImg();
			}
		}
		
		function validateImg() {
			
			$
					.ajax({
						type : "get",
						url : "./validateAuthImage",
						dataType : 'json',
						async : false,
						data : {
							authImageText : $("#authImageText").val(),
						},
						success : function(json) {
							var returnnum = json["code"];
							if (returnnum == '0') {
								$("#authImageReturn")
										.html(
												"<img src=\"../zykyNew/res/images/left/reg-menu.gif\"  />");
								ifvalidateImg = true;
							} else {
								$("#authImageReturn").html("验证码错误");
								ifvalidateImg = false;
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
		function userLogin_btn_bak(){
		window.location.href="pages/main/main.jsp";
		}
		 function userLogin_btn(){
		
		
		 

		 if(ifvalidateImg==true){
		
		$("#form-signin").submit();
		} 
		else{alert("请重新输入验证码！");} 
	
		
		
		} 
	</script>


	<div id="content" class="center" style="">
		<img style="margin:0px 120px 50px 0px;width:300px"
			src="./res/images/logo.png"></img>
		<form id="form-signin" class="form-signin" action="userLogin"
			method="post">
			<div>
				<input class="form-control" type="text" name="login_name" autofocus
					placeholder="邮箱/手机号">
			</div>
			<div>
				<br> <input class="form-control" type="password" name="pwd"
					placeholder="密    码">
			</div>
			<div style="margin:-20px 0 0 230px;width:60px;">
				<a href="./pages/user/userForgetPwd.jsp"><font size=1>忘记密码</font>
				</a>
			</div>

			<div style="margin:20px 0 0 0px;">
				<input class="form-control" placeholder="验证码" style="float:left;"
					type="text" id="authImageText"
					onkeyup="javascript:validateWordSize(this.value)">
			</div>
			<div style="">
				<img style="width:80px;height:30px;margin:-32px 0 0 218px;" alt=""
					name="authImage" id="authImage" src="./getAuthImage"
					onclick="javascript:changeImg()"> <a
					href="javascritp:void(0);" onclick="javascript:changeImg()"
					style="color:white;"> <label style="float:left;color:white;"></label>
				</a>

				<div style="color:red;float:left;" id="authImageReturn"></div>
			</div>
			<div>
				<br> <br> <input class="button btn-blue login"
					type="button" onclick="userLogin_btn()"value="登录"><br>
				<input class="button btn-blue login" type="button" name="jump"
					value="注册" onclick="location.href='./pages/login/regist.jsp'" />
			</div>
	</div>
	<div class="reg_footbox"
		style="width:100%;height:15%;margin:0 0 0 -9px;">
		<p>
			<span>COPYRIGHT&nbsp;©&nbsp;2016 – 2016 SinoCBD. ALL RIGHTS
				RESERVED. </span> 中云开源数据技术(上海)有限公司版权所有
		</p>
		<p>沪ICP证000000号&nbsp;经营许可证编号:沪网文[2016]0000-000号</p>
	</div>
	</form>

</body>
</html>
