<!-- 장바구니 -->

<%@page import="javax.swing.plaf.basic.BasicPopupMenuSeparatorUI"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*" %>
<%@include file="dbconn.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		
		.box1 {
			width: 100%;
		}
		
		.product {
			display: flex;
		}
		
	</style>
<meta charset="UTF-8">
<title>?</title>
</head>
<body>
	
	<%@include file="../board/Link.jsp"%>
	<%@include file="../db/DataSource.jsp"%>
	 
 <%
		request.setCharacterEncoding("UTF-8");
		DecimalFormat df = new DecimalFormat("###,###");
		
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
 %>
		 <div class = "jumbotron">
			<div class = "container">
				<h1 class = "display-3">장바구니</h1>
			</div>
		</div>
		
		<div class = "container">
			<p>
				<a style="background-color: #B90000; border: none;" role="button" class="btn btn-primary" href="./ProductCartDelete.jsp?id=all">전체삭제</a>
				<a style="background-color: #1E821E; border: none; float: right;" role="button" class="btn btn-primary" href="./ProductOrderDeilivery.jsp">주문하기</a></p>
			<hr>
			<div class="box1">
				<div class="product">
					<p style="width: 500px;"><b>상품</b></p>
					<p style="width: 200px;"><b>가격</b></p>
					<p style="width: 150px;"><b>수량</b></p>
					<p style="width: 200px;"><b>소계</b></p>
					<p style="width: 200px"><b>비고</b></p>
				</div><hr>
<%
		String sql = "select * from cart";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		int 	hap 		 = 0;
		int 	cartNum		 = 0;
		
		while (rs.next()) {
		
			String 	productID 	 = rs.getString("productID");
			String 	pname 		 = rs.getString("pname");
			int	    unitPrice 	 = rs.getInt("unitPrice");
			int	    countt 		 = rs.getInt("countt");
			
			// 수량이 0일때는 안보이게
			if (countt != 0) {
%>
				<div class="product">
					<p style="width: 500px;"><%= productID %> - <%= pname %></p>
					<p style="width: 200px;"><%= df.format(unitPrice)+"원" %></p>
					<a style="background-color: #D7A45E; border: none; margin-right: 5px; width: 36px; height: 36px;" class="btn btn-primary"  role="button" href="./ProductCartCount.jsp?id=minus&pname=<%=pname%>&count=<%=countt%>">-</a>
					<p style="width: 150px;"><%= countt %>
					<a style="background-color: #D7A45E; border: none;" role="button" class="btn btn-primary" href="./ProductCartCount.jsp?id=plus&pname=<%=pname%>&count=<%=countt%>">+</a>
					<p style="width: 200px"><%= df.format(unitPrice * countt) + "원" %></p>
					<p style="width: 200px"><a style="background-color: #B90000; border: none;" role="button" class="btn btn-primary" href="./ProductCartDelete.jsp?pname=<%= pname %>">삭제</a></p>
				</div><hr>
<%			
				hap += unitPrice * countt;
				cartNum += countt;
			}
		}
		session.setAttribute("cartNum", cartNum);
%>
		<div class="product">
				<p style="width: 500px;"></p>
				<p style="width: 200px;"></p>
				<p style="width: 150px;"><b>총액</b></p>
				<p style="width: 200px;"><b><%= df.format(hap)+"원" %></b></p>
				<p style="width: 200px"></p>
			</div>
		</div>
		
		<p><a style="background-color: #828282; border: none;" role="button" class="btn btn-primary" href="./ProductSelectAll.jsp">쇼핑하기</a></p>
		<hr>
	</div>
<%
	}
		
	catch(SQLException ex) {
		out.print("select where 실패<br>");
		out.print("SQLException : " + ex.getMessage());
	}
	
	finally {
		if (stmt != null) stmt.close();
		if (conn != null) conn.close();
		if (rs != null) rs.close();
	}
%>
	<%@include file="footer.jsp"%>

</body>
</html>