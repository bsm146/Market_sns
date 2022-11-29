<!-- 주문 취소 -->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.Product"%>
<%@page import="membership.ProductRepository"%>
<jsp:useBean id="productDAO" class="membership.ProductRepository" scope="session"></jsp:useBean>
<jsp:useBean id="productDTO" class="dto.Product" scope="session"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
	
		
	</style>
<meta charset="UTF-8">
<title>?</title>
</head>
<body>
	
<%-- 	<%@include file="menu.jsp"%> --%>
	<%@include file="../board/Link.jsp"%>
	 
	 <%
		request.setCharacterEncoding("UTF-8");
		DecimalFormat df = new DecimalFormat("###,###");
		String greeting = "주문취소";
	 %>
	
	 <div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3"><%= greeting %></h1>
		</div>
	</div>
		
	<div class = "container">
		<div class="" style="">
			<div style="background: #FFC0CB; padding: 20px 20px 10px 20px; margin-bottom: 10px; border-radius: 5px;">
				<h3>주문이 취소되었습니다</h3>
			</div>
		</div>
	</div>
	
	<div class = "container">
		<p><input onclick="location.href='ProductSelectAll.jsp'" 	style="border: none; background: gray;" type="button" value="상품목록" class="btn btn-primary btn"></p>
	</div>
	
</body>
</html>