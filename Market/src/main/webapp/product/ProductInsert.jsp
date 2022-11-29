<!-- 상품 등록 -->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.oreilly.servlet.*"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>?</title>
</head>
<body>

	<%@include file="dbconn.jsp" %>	
<%
	String realFolder = request.getSession().getServletContext().getRealPath("./img");
	MultipartRequest multi = new MultipartRequest(request, realFolder, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
	
	Enumeration<?> files	= multi.getFileNames();
	String name				= (String)files.nextElement();
	String filename			= multi.getFilesystemName(name);
	
	String	productID		= multi.getParameter("productID");
	String	pname			= multi.getParameter("pname");
	int 	unitPrice		= Integer.parseInt(multi.getParameter("unitPrice"));
	String	description		= multi.getParameter("description");
	String	menufacturer	= multi.getParameter("menufacturer");
	String	category		= multi.getParameter("category");
	int 	unitInStock		= Integer.parseInt(multi.getParameter("unitInStock"));
	String	conditionn		= multi.getParameter("conditionn");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		
		String sql = "select * from product where pname=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pname);
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
			int	    countt 		 = rs.getInt("countt");
			int	    unitInStockk  = rs.getInt("unitInStock");
			pstmt.close();
			sql = "update product set countt=?, unitInStock=? where pname=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, countt + 1);
			pstmt.setInt(2, unitInStockk + unitInStock);
			pstmt.setString(3, pname);
	 		pstmt.executeUpdate();
// 	 		response.sendRedirect("ProductSelectAll.jsp");
		}
		
		else {
			pstmt.close();
			sql = "insert into product values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productID);
			pstmt.setString(2, pname);
			pstmt.setInt(3, unitPrice);
			pstmt.setString(4, description);
			pstmt.setString(5, menufacturer);
			pstmt.setString(6, category);
			pstmt.setInt(7, unitInStock);
			pstmt.setString(8, conditionn);
			pstmt.setInt(9, 1);
			pstmt.setString(10, filename);
			pstmt.executeUpdate();
// 			response.sendRedirect("ProductSelectAll.jsp");
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