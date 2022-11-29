<!-- 상품 목록 -->

<%@page import="javax.print.attribute.standard.MediaSize.NA"%>
<%@page import="javax.print.attribute.standard.MediaSize.NA"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@taglib prefix = "c"	 uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix = "sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix = "fn"	 uri="http://java.sun.com/jsp/jstl/functions"%>

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
	<%@include file="../board/Link.jsp"%>
	<%@include file="../db/DataSource.jsp"%>
	
	<script type="text/javascript">
		
		function Delete() {
			var a = confirm("삭제할래?");
			document.getElementById('result').innerText = a;
		}
		
	</script>
	
	<sql:query var="rs" dataSource="${dt}">
		SELECT * FROM member WHERE id='<%= (String)session.getAttribute("id") %>'
	</sql:query>
	
	<c:forEach var="row" items="${rs.rowsByIndex}">
		<c:forEach var="column" items="${row}" varStatus="i">
			<c:set var="id" 	value="${row[0]}"></c:set>
		</c:forEach>
	</c:forEach>
	
<%
	String id = session.getAttribute("id") == null ? null : (String)session.getAttribute("id");
	session.setAttribute("route", "ProductSelectAll");
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		String sql = "select * from product";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		int forNum		= 0;
		int listNum		= 0;
		int countNum	= 0;
		
		while (rs.next()) {
			listNum += 1;
			countNum += rs.getInt("unitInStock");
		}
%>
	<c:set var="id2" 	value="<%= id %>"></c:set>
	
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">상품 목록<br></h1>
		</div>
	</div>
	
	<div class = "container">
		<c:if test="${id=='a'}">
			<a style="border: none;" role="button" class="btn btn-primary" href="./ProductMake.jsp">상품 등록</a>
			<a style="border: none;" role="button" class="btn btn-primary" href="./ProductEdit.jsp">상품 편집</a>
		</c:if>
		<br><br>

<%
			rs.close();
			stmt.close();
			
			sql = "select * from product";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
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
					<p><button type="button" onclick="location.href='ProductInfo.jsp?pname=<%= pname %>'" style="border: none;"><img src="../img/<%= img %>" style="border: none;"/></button></p>
					<h3><%=pname %></h3>
					<p><%=description %>
					<p><%=unitPrice %>원</p>
					<a style="background-color: #FFC31E; border: none; color: black;" role="button" class="btn btn-primary btn" href="./ProductCartMake.jsp?productID=<%=productID%>&pname=<%=pname%>&unitPrice=<%=unitPrice%>&countt=<%=countt%>&id=0">장바구니</a>
					<c:if test="${id=='a'}">
						<a style="background-color: #B90000; border: none; color: white;" role="button" class="btn btn-primary btn"
					   		href="./ProductSelectDelete.jsp?pname=<%=pname%>">삭제</a>
					</c:if>
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