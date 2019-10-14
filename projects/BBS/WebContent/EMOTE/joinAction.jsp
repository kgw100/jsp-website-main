<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--우리가 만든 클래스 사용 --%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.SHA256Util" %>
<%@ page import="java.security.*"%>
<%--javascript문장을 작성하기 위해 사용 --%>
<%@ page import="java.io.PrintWriter"%>
<%--건너오는 모든 데이터를 utf-8으로 받음 --%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<%--자바빈즈를 활용하여 이 페이지안에 넘어온 id와 password가 담기게 됨, scope:데이터를 다룰 영역 --%>
<jsp:useBean id="user" class="user.User" scope="session" />
<jsp:setProperty name="user" property="userID" param="userID" />
<jsp:setProperty name="user" property="userPassword" param="userPassword"/>
<jsp:setProperty name="user" property="userEmail" param="userEmail" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		/*이미 로그인 되어있는 경우 회원가입 페이지에 접속할 수 없도록 함*/
		String userID = null;
		String userPassword = null;
		String userEmail = null;
		
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('현재 로그인 상태입니다.')");
			script.println("location.href='e_main.jsp'");
			script.println("</script>");
		}
		/*로그인 안되어있는 경우*/
	 	String salt = SHA256Util.generateSalt();
		user.setUserSalt(salt);
		String rePassword = request.getParameter("reUserPassword");
		String Password = request.getParameter("userPassword");
		Password = SHA256Util.getEncrypt(Password,salt);
		rePassword = SHA256Util.getEncrypt(rePassword, salt);
	 	user.setUserPassword(Password);
		String join_key = request.getParameter("join_key");
		
		
		if (user.getUserID() == null || user.getUserPassword() == null || user.getUserEmail() == null
				|| rePassword == "" || join_key == "") {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()"); //이전페이지로 사용자를 돌려보냄. 즉, 다시 로그인 페이지로 돌려보냄
			script.println("</script>");
		} 
		if (!join_key.equals("emote"))
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('인증 키가 올바르지 않습니다.')");
			script.println("history.back()"); //이전페이지로 사용자를 돌려보냄. 즉, 다시 로그인페이지로 돌려보냄
			script.println("</script>");
		}
		/* !user.getUserPassword().equals(newrePassword) */
		if (!Password.equals(rePassword)) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 일치하지 않습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		if(join_key.equals("emote")){
			UserDAO userDAO = new UserDAO();  //데이터베이스에 접근할수 있는 객체 생성
			int result = userDAO.search(userID); 
			if (result == -1) {
				PrintWriter script = response.getWriter(); //스크립트 문장을 넣을수 있게함
				script.println("<script>");
				script.println("alert('이미 존재하는 회원입니다.')");
				script.println("history.back()"); //이전페이지로 사용자를 돌려보냄. 즉, 다시 로그인페이지로 돌려보냄
				script.println("</script>");
			} else {
				session.setAttribute("userID", user.getUserID()); //회원가입에 성공한 회원에게 세션ID 부여 */
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='emailSendAction.jsp';");
				script.println("</script>");
			}
		}
	%>
</body>
</html>