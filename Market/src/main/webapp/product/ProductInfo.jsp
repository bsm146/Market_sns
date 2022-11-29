<!-- 상세 정보 -->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		#img {
			float: left;
			width: 300px;
			height: 300px;
			margin: 30px;
		}
	</style>
<meta charset="UTF-8">
<title>?</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	String pnamee = request.getParameter("pname");
%>
	<%@include file="dbconn.jsp" %>	
	<%@include file="../board/Link.jsp"%>
	<%@include file="../db/DataSource.jsp"%>

	<sql:query var="rs" dataSource="${dt}">
		SELECT * FROM product WHERE pname=?
		<sql:param value="<%= pnamee %>"></sql:param>
	</sql:query>
	
	<c:forEach var="row" items="${rs.rowsByIndex}">
		<c:forEach var="column" 		items="${row}" varStatus="i">
			<c:set var="productID" 		value="${row[0]}"></c:set>
			<c:set var="pname" 			value="${row[1]}"></c:set>
			<c:set var="unitPrice" 		value="${row[2]}"></c:set>
			<c:set var="description" 	value="${row[3]}"></c:set>
			<c:set var="menufacturer" 	value="${row[4]}"></c:set>
			<c:set var="category" 		value="${row[5]}"></c:set>
			<c:set var="unitInStock" 	value="${row[6]}"></c:set>
			<c:set var="conditionn" 	value="${row[7]}"></c:set>
			<c:set var="countt" 		value="${row[8]}"></c:set>
			<c:set var="img" 			value="${row[9]}"></c:set>
		</c:forEach>
	</c:forEach>

	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">상세 정보</h1>
		</div>
	</div>
	
	<div class = "container">
		<div style="float: left;">
			<p><img id="img" src="../img/${img}"></p>
		</div>
		<div>
			<h3> ${pname}</h3>
			<p> ${description}</p>
			<b> 상품 코드 </b> : <p class="badge badge-danger">${productID}</p>
			<p> <b> 제조사 </b> : ${menufacturer}</p>
			<p> <b> 상품 분류 </b> : ${category}</p>
			<p> <b> 재고 수 </b> : ${unitInStock}</p>
			<h3> ${unitPrice}원</h3>
			<a style="background-color: #FFC31E; border: none; color: black;" role="button" class="btn btn-primary" href="./ProductCartMake.jsp?productID=${productID}&pname=${pname}&unitPrice=${unitPrice}&countt=${countt}">장바구니</a>
			<a style="background-color: gray; border: none;" role="button" class="btn btn-primary" href="./ProductSelectAll.jsp">상품 목록</a>
		</div>
		<br>
		<hr>
	</div>
	
	<%@include file="footer.jsp"%>
	
</body>
</html>