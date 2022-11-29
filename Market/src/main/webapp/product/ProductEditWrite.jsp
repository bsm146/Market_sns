<!-- 상품 수정 -->

<%@page import="javax.print.attribute.standard.MediaSize.NA"%>
<%@page import="javax.print.attribute.standard.MediaSize.NA"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.text.DecimalFormat"%>

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
		.a {
			display: flex;
		}
		
		.b {
			margin-right: 70px;
		}
		
		.b > p {
			margin-bottom: 22px;
		}
		
		.c > p {
			margin-bottom: 14px;
		}
	</style>
<meta charset="UTF-8">
<title>?</title>
</head>
<body>
	
	<%@include file="dbconn.jsp" %>	
<%-- 	<%@include file="menu.jsp"%> --%>
	<%@include file="../board/Link.jsp"%>
	
	<script type="text/javascript">
	
		function CheckAddProduct() {
			document.fom.submit();
		}

	</script>
	
	
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">상품 수정</h1>
		</div>
	</div>
	
<%
	request.setCharacterEncoding("UTF-8");
	DecimalFormat df = new DecimalFormat("###,###");
	String pnamee = request.getParameter("pname");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		String sql = "select * from product where pname=?";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, pnamee);
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
		
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
%>
	
	<div class = "container" style="display: flex;">
		<div>
<%-- 			<p><img id="img" src=".\img/<%=img%>"></p> --%>
		</div>
		<div class="a" >
			<div class="b">
				<p>상품 코드 
				<p>상품명
				<p>가격
				<p style="margin-bottom: 40px;">상세 정보 
				<p>제조사
				<p>분류
				<p>재고 수
				<p>상태
				<p>이미지
			</div>
			<div class="c">
				<form name="fom" method="post" action="ProductEditSuccess.jsp?pnamee=<%=pnamee %>" enctype="multipart/form-data">
					<p><input type="text" name="productID" id="productID" value="<%=productID%>">
					<p><input type="text" name="pname" id="pname" value="<%=pname%>">
					<p><input type="text" name="unitPrice" id="unitPrice" value="<%=unitPrice%>">
					<p><input type="text" name="description" style="height: 50px; width: 320px;" id="description" value="<%=description%>"></p>
					<p><input type="text" name="menufacturer" id="menufacturer" value="<%=menufacturer%>">
					<p><input type="text" name="category" id="category" value="<%=category%>">
					<p><input type="text" name="unitInStock" id="unitInStock" value="<%=unitInStock%>">
					<p><input type="radio" name="conditionn" value="신규 제품" id="conditionn"> 신규 제품
					   <input type="radio" name="conditionn" value="중고 제품" id="conditionn"> 중고 제품
					   <input type="radio" name="conditionn" value="재생 제품" id="conditionn"> 재생 제품 </p>
					<p><input type="file" name="fileName" value="<%=img%>">
				</form>
			</div>
		</div>
	</div>

	<div class = "container">
		<input style="border: none;" type="button" value="등록" onclick="CheckAddProduct()" class="btn btn-primary btn">
		<input style="border: none; background: gray;" type="button" value="취소" onclick="location.href='ProductEdit.jsp'" class="btn btn-primary btn">
	</div>		
<%			
		}
		
	}
	
	catch(SQLException ex) {
		out.print("select where 실패<br>");
		out.print("SQLException : " + ex.getMessage());
	}
	
	finally {
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
		if (rs != null) rs.close();
	}
	
	
%>
	
	<div class = "container">
		<hr>
	</div>
	
	<%@include file="footer.jsp"%>
	
</body>
</html>