<!-- 장바구니 수량 변경 -->

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
		ResultSet rs = null;
	 
	 	try {
			
			String sql = "update cart set countt=? where pname=?";
			pstmt = conn.prepareStatement(sql);
			
			if (request.getParameter("id").equals("minus")) {
				pstmt.setInt(1, Integer.parseInt(request.getParameter("count")) - 1);
			}
			else {
				pstmt.setInt(1, Integer.parseInt(request.getParameter("count")) + 1);
			}
			pstmt.setString(2, request.getParameter("pname"));
			pstmt.executeUpdate();
		}
		
		catch(SQLException ex) {
			out.print("SQLException : " + ex.getMessage());
		}
		
		finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
			if (rs != null) rs.close();
			response.sendRedirect("ProductCart.jsp");
		}
	 	
		
	 %>
	
</body>
</html>