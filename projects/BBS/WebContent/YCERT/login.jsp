<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- script문장 실행을 위함--%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<title>JSP 게시판 웹 사이트 로그인</title>
   <style type="text/css">
      #LOGIN{  /*제목*/
        text-align:center;
        font-size:6vmin;
        font-family:consolas;
        color:#41f200;
      }
      input::placeholder{
        font-family:휴먼엑스포;
        color:#7A7A7A;
        font-size:2.5vmin;
        opacity:1;
      }
      input::-ms-input-placeholder {
        color: #7A7A7A;
      }
      input:-ms-input-placeholder {
        color: #7A7A7A;
      }
      .input_ID{  /*ID입력칸*/
        border:0.4vmin solid #41f200;
        padding-left:1vmin;
        color:#41f200;
        font-family:휴먼엑스포;
        font-size:3vmin;
        background-color:black;
        height:4vmin;
        width:36vmin;
      }
      .input_PW{  /*PW입력칸*/
        border:0.4vmin solid #41f200;
        padding-left:1vmin;
        color:#41f200;
        font-family:consolas;
        font-size:3vmin;
        background-color:black;
        height:4vmin;
        width:36vmin;
      }
      .login{  /*로그인버튼*/
        border:0.4vmin solid #33FFCC;
        color:#33FFCC;
        font-family:consolas;
        font-size:2vmin;
        background-color:black;
        height:4vmin;
        width:10vmin;
        padding-bottom:0.2vmin;
        cursor:pointer;
      }
      .below_bar{
        font-family:휴먼엑스포;
        font-size:1.6vmin;
        color:#41f200;
        align:center;
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
    <br><br><br><br><br>
      <!--제목-->
      <p id="LOGIN">LOGIN</p>

      <form action="loginAction.jsp" method="post">
        <table align="center" cellpadding="8"><tr>
          <td><input class="input_ID" type="text" name="userID" placeholder="ex) 17홍길동" maxlength="20" required></td>
        </tr><tr>
          <td><input class="input_PW" type="password" name="userPassword" placeholder="password" maxlength="20" required></td>
        </tr></table>

        <br>
        <table align="center"><tr>
          <td><input class="login" type="submit" name="login" value="login" align="center"></td>
        </tr></table>
      </form><br>

      <!--비밀번호찾기, 회원가입, 비회원접속-->
      <table align="center" cellpadding="8"><tr>
          <td><a class="below_bar" style="text-decoration:none;" href="#" onclick="alert('기능 점검중입니다. 관리자에게 문의하세요.');">비밀번호 찾기</td>
          <td><a class="below_bar" style="text-decoration:none;" href="join.jsp">회원가입</td>
          <td><a class="below_bar" style="text-decoration:none;" href="y_main.jsp">비회원 접속</td>
      </tr></table>
	<%--애니메이션 담당--%>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>