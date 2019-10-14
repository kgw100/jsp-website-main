<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/main.css">
<!-- jquery를 이용한 원하는 태그(위치)로 스크롤 이동 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	function fnMove(seq) {
		var offset = $("#div" + seq).offset();
		$('html, body').animate({
			scrollTop : offset.top
		}, 400);
	}
</script>
<title>안녕하세요. EMOTE입니다.</title>
</head>
<body>
	<%
		/*로그인 한 사람(session정보가 존재하는 사람)의 session ID를 userID변수에 넣기*/
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	<!-- 모바일 버전 -->
		<div class="head">

<div class="logo_and_menu">
<div class="menubar">
<ul>
<li><a href="emoteNotice.jsp">공지사항</a>
<ul></ul></li>
<li><a href="#">IT소식</a>
<ul>
<li><a href="emoteITarticle1.jsp">기사</a></li>
</ul></li>
<li><a href="#">개발분야</a>
<ul>
<li><a href="emoteDevelopmentField1.jsp">WEB</a></li>
<li><a href="emoteDevelopmentField2.jsp">APPLICATION</a></li>
<li><a href="emoteDevelopmentField3.jsp">DB</a></li>
<li><a href="emoteDevelopmentField4.jsp">ALGORITHM</a></li>
<li><a href="emoteDevelopmentField5.jsp">OS</a></li>
</ul></li>

<li><a href="#">커뮤니티</a>
<ul>
<li><a onclick="location='e_main.jsp#div1';" style="cursor: pointer;">소개</a></li>
<li><a href="emoteCommunity1.jsp">졸업생 게시판</a></li>
<li><a href="emoteCommunity2.jsp">재학생 게시판</a></li>
</ul></li>
<li><a href="emoteMeeting.jsp">회의록</a>
<ul></ul></li>
</ul>
</div>
</div>
</div>
	<div class="head2">

		<table class="logo_and_menu">
			<tr>
				<td>
					<div class="main_logo">
						<a href="e_main.jsp"><img src="../image/emote_home.png" alt="이모트로고"></a>
					</div>
				</td>
				<td>
					<div class="main_menu">
						<div class="menubar">
							<ul>
								<li><a href="emoteNotice.jsp">공지사항</a>
									<ul></ul>
								</li>
								<li><a href="#">IT소식</a>
									<ul>
										<li><a href="emoteITarticle1.jsp">기사</a></li>
									<!-- 	<li><a href="emoteITarticle2.jsp">유용 사이트</a></li> -->
									</ul>
								</li>
								<li><a href="#">개발분야</a>
									<ul>
										<li><a href="emoteDevelopmentField1.jsp">WEB</a></li>
										<li><a href="emoteDevelopmentField2.jsp">APPLICATION</a></li>
										<li><a href="emoteDevelopmentField3.jsp">DB</a></li>
										<li><a href="emoteDevelopmentField4.jsp">ALGORITHM</a></li>
										<li><a href="emoteDevelopmentField5.jsp">OS</a></li>
									</ul>
								</li>

								<li><a href="#">커뮤니티</a>
									<ul>
										<li><a onclick="location='e_main.jsp#div1';" style="cursor: pointer;">소개</a></li>
										<li><a href="emoteCommunity1.jsp">졸업생 게시판</a></li>
										<li><a href="emoteCommunity2.jsp">재학생 게시판</a></li>
									</ul>
								</li>
								<li><a href="emoteMeeting.jsp">회의록</a>
									<ul></ul>
								</li>
							</ul>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
	
		<div class="home">
		<%
			if (userID == null) {
		%>
		<a href="../index.jsp">HOME</a>&ensp;|&ensp;<a href="login.jsp">LOGIN</a>&emsp;		
		<%
			} else {
		%><%=session.getAttribute("userID")%>님 환영합니다.<br/>
		<a href="../index.jsp">HOME</a>&ensp;|&ensp;<a href="logoutAction.jsp">LOGOUT</a>&emsp;
		<%
			}
		%>
	</div>
	<div class="background">
		<img src="../image/메인_emote.jpeg" alt="">
	</div>
	
	
	<div class="introduction" id="div1">
		<span>INTRODUCTION</sapn><br /> <br />
			<div class="gray_font">
				Mobile App, Web app을 주로 개발하고 있으며 공모전 수상을 목표로 하며<br /> 관심분야에 따라
				Algorithm, Block Chain, Machine Learning, Embedded system 분야를 공부하기도
				합니다.<br /> <br /> <br />
			</div> <span>ACTIVITY</span><br /> <br />
			<div class="gray_font">
				'14' 임베디드 소프트웨어 경진대회 휴머노이드 부분 최우수상, 임베디드 소프트웨어 시스템산업 협회<br />
				'14' Naver D2 Fest 결승 진출<br /> <br /> '16' Software Maestro BEST10 인증,
				미래창조과학부 장관상<br /> ‘16' 제2회 미래상상제품 아이디어 공모전 장려상, (재)인천경제산업정보테크노파크원장<br />
				<br /> <br /> '17' 제3회 AI tutor 챗봇 메이커톤
				최우수상, 강원창조경제혁신센서 센터장<br /> '17' ICT융합서비스 개발 경진대회 우수상, 한국관광공사 ICT
				융합실장<br /> <br /> ‘18' 병역정보 공공데이터 활용 공모전 최우수상, 병무청장
			</div>
	</div>
	

	<!-- bottom logo and tel -->
	<div class="logo_and_tel">
		<div class="bottom_logo">
			<img class="bottom_logo_img" src="../image/emoteLogo_gray.png" alt="bottomLoge_gray">
		</div>
		<div class="bottom_tel">
			강원도 원주시 연세대길1 창조관 164<br /> TEL. 010-6554-3886
		</div>
	</div>
	
	
	<%--애니메이션 담당--%>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>