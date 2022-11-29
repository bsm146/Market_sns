<!-- 상품 편집 -->

<%@page import="javax.print.attribute.standard.MediaSize.NA"%>
<%@page import="javax.print.attribute.standard.MediaSize.NA"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
	
		.box {
			display: flex;
		}
		
		.item {
			width: 33%;
			text-align: center;
		}
		
		img {
			width: 200px; 
			height: 200px;
		}
		
	</style>
<meta charset="UTF-8">
<title>?</title>
</head>
<body>
	
	<%@include file="dbconn.jsp" %>	
<%-- 	<%@include file="menu.jsp"%> --%>
	<%@include file="../board/Link.jsp"%>
	
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">상품 편집</h1>
		</div>
	</div>
	
	<div class = "container">
		<p>
<%
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from product";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			int 	forNum		 = 0;
			
			while (rs.next()) {
				String 	productID 	 = rs.getString("productID");
				String 	pname 		 = rs.getString("pname");
				int	    unitPrice 	 = rs.getInt("unitPrice");
				String  description  = rs.getString("description");
				String  menufacturer = rs.getString("menufacturer");
				String  category 	 = rs.getString("category");
				int	    unitInStock  = rs.getInt("unitInStock");
				String  conditionn   = rs.getString("conditionn");
				int	    countt 		 = rs.getInt("countt");
				String	img 		 = rs.getString("img");
				
				if (forNum % 3 == 0) {
%>
					<div class = "box">
<%
				}
%>
				<div class = "item">
					<img src="../img/<%= img %>">
					<h3><%=pname %></h3>
					<p><%=description %>
					<p><%=unitPrice %>원</p>
					<a style="background-color: #4BAF4B; border: none;" role="button" class="btn btn-primary btn" href="./ProductEditWrite.jsp?pname=<%= pname %>">수정</a>
				</div>
<%
				forNum++;
				if (forNum % 3 == 0) {
%>
					</div><br><br>
<%
				}
			}
		}
		
		catch(SQLException ex) {
			out.print("member 테이블 호출 실패<br>");
			out.print("SQLException : " + ex.getMessage());
		}
		
		finally {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		}
%>
	</div>
	
	<div class = "container">
		<hr>
	</div>
	
	<%@include file="footer.jsp"%>
	
</body>
</html>