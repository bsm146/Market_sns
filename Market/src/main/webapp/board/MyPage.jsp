<!-- 마이페이지 -->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql"	uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="fn"	uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>?</title>
</head>	
<body>

<%
	int hid = request.getParameter("hid") == null ? 0 : 1;
%>
	<c:set var="hid" value="<%= hid %>"></c:set>
	
	<sql:setDataSource var="dt"
					   url="jdbc:mysql://localhost:3306/jspWebMarket"
					   driver="com.mysql.jdbc.Driver"
					   user="root"
					   password="1234"/>

	<sql:query var="rs" dataSource="${dt}">
		SELECT * FROM member WHERE id='<%= session.getAttribute("id") %>';
	</sql:query>
	
	<c:forEach var="row" items="${rs.rowsByIndex}">
		<c:forEach var="column" items="${row}" varStatus="i">
			<c:set var="id" 		value="${row[0]}"></c:set>
			<c:set var="pw" 		value="${row[1]}"></c:set>
			<c:set var="name" 		value="${row[2]}"></c:set>
			<c:set var="gender" 	value="${row[3]}"></c:set>
			<c:set var="birth"		value="${row[4]}"></c:set>
			<c:set var="email" 		value="${row[5]}"></c:set>
			<c:set var="number"		value="${row[6]}"></c:set>
			<c:set var="address"	value="${row[7]}"></c:set>
		</c:forEach>
		<br>
	</c:forEach>
	
	
	<jsp:include page="Link.jsp" />

		<div class = "container">
			<form method="post" action="MyPageUpdate.jsp?id=${id}">
				<fieldset>
				    <legend></legend>
				    <div style="float: left; margin-right: 20px;">
				    	<label class="form-label mt-4">ID</label>
					    <div class="form-group">
					    	<input name="id" type="text" class="form-control" placeholder="${id}" style="width: 200px;" disabled="disabled">
					    </div>
					    <label class="form-label mt-4">Password</label>
					    <div class="form-group">
					    	<input name="pw" type="password" class="form-control" placeholder="********" style="width: 200px;" disabled="disabled">
					    </div>
					    <label class="form-label mt-4">Name</label>
					    <div class="form-group">
					    	<input name="pw" type="password" class="form-control" placeholder="${name}" style="width: 200px;" disabled="disabled">
					    </div>
					    <label class="form-label mt-4">Gender</label>
					    <div class="form-group">
					    	<input name="pw" type="password" class="form-control" placeholder="${gender}" style="width: 200px;" disabled="disabled">
					    </div>
					</div>
					<div>
					    <label class="form-label mt-4">Birth</label>
					    <div class="form-group">
					    	<input name="pw" type="password" class="form-control" placeholder="${birth}" style="width: 200px;" disabled="disabled">
					    </div>
					    <label class="form-label mt-4">Email</label>
					    <div class="form-group">
					    	<input name="pw" type="password" class="form-control" placeholder="${email}" style="width: 200px;" disabled="disabled">
					    </div>
					    <label class="form-label mt-4">PhoneNumber</label>
					    <div class="form-group">
					    	<input name="pw" type="password" class="form-control" placeholder="${number}" style="width: 200px;" disabled="disabled">
					    </div>
					    <label class="form-label mt-4">Address</label>
					    <div class="form-group">
					    	<input name="pw" type="password" class="form-control" placeholder="${address}" style="width: 200px;" disabled="disabled">
					    </div>
						
				    </div>
				    <br>
				    <button type="submit" onclick="location.href='MyPageUpdate.jsp'" class="btn btn-secondary" style="width: 200px;">정보 수정</button>
				</fieldset>
			</form>
		</div>
		<div class = "container">
			<c:choose>
				<c:when test="${hid == 1}">
					<form action="">
						<button type="submit" class="btn btn-secondary" style="width: 200px; margin-top: 20px;">내가 쓴 글 닫기</button>
						<jsp:include page="MyPageWrite.jsp"/>
					</form>
				</c:when>
				<c:otherwise>
					<form method="post">
						<input name="hid" type="hidden" value="0">
						<button type="submit" class="btn btn-secondary" style="width: 200px; margin-top: 20px;">내가 쓴 글 열기</button>
					</form>
				</c:otherwise>
			</c:choose>
		</div>
</body>
</html>