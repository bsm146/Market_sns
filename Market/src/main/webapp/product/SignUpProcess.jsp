<!-- 회원 가입 처리 -->

<%@taglib prefix = "c"	 uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix = "sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix = "fn"	 uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="productDAO" class="membership.ProductRepository" scope="session"></jsp:useBean> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>?</title>
</head>
<body>
	
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw1");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String birth = request.getParameter("birth1") + "/" + request.getParameter("birth2") + "/" + request.getParameter("birth3");
		String email = request.getParameter("email1") + "@" + request.getParameter("email2");
		String number = request.getParameter("number");
		String address = request.getParameter("address");
		
		String route = request.getParameter("route") == null ? "0" : request.getParameter("route");
	%>
	
	<sql:setDataSource var="dt"
					   url="jdbc:mysql://localhost:3306/jspWebMarket"
					   driver="com.mysql.jdbc.Driver"
					   user="root"
					   password="1234"/>	
	
	<sql:update var="rs" dataSource="${dt}">
		INSERT INTO member (id, pass, name, gender, birth, email, number, address) VALUES (?, ?, ?, ?, ?, ?, ?, ?);
		<sql:param value="<%= id %>"></sql:param>
		<sql:param value="<%= pw %>"></sql:param>
		<sql:param value="<%= name %>"></sql:param>
		<sql:param value="<%= gender %>"></sql:param>
		<sql:param value="<%= birth %>"></sql:param>
		<sql:param value="<%= email %>"></sql:param>
		<sql:param value="<%= number %>"></sql:param>
		<sql:param value="<%= address %>"></sql:param>
	</sql:update>
	
	<c:out value="${route}"></c:out>
	
	<c:choose>
		<c:when test="${route eq 'product'}">
			<% session.removeAttribute("route"); %>
			<c:redirect url="ProductSelectAll.jsp"></c:redirect>
		</c:when>
		<c:otherwise>
			<% session.removeAttribute("route"); %>
			<c:redirect url="../board/List.jsp"></c:redirect>
		</c:otherwise>
	</c:choose>
	

</body>
</html>