<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--우리가 만든 클래스 사용 --%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.SHA256Util" %>
<%--javascript문장을 작성하기 위해 사용 --%>
<%@ page import="java.io.PrintWriter"%>
<%--건너오는 모든 데이터를 utf-8으로 받음 --%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%--자바빈즈를 활용하여 이 페이지안에 넘어온 id와 password가 담기게 됨, scope:데이터를 다룰 영역 --%>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		/*이미 로그인 되어있는 경우 로그인 페이지에 접속할 수 없도록 함*/
		String userID = null;
		
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href='e_main.jsp'");
			script.println("</script>");
		}
		/*로그인 안되어있는 경우*/
		UserDAO userDAO = new UserDAO();
		String salt = userDAO.getSaltById(user.getUserID());
		String password = user.getUserPassword();		
		password = SHA256Util.getEncrypt(password, salt);
		user.setUserPassword(password);
		
		int result = userDAO.login(user.getUserID(), password); //-1~1사이의 결과가 담기게됨
		if (result == 1) {
			session.setAttribute("userID", user.getUserID()); //로그인에 성공한 회원에게 세션ID 부여
			PrintWriter script = response.getWriter(); //스크립트 문장을 넣을수 있게함
			script.println("<script>");
			script.println("location.href='e_main.jsp'");
			script.println("</script>");
		}
		if (result == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()"); //이전페이지로 사용자를 돌려보냄. 즉, 다시 로그인페이지로 돌려보냄
			script.println("</script>");
		}
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디 입니다.')");
			script.println("history.back()"); //이전페이지로 사용자를 돌려보냄. 즉, 다시 로그인페이지로 돌려보냄
			script.println("</script>");
		}
		if (result == -2) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()"); //이전페이지로 사용자를 돌려보냄. 즉, 다시 로그인페이지로 돌려보냄
			script.println("</script>");
		}
	%>
</body>
</html>