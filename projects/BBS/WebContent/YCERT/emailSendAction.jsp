<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import= "javax.mail.PasswordAuthentication" %>
<%@page import="javax.activation.*"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="user2.UserDAO"%>
<%@page import="user2.SHA256Util"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="user2.User" scope="session" />
<%
UserDAO userDAO = new UserDAO();
String userID = user.getUserID();

boolean emailChecked = userDAO.getUserEmailChecked(userID);
if(emailChecked == true) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('이미 가입이 승인된 회원입니다.');");
	session.invalidate();
	script.println("location.href = './login.jsp'");
	script.println("</script>");
	return;
}

// 사용자에게 보낼 메시지를 기입합니다.
String host = "http://www.emocert.com:8080/YCERT/";
String from = "emocert@emocert.com";
String to = user.getUserEmail();
int i = (int)Math.floor(Math.random() * 1000000) + 1;
String key = Integer.toString(i);
String subject = "[YCERT 가입 이메일 인증]";// 이모트와 와이서트 에 따라 변경할 것 
String content = "다음 링크에 접속하면 이메일 인증이 진행됩니다." +	
"<a href='" + host + "emailCheckAction.jsp?code=" + key+ "'>이메일 인증하기</a>";

// SMTP에 접속하기 위한 정보를 기입합니다.
Properties p = new Properties();
p.put("mail.smtp.user", from);
p.put("mail.smtp.host", "smtps.hiworks.com");
p.put("mail.smtp.port", "465");
p.put("mail.smtp.starttls.enable", "true");
p.put("mail.smtp.auth", "true");
p.put("mail.smtp.debug", "true");
p.put("mail.smtp.socketFactory.port", "465");
p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
p.put("mail.smtp.socketFactory.fallback", "false");
 
try{
    Session ses = Session.getInstance(p, new javax.mail.Authenticator() { 
    	protected PasswordAuthentication getPasswordAuthentication() { 
    		return new PasswordAuthentication("emocert@emocert.com","emocert164164");
    }
    		
    });
   	user.setUserKey(key);//key 저장 
    ses.setDebug(true);
    MimeMessage msg = new MimeMessage(ses); 
    msg.setSubject(subject);
    Address fromAddr = new InternetAddress(from);
    msg.setFrom(fromAddr);
    Address toAddr = new InternetAddress(to);
    msg.addRecipient(Message.RecipientType.TO, toAddr);
    msg.setContent(content, "text/html;charset=UTF-8");
    Transport.send(msg);
} catch(Exception e){
    e.printStackTrace();
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('오류가 발생했습니다.');");
	script.println("history.back();");
	script.println("</script>");	
    return;
}

%>    
<!DOCTYPE html>
<html lang="kor" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/emailsend.css" />
    <title>이메일 보내기</title>
  </head>
  <body>
    <section>
      <!--for demo wrap-->
      <h1> [인증 메일 전송]</h1>
      <div class="tbl-header">
        <table cellpadding="0" cellspacing="0" border="0">
          <thead>
            <tr>
              <th>Message</th>
            </tr>
          </thead>
        </table>
      </div>
      <div class="tbl-content">
            <br>
          <div>&#62; 인증 메일이 전송되었습니다. <br>  회원 가입시 기입한 메일로 인증을 시도해주십시오. <br>(주의! 일부 이메일은 보안정책에 의해 스펨메시지함에 보내질 수 있으니 이 점을 유의해주십시오)</div>
      </div>
    </section>


    <!-- follow me template -->
    <div class="made-with-love">
      Made by EMOCERT 2019
    </div>
  </body>
</html>