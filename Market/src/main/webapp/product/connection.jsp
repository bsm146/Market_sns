<!-- ? -->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>?</title>
</head>
<body>

<%
	Connection conn = null;

	try {
		String url = "jdbc:mysql://localhost:3306/jspWebMarket";
		String user = "root";
		String password = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
		out.print("데이터 베이스 연결 성공");
	}
	
	catch(SQLException ex) {
		out.print("데이터 베이스 연결 실패<br>");
		out.print("SQLException : " + ex.getMessage());
	}
	
	finally {
		if (conn != null) conn.close();
	}
%>

</body>
</html>