<!-- 주문 성공 -->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>

<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
	
		
	</style>
<meta charset="UTF-8">
<title>?</title>
</head>
<body>
	
	
	<%@include file="dbconn.jsp" %>
<%-- 	<%@include file="menu.jsp"%> --%>
	<%@include file="../board/Link.jsp"%>
	 
	 <%
		request.setCharacterEncoding("UTF-8");
		DecimalFormat df = new DecimalFormat("###,###");
	 %>
	 
	
	 <div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">주문완료</h1>
		</div>
	</div>
		
	<div class = "container">
		<div class="" style="">
			<div style="background: #FFC0CB; padding: 20px 20px 10px 20px; margin-bottom: 10px; border-radius: 5px;">
				<h3>주문해주셔서 감사합니다</h3>
			</div>
			<div>
				<p>주문은 <%= request.getParameter("date") %> 에 발송될 예정입니다
				<p>주문번호 : <%
								char[] tmp = new char[6];
								
								for(int i=0; i<tmp.length; i++) {
									int div = (int) Math.floor( Math.random() * 2 );
									
									if(div == 0) {
										tmp[i] = (char) (Math.random() * 10 + '0') ;
									} else {
										tmp[i] = (char) (Math.random() * 26 + 'A') ;
									}
								}
								out.print(tmp);
							%>
			</div>
		</div>
	</div>

	<div class = "container">
		<p><input onclick="location.href='ProductSelectAll.jsp'" style="border: none; background: gray;" type="button" value="상품목록" class="btn btn-primary btn"></p>
	</div>
	
	<%
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "delete from cart";
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		}
		
		catch(SQLException ex) {
			out.print("SQLException : " + ex.getMessage());
		}
		
		finally {
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		}
	
	%>
</body>
</html>