<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>JSP 게시판 웹 사이트 회원가입</title>
<style type="text/css">
#JOIN { /*제목*/
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
	font-size: 1.8vmin;
	opacity: 1;
}

input::-ms-input-placeholder {
	color: #7A7A7A;
}

input:-ms-input-placeholder {
	color: #7A7A7A;
}

.info_blank { /*정보입력칸(이메일칸제외)*/
	font-family: consolas;
	color: #41f200;
	font-size: 3vmin;
	padding-left: 1vmin;
	background-color: black;
	border: 0.4vmin solid #41f200;
	width: 40vmin;
}

#first {
	font-family: consolas;
	color: #41f200;
	font-size: 3vmin;
	padding-left: 1vmin;
	background-color: black;
	border: 0.4vmin solid #41f200;
	width: 22vmin;
}

#second {
	font-family: consolas;
	color: #41f200;
	font-size: 3vmin;
	padding-left: 1vmin;
	background-color: black;
	border: 0.4vmin solid #41f200;
	width: 22vmin;
}

#confirm { /*이메일인증*/
	border: 0.4vmin solid #33FFCC;
	color: #33FFCC;
	font-family: 휴먼엑스포;
	background-color: black;
	height: 4.4vmin;
	font-size: 1.5vmin;
	width: 10vmin;
	padding-top: 1vmin;
}

#done { /*완료*/
	border: 0.4vmin solid #33FFCC;
	color: #33FFCC;
	font-family: 휴먼엑스포;
	background-color: black;
	width: 8vmin;
	height: 4vmin;
	padding-bottom: 0vmin;
	font-size: 1.5vmin;
}
</style>
</head>
<body bgcolor="black">
	<br>
	<br>
	<br>
	<p id="JOIN">JOIN</p>

	<!--회원정보입력칸-->
	<form action="joinAction.jsp" method="post">
		<table align="center" cellpadding="8" cellspacing="4">
			<tr>
				<td class="font_style" align="right">ID:</td>
				<td><input class="info_blank" type="text" name="userID"
					maxlength="20" placeholder="ex)17홍길동"></td>
			</tr>
			<tr>
				<td class="font_style" align="right">PASSWORD:</td>
				<td><input class="info_blank" type="password"
					name="userPassword" minlength="6" maxlength="20" placeholder="Password(최소 6글자)"></td>
			</tr>
			<tr>
				<td class="font_style" align="right">REPASSWORD:</td>
				<td><input class="info_blank" type="password"
					name="reUserPassword" minlength="6" maxlength="20" placeholder="Password(최소 6글자)"></td>
			</tr>
			<tr>
			<td class="font_style" align="right">인증 키:</td>
				<td><input class="info_blank" type="password"
					name="join_key" maxlength="40" placeholder="key"></td>
			</tr>
			<tr>
				<td class="font_style" align="right">EMAIL:</td>
				<td><input class="info_blank" type="text" name="userEmail"
					maxlength="50" placeholder="ex) asd123@blahblah.com"></td>
			
			</tr>
			
			
		</table>
		<br>
		<table align="center">
			<tr>
				<td><input align="center" id="done" type="submit" name="done" value="DONE"
					style="cursor: pointer"></td>
			</tr>
		</table>

	</form>

	<%--애니메이션 담당--%>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>