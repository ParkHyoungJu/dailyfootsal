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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
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
    display: inline;
}

.page1{
	-webkit-animation: pageAni 1s 1 linear;
	background-color:#FFFFFF;
	opacity: 0.9;
	height: 550px;
}
@-webkit-keyframes pageAni{
	0%{
		background-color:#000000;
		opacity: 0.1;
		height: 10px;
	}

	30%{
		background-color:#333333;
		opacity: 0.3;
		height: 100px;
	}
	50%{
		background-color:#666666;
		opacity: 0.5;
		height: 250px;
	}
	70%{
		background-color:#AAAAAA;
		opacity: 0.7;
		height: 350px;
	}
	100%{
		background-color:#FFFFFF;
		opacity: 0.9;
		height: 550px;
	}
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
            <a href="home.do">
                <i class="fa fa-futbol-o" aria-hidden="true"></i>
            </a>
            <span class="right">
            	<c:choose>
            		<c:when test="${not empty id }">
            			<a href="">${id }님 로그인</a>
            			<a href="javascript:logout()">logout</a>
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
				<a href="javascript:page1Click();">1</a>
				<a href="javascript:">2</a>
				<a href="javascript:">3</a>
				<a href="map.html">Map</a>
			</p>
        </header>
        <div id="p1">
        	<jsp:include page="page1.jsp"/>
        </div>
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

	<div class="modalDialog" id="openModal2" style="display:none;">
	 	<div>
	 		<a href="#close" title="Close" class="close">X</a>
	 		<form id="signupForm" action="signup.do" method="post">
	 			<label for="id">id</label>
	 			<input type="text" id="id" name="id"/><br />
	 			<label for="pwd">password</label>
	 			<input type="text" id="pwd" name="pwd" /><br />
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
	
	function logout(){
		if(confirm("로그아웃 하시겠습니까?") ==true){
			location.href="logout.do";
		}
	}
	$("#signupForm").submit(function(){
		var id =$("#openModal2 input#id").val();
		var pwd =$("#openModal2 input#pwd").val();
		var name =$("#openModal2 input#name").val();
		if(id == ""){
			alert("아이디를 입력하세요!");
			
			return false;
		}else if(pwd == ""){
			alert("비밀번호를 입력하세요");
			
			return false;
		}else if(name == ""){
			alert("이름을 입력하세요");
			
			return false;
		}
		$(this).submit();
	});
	$("#openModal2 input#id").keyup(function(){
		
		var id =$("#openModal2 input#id");
		
	
		$.ajax({
			url: "idCheck.do",
			type: "post",
			data: $("#signupForm").serialize(),
			success: function(data){
				id.siblings().remove("p");
				if(data.result){
					id.after("<p class='nosubmit' style='color: red;'>이미 가입된 아이디 입니다.</p>");
					
					
				}else{
					if(id.val()==""){
						id.after("<p class='nosubmit' style='color: red;'>아이디를 입력하세요.</p>");
					}else{
						id.after("<p style='color: green;'>사용 가능한 아이디입니다.</p>");
					}	
					
				}
			}
		});
		
		$("#signupForm").submit(false);
	});
	$("#openModal2 input#id").focusout(function(){
		if($("p").hasClass("nosubmit")){
			$("#openModal2 input#id").val("");
		}
	});
	
	function page1Click(){
		var page1 = $(".page1");
		if(page1.css("display") == "none"){
			$(".page1").show();
		}else{
			$(".page1").hide();
		}
	}
</script>
</body>
</html>