<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="ycertCommunity2.EmoteCommunity2"%>
<%@ page import="ycertCommunity2.EmoteCommunity2DAO"%>
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
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID")); //게시글 번호가져오기
		}
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href='../Community2.jsp'");
			script.println("</script>");
		}
		EmoteCommunity2 bbs = new EmoteCommunity2DAO().getBbs(bbsID);
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
						<a href="main.jsp"><img src="../../image/ycert_home.png"
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
										<li><a onclick="location='../main.jsp#div1';"
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
		<img src="../../image/커뮤니티2_ycert.png" alt="">
	</div>


	<!-- 게시판 -->
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd; margin-top: 30px;">
				<thead>
					<tr>
						<th colspan="3"
							style="background-color: #eeeeee; text-align: center;">게시판 글
							보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%">글 제목</td>
						<td colspan="2"><%=bbs.getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>")%></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%=bbs.getBbsUserID()%></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%=bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시" + bbs.getBbsDate().substring(14, 16)+"분"%></td>
					</tr>
					<tr>
						<td>내용</td>
						<!-- replaceAll해주는 이유 :cross site scripting해킹에 대한 방지  -->
						<td colspan="2" style="min-height: 200px; text-align:left;"><%=bbs.getBbsContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>")%></td>
					</tr>
				</tbody>
			</table>
			<a href="../Community2.jsp" class="btn btn-success">목록</a>
			<% if(userID != null && userID.equals(bbs.getBbsUserID())) {%>
			<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-success">수정</a>
			<a onclick="return confirm('해당 글을 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-success">삭제</a>
			<% } %>
		</div>
	</div>


	<!-- bottom logo and tel -->
	<div class="logo_and_tel">
		<div class="bottom_logo">
			<img class="bottom_logo_img" src="../../image/ycertLogo_gray.png"
				alt="bottomLoge_gray">
		</div>
		<div class="bottom_tel">
			강원도 원주시 연세대길1 창조관 164<br /> TEL. 010-1234-1234
		</div>
	</div>
	
	<%--애니메이션 담당--%>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>