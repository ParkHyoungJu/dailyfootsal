<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>home.html</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="description" content="Fullscreen Background Image Slideshow with CSS3 - A Css-only fullscreen background image slideshow" />
	<meta name="keywords" content="css3, css-only, fullscreen, background, slideshow, images, content" />
	<meta name="author" content="Codrops" />
<!-- Icons -->
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/shortcut_ball.png">
<link rel="apple-touch-icon-precomposed" href="144_ball">
<meta property="og:image" content="200_ball.jpeg" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/demo.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/style1.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/modernizr.custom.86080.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.1.1.js"></script>
<style>
.modalDialog {
	position: fixed;
	font-family: Arial, Helvetica, sans-serif;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background: rgba(0,0,0,0.8);
	z-index: 99999;
	opacity:0;
	-webkit-transition: opacity 400ms ease-in;
	-moz-transition: opacity 400ms ease-in;
	transition: opacity 400ms ease-in;
	pointer-events: none;
}
.modalDialog:target {
	opacity:1;
	pointer-events: auto;
}

.modalDialog > div {
	width: 400px;
	position: relative;
	margin: 10% auto;
	padding: 5px 20px 13px 20px;
	border-radius: 10px;
	background: #fff;
	background: -moz-linear-gradient(#fff, #999);
	background: -webkit-linear-gradient(#fff, #999);
	background: -o-linear-gradient(#fff, #999);
}
.close {
	background: #606061;
	color: #FFFFFF;
	line-height: 25px;
	position: absolute;
	right: -12px;
	text-align: center;
	top: -10px;
	width: 24px;
	text-decoration: none;
	font-weight: bold;
	-webkit-border-radius: 12px;
	-moz-border-radius: 12px;
	border-radius: 12px;
	-moz-box-shadow: 1px 1px 3px #000;
	-webkit-box-shadow: 1px 1px 3px #000;
	box-shadow: 1px 1px 3px #000;
}

.close:hover { background: #00d9ff; }

input {
    width: 100%;
}
</style>
</head>
<body id="page">
	<ul class="cb-slideshow">
	            <li><span>Image 01</span><div><h3>re·lax·a·tion</h3></div></li>
	            <li><span>Image 02</span><div><h3>qui·e·tude</h3></div></li>
	            <li><span>Image 03</span><div><h3>bal·ance</h3></div></li>
	            <li><span>Image 04</span><div><h3>e·qua·nim·i·ty</h3></div></li>
	</ul>
	<div class="container">
	<!-- Codrops top bar -->
        <div class="codrops-top">
            <a href="http://tympanus.net/Development/RockingLetters/">
                <strong>&laquo; Previous Demo: </strong>Rocking Letters with CSS3 &amp; jQuery
            </a>
            <span class="right">
            	<c:choose>
            		<c:when test="${not empty id }">
            			<a href="">${id }님 로그인</a>
            			<a href="logout.do">logout</a>
            		</c:when>
            		<c:otherwise>
            			<a id="login" href="#openModal">Login</a>
                		<a id="signup" href="#openModal2">Sign_up</a>
            		</c:otherwise>
            	</c:choose>
                
            </span>
            <div class="clr"></div>
        </div><!--/ Codrops top bar -->
        <header>
            <h1>All of <span>DailyFootsal</span></h1>
            <h2>Genius is one percent inspiration, ninety-nine percent perspiration</h2>
			<p class="codrops-demos">
				<a href="javascript:" class="current-demo">1</a>
				<a href="javascript:">2</a>
				<a href="javascript:">3</a>
				<a href="map.html">Map</a>
			</p>
        </header>
	</div>
	<div class="modalDialog" id="openModal" style="display:none">
	 	<div>
	 		<a href="#close" title="Close" class="close">X</a>
	 		<form id="loginForm" method="post">
	 			<label for="id">id</label>
	 			<input type="text" id="id" name="id" /><br />
	 			<label for="pwd">password</label>
	 			<input type="text" id="pwd" name="pwd" />
	 			<button type="submit">login</button>
	 		</form>
	 	</div>
	</div>

	<div class="modalDialog" id="openModal2" style="display:none">
	 	<div>
	 		<a href="#close" title="Close" class="close">X</a>
	 		<form action="signup.do" method="post">
	 			<label for="id">id</label>
	 			<input type="text" id="id" name="id" /><br />
	 			<label for="pwd">password</label>
	 			<input type="text" id="pwd" name="pwd" />
	 			<label for="name">name</label>
	 			<input type="text" id="name" name="name" />
	 			<button type="submit">signup</button>
	 		</form>
	 	</div>
	</div>
	
<script>
	$(".codrops-demos > a").click(function(){
		$(this).addClass("current-demo").siblings().removeClass("current-demo");
	});
	
	$("#login").click(function(){
		if($("#openModal").css("display")=="none"){
			$("#openModal").css("display","block");
		}
	});
	$("#signup").click(function(){
		if($("#openModal2").css("display")=="none"){
			$("#openModal2").css("display","block");
		}
	});
	$("#loginForm").submit(function(){
		var form = $(this).serialize();
		$.ajax({
			url: "login.do",
			method: "post",
			data: form,
			success:function(data){
				console.log(data);
				if(data.msg){
					alert($("#id").val()+"님 로그인 성공!!");
					$("#openModal").css("display","none");
					location.reload();
				}else{
					alert("아이디 비밀번호를 확인해주세요!!");
				}
			}
		});
		return false;
	});
</script>
</body>
</html>