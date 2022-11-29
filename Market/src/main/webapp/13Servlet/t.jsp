<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>애너</h2>
	<p>
		<strong>${ message }</strong>
		<br>
		<a href="<%= request.getContextPath() %>/13Servlet/t.do">바로가기</a>	<!-- do(자바 클래스 호출) -->
	</p>
	
</body>
</html>