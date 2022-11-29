<!-- 상품 목록에서 삭제 -->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>?</title>
</head>
<body>

	<%@include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	PreparedStatement pstmt = null;
	Statement stmt = null;
	
	try {
		String sql = "delete from product where pname=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("pname"));
		pstmt.executeUpdate();
	}
	
	catch(SQLException ex) {
		out.print("SQLException : " + ex.getMessage());
	}
	
	finally {
		if (pstmt != null) pstmt.close();
		if (stmt != null) stmt.close();
		if (conn != null) conn.close();
		response.sendRedirect("ProductSelectAll.jsp");
	}
%>
	
</body>
</html>