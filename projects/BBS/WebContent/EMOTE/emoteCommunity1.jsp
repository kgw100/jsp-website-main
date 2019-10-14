<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="emoteCommunity1.EmoteCommunity1DAO"%>
<%@ page import="emoteCommunity1.EmoteCommunity1"%>

<%--게시판 목록출력위함 --%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/main.css">

<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		/*로그인 한 사람(session정보가 존재하는 사람)의 session ID를 userID변수에 넣기*/
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
	%>
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
				<a href="e_main.jsp"><img src="../image/emote_home.png" alt="이모트로고"
></a>
			</div>
			</td>
			<td>
			<div class="main_menu">
				<div class="menubar">
					<ul>
						<li><a href="emoteNotice.jsp">공지사항</a>
							<ul></ul></li>
						<li><a href="#">IT소식</a>
							<ul>
								<li><a href="emoteITarticle1.jsp">기사</a></li>
								<!-- <li><a href="emoteITarticle2.jsp">유용 사이트</a></li> -->
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
		</td>
		</tr>
	</table>
	</div>

	<div class="home">
			<%
				if (userID == null) {
			%>
			<a href="../index.jsp">HOME</a> | <a href="login.jsp">LOGIN</a>
			<%
				} else {
			%>
			<a href="../index.jsp">HOME</a> | <a href="logoutAction.jsp">LOGOUT</a>
			<%
				}
			%>
		</div>
	<!-- 배경사진 -->
	<div class="background">
		<img src="../image/커뮤니티1_emote.png" alt="">
	</div>


	<!-- 게시판 -->
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd; margin-top: 50px;">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
					EmoteCommunity1DAO bbsDAO = new EmoteCommunity1DAO();
						ArrayList<EmoteCommunity1> list = bbsDAO.getList(pageNumber);
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=list.get(i).getBbsID()%></td>
						<td><%=list.get(i).getBbsUserID()%></td>
						<!-- replaceAll해주는 이유 :cross site scripting해킹에 대한 방지  -->
						<td><div class="bbs"><a href="./bbs_emoteCommunity1/view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
						.replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></a></div></td>
						<td><%=list.get(i).getBbsDate().substring(0, 11)%></td>
					</tr>

					<%
						}
					%>
				</tbody>
			</table>
			<%
				if (pageNumber != 1) { //1페이지가 아니라면
			%>
			<a href="emoteCommunity1.jsp?pageNumber=<%=pageNumber - 1%>"
				class="btn btn-success btn-arraw-left">이전</a>
			<%
				}
				if (bbsDAO.nextPage(pageNumber + 1)) { //다음페이지가 있다면
			%>
			<a href="emoteCommunity1.jsp?pageNumber=<%=pageNumber + 1%>"
				class="btn btn-success btn-arraw-left">다음</a>
			<%
				}
			%>
			<a href="bbs_emoteCommunity1/write.jsp" class="btn btn-success pull-right">글쓰기</a>
		</div>
	</div>


	<!-- bottom logo and tel -->
	<div class="logo_and_tel">
		<div class="bottom_logo">
			<img  class="bottom_logo_img" src="../image/emoteLogo_gray.png" alt="emoteLoge_gray">
		</div>
		<div class="bottom_tel">
			강원도 원주시 연세대길1 창조관 164호<br /> TEL. 010-6554-3886 <br>
		</div>
	</div>
	<%--애니메이션 담당--%>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>