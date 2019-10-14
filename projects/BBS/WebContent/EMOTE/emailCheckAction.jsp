<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="user.SHA256Util"%>
<%@page import="user.UserDAO"%>
<%@ page import="javax.activation.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="user.User" scope="session" />

<%
	request.setCharacterEncoding("UTF-8");
	String code = request.getParameter("code");
	UserDAO userDAO = new UserDAO();
	String userID = user.getUserID();
    String key = user.getUserKey();
	String userEmail = user.getUserEmail();
	boolean rightCode = (key.equals(code)) ? true : false;
	if(rightCode == true) {
		user.setUserEmailHash(key);
		int result = userDAO.join(user); //-1~1사이의 결과가 담기게됨
		userDAO.setUserEmailChecked(userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이메일 인증 성공');");
		script.println("location.href = './emote_text.jsp';");
		script.println("</script>");
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 코드입니다. 다시 시도 해주세요.');");
		script.println("location.href = './join.jsp';");
		script.println("</script>");
	}
	
	%>	    
  