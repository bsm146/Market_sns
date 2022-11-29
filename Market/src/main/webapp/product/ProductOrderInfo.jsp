<!-- 주문 정보 -->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		.box1 {
			padding: 20px;
			
		}
	</style>
<meta charset="UTF-8">
<title>?</title>
</head>
<body>
	 <%@include file="dbconn.jsp" %>	
<%-- 	 <%@include file="menu.jsp"%> --%>
	 <%@include file="../board/Link.jsp"%>
	 
 <%
	request.setCharacterEncoding("UTF-8");
	DecimalFormat df = new DecimalFormat("###,###");
	
	Date today = new Date();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
	
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		String sql = "select * from cart";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
 %>
 
	 <div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">주문정보</h1>
		</div>
	</div>
		
	<div class = "container">
		<div class="box1" style="background: #D7F1FA">
			
			<div style="text-align: center;">
				<h2>영수증</h2>
			</div>
			
			<div style="">
				<p><b>배송주소</b>
				<i style="float: right;">배송일 : <%= request.getParameter("date") %></i></p>
			</div>
			
			<div>
				<p>성명 : <%= request.getParameter("name") %>
				<p>우편번호 : <%= request.getParameter("num") %>
				<p>주소 : <%= request.getParameter("address") %>
				<p>(<%= request.getParameter("nation") %>)
			</div>
			 
			 <hr>
			<div>
				<div style="display: flex; text-align: center;">
					<p style="width: 25%"><b>도서</b>
					<p style="width: 25%"><b>수량</b>
					<p style="width: 25%"><b>가격</b>
					<p style="width: 25%"><b>소계</b>
				</div>
				<hr>
			</div>
		<%
			int hap = 0;
			while (rs.next()) {
				String 	pname 		 = rs.getString("pname");
				int	    unitPrice 	 = rs.getInt("unitPrice");
				int	    countt 		 = rs.getInt("countt");
		%>
				<div class="product" style="display: flex; text-align: center;">
					<p style="width: 25%;"><%= pname %></p>
					<p style="width: 25%;"><%= countt %></p>
					<p style="width: 25%;"><%= df.format(unitPrice)+"원" %></p>
					<p style="width: 25%"><%= df.format(unitPrice * countt) + "원" %></p>
				</div>
				<hr>
		<%		
				hap += unitPrice * countt;
				}
		%>
			<div style="display: flex;">
				<p style="width: 25%">
				<p style="width: 25%">
				<p style="width: 25%; padding-left: 180px;"><b>총액 :</b>
				<p style="width: 25%; text-align: center;"><b style="color: red;"><%= df.format(hap) %>원</b>
			</div>
			<br>
			
			<p>
		    <input onclick="location.href='ProductOrderDeilivery.jsp'" style="border: none; background: gray;" type="button" value="이전" class="btn btn-primary btn">
		    <input onclick="location.href='ProductOrderSuccess.jsp?date=<%= request.getParameter("date") %>'" 	style="border: none;" type="button" value="주문" class="btn btn-primary btn">
		    <input onclick="location.href='ProductOrderCancel.jsp'" 	style="border: none; background: gray;" type="button" value="취소" class="btn btn-primary btn"></p>
			
		</div>
	</div>
	<br>
	
<%			
		// 랜덤 문자열 생성


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