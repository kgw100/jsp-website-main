<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor" dir="ltr">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="stylesheet" type="text/css" href="./css/default.css" />
<link rel="stylesheet" type="text/css" href="./css/component.css" />	
<meta charset="UTF-8" />
<!-- <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"> -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
<script src="respond.min.js"></script>
<script src="html5shiv.js"></script>
<script src="js/modernizr.custom.js"></script>
<title> EMOCERT에 오신 것을 환영합니다.</title>
</head>


<body>
	<div class="container">
	<div id="sidebar"> 
		  <!-- 사이드 버튼 누를시 -->
    <br>
    <li ><a href="http://www.emocert.com" target="_blank">HOME</a></li>
    <br>
    <li ><a href="https://portal.yonsei.ac.kr/" target="_blank">연세 포탈</a></li>
    <br>
    <li ><a href="https://www.yonsei.ac.kr/wj/" target="_blank">연세대학교</a></li>
   <br>
     <li><a href="https://yscec.yonsei.ac.kr/"  target="_blank">YSCEC</a></li>
    <br>
    <li ><a href="http://ace-yw.yonsei.ac.kr" target="_blank">ACE 사업단</a></li>
   <br>
    <li ><a href="https://wjdorm.yonsei.ac.kr" target="_blank" >원주 생활관</a></li>
   <br>
    <li><a href="https://myjob.yonsei.ac.kr" target="_blank">Y-GEMS</a></li>
   <br>
    <li><a href="http://chat.emocert.com:3389" target="_blank">채팅</a></li>
    </div>
  <div class="overlay"></div>
			<header class="clearfix">
				<div class="inner">
					<!-- <h1>EMOCERT<span>with YONSEI univ.</span></h1> -->
					<img id="y_logo" src="image/yonsei_logo.png"/>
						<button id="sidebarCollapse"class="current-demo" style="background: #0E0BC3;size:0.6em;padding-left:0.3em;padding-right:0.3em;font-size:7vmin; cursor: pointer;">≡</button>
				</div>
				
			</header>
			  
			
			<section class="main">
			
			
						<div id="ac-wrapper" class="ac-wrapper">
					<h2>EMOCERT <span> EMOTE &amp; YCERT</span></h2>
					<div class="ac-device">
						<a href="#"><img src="image/bg_ipone2.png"/></a>
						<h3 class="ac-title"> 컴퓨터정보통신 학술 소모임</h3>
					</div>
					<div class="ac-grid">
						<a href="#"><img src="image/emote_ipone.png"/><span onclick="location.href='./EMOTE/e_main.jsp'">개발 소모임으로 Mobile App, Web app을 주로 개발하고 있으며 공모전 수상을 목표로 하며 관심분야에 따라	Algorithm, Block Chain, Machine Learning, 
						Embedded system 분야를 심화학습합니다.</span></a>
						<a href="#"><img src="image/ycert_ipone.png"/><span onclick="location.href='./YCERT/y_main.jsp'">차세대 보안 인재로서 모의 해킹 시연, 해킹 기법 탐구를 바탕으로 한 매주 내부 세미나를 진행 중입니다.외부적으로는
				개인 및 팀 역량 증진을 위해 국가 교육 프로그램 이수, 논문 게재, 프로젝트 수행, 정보보안 컨퍼런스 및
				세미나와 CTF 등에 참여하고 있습니다.관심분야에 따라 취약점 분석,디지털 포렌식 등 다양한 분야에 대한 학습과 연구를 진행 중입니다.</span></a>
					</div>
				</div>
				<p>Made by EMOCERT 2019</p>
					<img src="./image/메인_emote.jpeg" alt="" width=1 height=1>
<img src="./image/메인_ycert.png" alt="미리로딩" width=1 height=1 >
			</section>
		</div>
		<!-- /container -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script src="js/appshowcase.js"></script>
		<script type="text/javascript">
			$(function() {
				AppShowcase.init();
			});
			
			$('#sidebarCollapse').on('click', function () { //사이드바 애니메이션
			    $('#sidebar').addClass('active');
			    $('.overlay').fadeIn();
			});

			$('.overlay').on('click', function () {
			    $('#sidebar').removeClass('active');
			    $('.overlay').fadeOut();
			});
		</script>

</body>
</html>
    
