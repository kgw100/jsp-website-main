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
      #FOR_PW{  /*제목*/
        text-align:center;
        font-size:6vmin;
        font-family:consolas;
        color:#41f200;
      }
      .font_style{
        color:#41f200;
        font-family:휴먼엑스포;
        font-size:3vmin;
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
      .info_blank{  /*정보입력칸(이메일칸제외)*/
        font-family:consolas;
        color:#41f200;
        font-size:3vmin;
        padding-left:1vmin;
        background-color:black;
        border:0.4vmin solid #41f200;
        width:26vmin;
        height:4vmin;
      }
      #first{
        font-family:consolas;
        color:#41f200;
        font-size:3vmin;
        padding-left:1vmin;
        background-color:black;
        border:0.4vmin solid #41f200;
        width:22vmin;
        height:4vmin;
      }
      #second{
        font-family:consolas;
        color:#41f200;
        font-size:3vmin;
        padding-left:1vmin;
        background-color:black;
        border:0.4vmin solid #41f200;
        width:22vmin;
        padding-top:0.3vmin;
        padding-bottom:0.3vmin;
      }
      #confirm{  /*이메일인증*/
        border:3px solid #33FFCC;
        color:#33FFCC;
        font-family:휴먼엑스포;
        background-color:black;
        height:4.8vmin;
        padding-top:1.4vmin;
        padding-bottom:0.7vmin;
        padding-left:1vmin;
        padding-right:1vmin;
        font-size:1.5vmin;
        width:10vmin;
      }
      #next{  /*다음단계로*/
        border:0.4vmin solid #33FFCC;
        color:#33FFCC;
        font-family:휴먼엑스포;
        background-color:black;
        width:11vmin;
        height:4.5vmin;
        font-size:1.8vmin;
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

    <!--제목부분-->
    <p id="FOR_PW">FOR FINDING PASSWORD</p>

    <!--학번, 이메일입력부분-->
    <form action="find_pw1Action.jsp" method="post">
      <table align="center" cellpadding="8">
        <tr>
          <td class="font_style" align="right">ID: </td>
          <td><input class="info_blank" type="text" name="userID" placeholder="ex) 17홍길동" maxlength="20"></td></tr>
        <tr>
          <td class="font_style" align="right">EMAIL: </td>
          <td><input class="info_blank" type="text" name="userEmail" placeholder="email_ID" maxlength="50"></td>
          <td><input id="confirm" type="submit" value="CONFIRM" style="cursor:pointer; text-decoration:none" href="@@이메일인증주소@@">CONFIRM</a></td></tr>
      </table><br>

      <table align="center"><tr><td><input id="next" type="submit" value="NEXT" style="cursor:pointer" onclick="location='find_pw2.jsp'"></td></tr></table>

    </form>
    
    
	<%--애니메이션 담당--%>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>