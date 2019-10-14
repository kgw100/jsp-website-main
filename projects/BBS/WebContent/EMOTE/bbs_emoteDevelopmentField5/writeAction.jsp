<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="emoteDevelopmentField5.EmoteDevelopmentField5DAO"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<%--자바빈즈를 활용하여 이 페이지안에 넘어온 제목과 내용이 담기게 됨, scope:데이터를 다룰 영역 --%>
<jsp:useBean id="bbs" class="emoteDevelopmentField5.EmoteDevelopmentField5" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		/*로그인 한 사람(session정보가 존재하는 사람)의 ID를 userID변수에 넣기*/
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
			} else { /*로그인 되어있는경우*/
		if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()"); //이전페이지로 사용자를 돌려보냄. 즉, 다시 로그인페이지로 돌려보냄
			script.println("</script>");
		} else {
			EmoteDevelopmentField5DAO bbsDAO = new EmoteDevelopmentField5DAO(); //데이터베이스에 접근할수 있는 객체 생성
			int result = bbsDAO.write(bbs.getBbsTitle(), userID , bbs.getBbsContent()); //-1~1사이의 결과가 담기게됨
			if (result == -1) {
				PrintWriter script = response.getWriter(); //스크립트 문장을 넣을수 있게함
				script.println("<script>");
				script.println("alert('글쓰기에 실패했습니다.')");
				script.println("history.back()"); //이전페이지로 사용자를 돌려보냄. 즉, 다시 로그인페이지로 돌려보냄
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter(); //스크립트 문장을 넣을수 있게함
				script.println("<script>");
				script.println("location.href='../emoteDevelopmentField5.jsp'");
				script.println("</script>");
			}

		}
			}
	%>
</body>
</html>