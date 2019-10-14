<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="ycertDevelopmentField2.EmoteDevelopmentField2DAO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="../../css/bootstrap.css">
<link rel="stylesheet" href="../../css/main.css">


<title>JSP 게시판 웹 사이트</title>
</head>


<body>
	<%
		/*로그인 한 사람(session정보가 존재하는 사람)의 session ID를 userID변수에 넣기*/
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요한 서비스입니다.')");
			script.println("location.href='../login.jsp'");
			script.println("</script>");
				}
	%>
		<!-- 모바일 버전 -->
<div class="head">

<div class="logo_and_menu">
<div class="menubar">
<ul>
<li><a href="../Notice.jsp">공지사항</a>
<ul></ul></li>
<li><a href="#">IT소식</a>
<ul>
<li><a href="../ITarticle1.jsp">기사</a></li>
</ul></li>
<li><a href="#">개발분야</a>
<ul>
<li><a href="../DevelopmentField1.jsp">WEB HACKING</a></li>
<li><a href="../DevelopmentField2.jsp">SYSTEM HACKING</a></li>
<li><a href="../DevelopmentField3.jsp">IOT HACKING</a></li>
<li><a href="../DevelopmentField4.jsp">REVERSING</a></li>
<li><a href="../DevelopmentField5.jsp">DIGITAL FORENSIC</a></li>
</ul></li>

<li><a href="#">커뮤니티</a>
<ul>
<li><a onclick="location='../y_main.jsp#div1';" style="cursor: pointer;">소개</a></li>
<li><a href="../Community1.jsp">졸업생 게시판</a></li>
<li><a href="../Community2.jsp">재학생 게시판</a></li>
</ul></li>
<li><a href="../Meeting.jsp">회의록</a>
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
						<a href="y_main.jsp"><img src="../../image/ycert_home.png"
							alt="이모트로고"></a>
					</div>
				</td>
				<td>
					<div class="main_menu">
						<div class="menubar">
							<ul>
								<li><a href="../Notice.jsp">공지사항</a>
									<ul></ul></li>
								<li><a href="#">IT소식</a>
									<ul>
										<li><a href="../ITarticle1.jsp">기사</a></li>
										<!-- <li><a href="../ITarticle2.jsp">유용 사이트</a></li> -->
									</ul></li>
								<li><a href="#">개발분야</a>
									<ul>
										<li><a href="../DevelopmentField1.jsp">WEB HACKING</a></li>
										<li><a href="../DevelopmentField2.jsp">SYSTEM HACKING</a></li>
										<li><a href="../DevelopmentField3.jsp">IOT HACKING</a></li>
										<li><a href="../DevelopmentField4.jsp">REVERSING</a></li>
										<li><a href="../DevelopmentField5.jsp">DIGITAL
												FORENSIC</a></li>
									</ul></li>

								<li><a href="#">커뮤니티</a>
									<ul>
										<li><a onclick="location='../y_main.jsp#div1';"
											style="cursor: pointer;">소개</a></li>
										<li><a href="../Community1.jsp">졸업생 게시판</a></li>
										<li><a href="../Community2.jsp">재학생 게시판</a></li>
									</ul></li>
								<li><a href="../Meeting.jsp">회의록</a>
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
		<a href="#">HOME&ensp;|</a><a href="../login.jsp">&ensp;LOGIN&emsp;</a>
		<%
			} else {
		%>
		<a href="#">HOME</a> | <a href="../logoutAction.jsp">LOGOUT</a>
		<%
			}
		%>
	</div>


	<div class="background">
		<img src="../../image/개발2_ycert.png" alt="">
	</div>

	<!-- 게시판 -->
	<div class="container">
		<div class="row">
			<form method="post" action="writeAction.jsp">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd; margin-top: 30px;">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">게시판
								글쓰기 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="bbsTitle" maslength="50"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="bbsContent" maxlength="8192" style="height: 350px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-success pull-right" value="글쓰기">
			</form>
		</div>
	</div>


<!-- bottom logo and tel -->
	<div class="logo_and_tel">
		<div class="bottom_logo">
			<img class="bottom_logo_img" src="../../image/ycertLogo_gray.png"
				alt="bottomLoge_gray">
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