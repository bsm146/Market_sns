<!-- 게시물 작성 -->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>?</title>
</head>
<body>

	<jsp:include page="Link.jsp" />
<%	
	request.setCharacterEncoding("UTF-8");
	
	
	// 로그인 상태가 아니면 Login 페이지로 이동
	if ((String)session.getAttribute("id") == null) {
		session.setAttribute("route", "Write");
		response.sendRedirect("Login.jsp");
	}
	
	// 제목, 내용, 작성자
%>
	
	<div class = "container">
		<form method="post" action="<%= request.getContextPath() %>/13Servlet/Controller.do?PageRoute=BoardWrite">
		  <fieldset>
		    <legend></legend>
		    <br>
		    <div class="form-group">
		      <input name="title" type="text" class="form-control" placeholder="제목" style="width: 300px;">
		    </div>
		    <div class="form-group">
		      <input name="content" type="text" class="form-control" placeholder="내용" style="width: 300px; height: 300px;">
		    </div>
		    <button type="submit" class="btn btn-secondary" style="width: 300px;">작성</button>
		  </fieldset>
		</form>
	</div>
	
</body>
</html>