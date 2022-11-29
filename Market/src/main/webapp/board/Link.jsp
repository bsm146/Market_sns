<!-- 상단바 -->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href = "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
	
	<nav class = "navbar navbar-expand navbar-dark bg-dark">
		<div class = "container">
		
			<div class = "navbar-header">
				<a role="button" class="navbar-brand" href="../board/List.jsp?z=0">게시판</a>
				<a role="button" class="navbar-brand" href="../product/ProductSelectAll.jsp">상품</a>
				<a role="button" class="navbar-brand" href="../product/ProductCart.jsp">장바구니</a>
			</div>
			
			<div class = "navbar-header">
<%
				// 로그아웃 상태면 로그인, 회원가입 출력
				if ((String)session.getAttribute("id") == null) {
%>
					<a role="button" class="navbar-brand" href="../board/Login.jsp">　로그인</a>
					<a role="button" class="navbar-brand" href="../product/SignUp.jsp">회원가입</a>
<%
				}

				// 로그인 상태면 로그아웃, 마이페이지 출력
				else {
%>
					<a role="button" class="navbar-brand" href="../board/Login.jsp">　로그아웃</a>
					<a role="button" class="navbar-brand" href="../board/MyPage.jsp">마이페이지</a>
<%-- 					<a role="button" class="navbar-brand" style="color: white;"><%=session.getAttribute("id") %>님 환영합니다</a> --%>
<%
				}
%>
			</div>
		</div>
	</nav>	
	
<%
				// 관리자 화면, 사용자 화면 구분
				if (session.getAttribute("id") != null) {
					
					if (session.getAttribute("id").equals("a")) {
%>
<!-- 						<p style="text-align: center;"> 관리자 화면 <br> -->
<%
					} else {
%>
<!-- 						<p style="text-align: center;"> 사용자 화면 <br> -->
<%			
					}
				}
%>
	

	
</body>
</html>
