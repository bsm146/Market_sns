<!-- 장바구니 가기 전에 추가 -->

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

	String pname = request.getParameter("pname");
	String productID = request.getParameter("productID");
	int unitPrice = Integer.parseInt(request.getParameter("unitPrice"));
	int countt = Integer.parseInt(request.getParameter("countt"));
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		String sql = "select * from cart where pname=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pname);
		rs = pstmt.executeQuery();
		
		// 카트에 담겨있으면 수량만 +1
		if (rs.next()) {
			pstmt.close();
			sql = "update cart set countt = countt + 1 where pname=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pname);
	 		pstmt.executeUpdate();
		}
		
		// 카트에 없으면 새로 생성
		else {
			pstmt.close();
			sql = "insert into cart values(?, ?, ?, 1)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productID);
			pstmt.setString(2, pname);
			pstmt.setInt(3, unitPrice);
			pstmt.executeUpdate();
		}
		
		// 상세정보에서 왔을때
		if (request.getParameter("id") == null){
			response.sendRedirect("ProductCart.jsp");
		}
		
		// 상품목록에서 왔을때
		else {
			response.sendRedirect("ProductSelectAll.jsp");
		}
	}
	
	catch(SQLException ex) {
		out.print("SQLException : " + ex.getMessage());
	}
	
	finally {
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
		if (rs != null) rs.close();
	}
	
%>
	 
</body>
</html>