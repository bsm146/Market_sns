<!-- 게시물 수정 -->

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
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String num = request.getParameter("num");
%>
	<div class = "container">
		<form method="post" action="<%= request.getContextPath() %>/13Servlet/Controller.do?PageRoute=BoardEdit&num=<%=num%>">
		  <fieldset>
		    <legend></legend>
		    <br>
		    <div class="form-group">
		      <input name="title" type="text" class="form-control" id="exampleInputEmail1" value="<%= title %>" style="width: 300px;">
		    </div>
		    <div class="form-group">
		      <input name="content" type="text" class="form-control" id="exampleInputPassword1" value="<%= content %>" style="width: 300px; height: 300px;">
		    </div>
		    <button type="submit" class="btn btn-secondary" style="width: 300px;">수정</button>
		  </fieldset>
		</form>
	</div>
	
</body>
</html>