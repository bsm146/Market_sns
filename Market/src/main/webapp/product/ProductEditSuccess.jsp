<!-- 상품 수정 -->

<%@page import="javax.print.attribute.standard.MediaSize.NA"%>
<%@page import="javax.print.attribute.standard.MediaSize.NA"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.text.DecimalFormat"%>
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
	request.setCharacterEncoding("UTF-8");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String realFolder = request.getSession().getServletContext().getRealPath("../img");
	MultipartRequest multi = new MultipartRequest(request, realFolder, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
	
	Enumeration<?> files		= multi.getFileNames();
	String name				= (String)files.nextElement();
	String filename			= multi.getFilesystemName(name);
	
	try {
		
			String sql = "update product set productID=?, pname=?, unitPrice=?, description=?, menufacturer=?, category=?, unitInStock=?, conditionn=?, img=? where pname=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, multi.getParameter("productID"));
			pstmt.setString(2, multi.getParameter("pname"));
			pstmt.setInt(3, Integer.parseInt(multi.getParameter("unitPrice")));
			pstmt.setString(4, multi.getParameter("description"));
			pstmt.setString(5, multi.getParameter("menufacturer"));
			pstmt.setString(6, multi.getParameter("category"));
			pstmt.setInt(7, Integer.parseInt(multi.getParameter("unitInStock")));
			pstmt.setString(8, multi.getParameter("conditionn"));
			pstmt.setString(9, filename);
			pstmt.setString(10, request.getParameter("pnamee"));
			
			pstmt.executeUpdate();
	}
	
	catch(SQLException ex) {
		out.print("SQLException : " + ex.getMessage());
	}
	
	finally {
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
		if (rs != null) rs.close();
		response.sendRedirect("ProductSelectAll.jsp");
	}
%>	
	

	
</body>
</html>