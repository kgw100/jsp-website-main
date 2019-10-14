<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"> 
<!-- <meta name="viewport" content="width=device-width"> -->
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
<title>안녕하세요. Y-CERT에 오신 것을 환영합니다.</title>
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
<li><a href="Notice.jsp">공지사항</a>
<ul></ul></li>
<li><a href="#">IT소식</a>
<ul>
<li><a href="ITarticle1.jsp">기사</a></li>
</ul></li>
<li><a href="#">개발분야</a>
<ul>
<li><a href="DevelopmentField1.jsp">WEB HACKING</a></li>
<li><a href="DevelopmentField2.jsp">SYSTEM HACKING</a></li>
<li><a href="DevelopmentField3.jsp">IOT HACKING</a></li>
<li><a href="DevelopmentField4.jsp">REVERSING</a></li>
<li><a href="DevelopmentField5.jsp">DIGITAL FORENSIC</a></li>
</ul></li>

<li><a href="#">커뮤니티</a>
<ul>
<li><a onclick="location='y_main.jsp#div1';" style="cursor: pointer;">소개</a></li>
<li><a href="Community1.jsp">졸업생 게시판</a></li>
<li><a href="Community2.jsp">재학생 게시판</a></li>
</ul></li>
<li><a href="Meeting.jsp">회의록</a>
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
						<a href="y_main.jsp"><img src="../image/ycert_home.png"
							alt="이모트로고"></a>
					</div>
				</td>
				<td>
					<div class="main_menu">
						<div class="menubar">
							<ul>
								<li><a href="Notice.jsp">공지사항</a>
									<ul></ul></li>
								<li><a href="#">IT소식</a>
									<ul>
										<li><a href="ITarticle1.jsp">기사</a></li>
										<!-- <li><a href="ITarticle2.jsp">유용 사이트</a></li> -->
									</ul></li>
								<li><a href="#">개발분야</a>
									<ul>
										<li><a href="DevelopmentField1.jsp">WEB HACKING</a></li>
										<li><a href="DevelopmentField2.jsp">SYSTEM HACKING</a></li>
										<li><a href="DevelopmentField3.jsp">IOT HACKING</a></li>
										<li><a href="DevelopmentField4.jsp">REVERSING</a></li>
										<li><a href="DevelopmentField5.jsp">DIGITAL FORENSIC</a></li>
									</ul></li>

								<li><a href="#">커뮤니티</a>
									<ul>
										<li><a onclick="fnMove(1)" style="cursor: pointer;">소개</a></li>
										<li><a href="Community1.jsp">졸업생 게시판</a></li>
										<li><a href="Community2.jsp">재학생 게시판</a></li>
									</ul></li>
								<li><a href="Meeting.jsp">회의록</a>
									<ul></ul></li>
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
		<a href="../index.jsp">HOME&ensp;|</a><a href="login.jsp">&ensp;LOGIN&emsp;</a>		
		<%
			} else {
		%><%=session.getAttribute("userID")%>님 환영합니다.<br/>
		<a href="../index.jsp">HOME</a> | <a href="logoutAction.jsp">LOGOUT</a>
		<%
			}
		%>
	</div>
	<div class="background">
		<img src="../image/메인_ycert.png" alt="">
	</div>



	<div class="introduction" id="div1">
		<span>INTRODUCTION</sapn><br /> <br />
			<div class="gray_font">
				차세대 보안 인재로서 모의 해킹 시연, 해킹 기법 탐구를 바탕으로 한 매주 내부 세미나를 진행 중입니다.<br /> 외부적으로는
				개인 및 팀 역량 증진을 위해 국가 교육 프로그램 이수, 논문 게재, 프로젝트 수행, <br /> 정보보안 컨퍼런스 및
				세미나와 CTF 등에 참여하고 있습니다. 이러한 활동들을 통해 현업에서 <br /> 보안 실무자에게 직•간접적으로
				요구되는 정보보안전문가로서의 소양을 갖추는데 주력하고 있습니다.<br /> 팀원 개개인의 관심사에 따라 취약점 분석,
				디지털 포렌식 등 다양한 분야에 대한 학습과 연구를 진행 중입니다.<br /> <br /> <br />
			</div> <span>ACTIVITY</span><br /> <br />
			<div class="gray_font">
				2014.04 Y-CERT 동아리 창설<br /> 2014.11 국제범죄피해예방 대학생 SNS아이디어 공모전 입상<br />
				<br /> 2015~2017 KUCIS(대학정보보호동아리연합회) 활동<br /> 2015.7~2016.2 BOB 4기
				활동<br /> <br /> 2016.3 KITRI BOB 4기 BEST10(최고인재 선정) 장관상<br />
				2016.07~2017.02 BOB 5기 활동<br /> 2016.10 제1회 Y-CERT CTF 운영<br /> <br />
				2017.03 KITRI BOB 5기 GRAND PRIX<br/> ‘17' 차세대 보안리더 양성 프로그램 BEST15 특별상, 국군사이버사령관<br /> 2017.07~2018.03 BOB 6기 활동
				<br /> ‘17' 디지털포렌식 동계학술대회 우수논문상, 한국디지털포렌식학회 회장<br><br> 2018.08 차세대 핵심보안 전문인력 특별훈련 수료<br /> 2018.11 지역 대학 연합 아이디어
				공모전 장려상<br/>'18' KDFS 디지털 포렌식 챌린지 최우수상, 경찰청장 </br><br> '19' 2019FOUNDERS 블록체인 최우수상, 고려대학교 블록체인연구소-디센터유니버시티 <br>
			</div>
	</div>

		<!-- bottom logo and tel -->
	<div class="logo_and_tel">
		<div class="bottom_logo">
			<img class="bottom_logo_img" src="../image/ycertLogo_gray.png" alt="bottomLoge_gray">
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