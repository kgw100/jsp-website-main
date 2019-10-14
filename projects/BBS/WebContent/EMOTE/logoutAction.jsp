<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		//현재 이 페이지에 접속한 회원의 session ID를 빼앗아 로그아웃 시킴
		session.invalidate();
	%>
	<script>
		location.href = 'e_main.jsp';
	</script>
</body>
</html>