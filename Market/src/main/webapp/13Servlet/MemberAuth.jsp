<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>MVC 패턴으로 회원 인증</h2>
	<p>
		<strong>${ authMessage }</strong>
		<br>
		<a href="./MemberAuth.mvc?id=admin&pass=a">회원인증(관리자)</a>
		&nbsp;&nbsp;
		<a href="./MemberAuth.mvc?id=b&pass=b">회원인증(회원)</a>
		&nbsp;&nbsp;
		<a href="./MemberAuth.mvc?id=cc&pass=cc">회원인증(비회원)</a>
		&nbsp;&nbsp;
	</p>
	
</body>
</html>