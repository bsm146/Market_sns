<!-- 장바구니 삭제 -->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.Product"%>
<%@page import="membership.ProductRepository"%>
<jsp:useBean id="productDAO" class="membership.ProductRepository" scope="session"></jsp:useBean>
<jsp:useBean id="productDTO" class="dto.Product" scope="session"></jsp:useBean>

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
		if (request.getParameter("pname") == null) {
			String sql = "delete from cart";
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		}
			
		else {
			out.print("개별");
			String sql = "delete from cart where pname=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("pname"));
			pstmt.executeUpdate();
		}
	}
	
	catch(SQLException ex) {
		out.print("SQLException : " + ex.getMessage());
	}
	
	finally {
		if (pstmt != null) pstmt.close();
		if (stmt != null) stmt.close();
		if (conn != null) conn.close();
		response.sendRedirect("ProductCart.jsp");
	}
	
%>
	
</body>
</html>