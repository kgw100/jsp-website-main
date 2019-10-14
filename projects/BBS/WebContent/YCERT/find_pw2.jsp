<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- script문장 실행을 위함--%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<title>EMOCERT에 오신것을 환영합니다.</title>
<style type="text/css">
#FOR_PW { /*제목*/
	text-align: center;
	font-size: 6vmin;
	font-family: consolas;
	color: #41f200;
}

.font_style {
	color: #41f200;
	font-family: 휴먼엑스포;
	font-size: 2.5vmin;
}

input::placeholder {
	font-family: 휴먼엑스포;
	color: #7A7A7A;
	font-size: 2.5vmin;
	opacity: 1;
}

input::-ms-input-placeholder {
	color: #7A7A7A;
}

input:-ms-input-placeholder {
	color: #7A7A7A;
}

.info_blank { /*정보입력칸*/
	font-family: consolas;
	color: #41f200;
	font-size: 3vmin;
	padding-left: 1vmin;
	background-color: black;
	border: 0.4vmin solid #41f200;
	width: 30vmin;
	height: 4vmin;
}

#done { /*완료*/
	border: 0.4vmin solid #33FFCC;
	color: #33FFCC;
	font-family: 휴먼엑스포;
	background-color: black;
	width: 8vmin;
	height: 4vmin;
	font-size: 1.7vmin;
}
</style>
</head>
<body bgcolor="black" link="#41f200" vlink="#41f200" alink="#FFFFFF">
	<%
		/*로그인 한 사람(session정보가 존재하는 사람)의 session ID를 userID변수에 넣기*/
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<!--제목부분-->
	<p id="FOR_PW">FOR FINDING PASSWORD</p>

    <!--새 비밀번호, 비밀번호 확인 입력부분-->
    <form action="find_pw2Action.jsp" method="post">
      <table align="center" cellpadding="8">
        <tr>
          <td class="font_style" align="right">NEW_PASSWORD: </td>
        <td><input class="info_blank" type="password" name="userPassword" maxlength="20" placeholder="new_password" required></td>
      </tr>
        <tr>
          <td class="font_style" align="right">REPASSWORD: </td>
        <td><input class="info_blank" type="password" name="reUserPassword" maxlength="20" placeholder="password" required></td>
      </tr>
        <td colspan="10"></td>
      </table><br>

      <!--버튼부분-->
      <table align="center"><tr><td><input id="done" type="submit" value="DONE" style="cursor:pointer"></td></tr></table>
    </form>


	<%--애니메이션 담당--%>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>