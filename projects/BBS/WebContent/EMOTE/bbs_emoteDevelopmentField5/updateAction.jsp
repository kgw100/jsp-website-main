<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--우리가 만든 클래스 사용 --%>
<%@ page import="emoteDevelopmentField5.EmoteDevelopmentField5"%>
<%@ page import="emoteDevelopmentField5.EmoteDevelopmentField5DAO"%>
<%--javascript문장을 작성하기 위해 사용 --%>
<%@ page import="java.io.PrintWriter"%>
<%--건너오는 모든 데이터를 utf-8으로 받음 --%>
<%
	request.setCharacterEncoding("UTF-8");
%>


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
		}
		/*현재 글이 유효한 글인지 체크*/
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href='../emoteDevelopmentField5.jsp'");
			script.println("</script>");
		}
		EmoteDevelopmentField5 bbs = new EmoteDevelopmentField5DAO().getBbs(bbsID);
		if (!userID.equals(bbs.getBbsUserID())) { //한번 더 확인하기
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href='../emoteDevelopmentField5.jsp'");
			script.println("</script>");
		} else { /*수정 권한이 있는 사람이라면*/
			if (request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null
			|| request.getParameter("bbsTitle") == " " || request.getParameter("bbsContent") == " ") {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()"); //이전페이지로 사용자를 돌려보냄. 즉, 다시 로그인페이지로 돌려보냄
		script.println("</script>");
			} else {
				EmoteDevelopmentField5DAO bbsDAO = new EmoteDevelopmentField5DAO(); //데이터베이스에 접근할수 있는 객체 생성
		int result = bbsDAO.update(bbsID, request.getParameter("bbsTitle"), request.getParameter("bbsContent")); //-1~1사이의 결과가 담기게됨
		if (result == -1) {
			PrintWriter script = response.getWriter(); //스크립트 문장을 넣을수 있게함
			script.println("<script>");
			script.println("alert('글 수정에 실패했습니다.')");
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