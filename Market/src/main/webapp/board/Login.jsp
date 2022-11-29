<!-- 로그인, 로그아웃 구분 -->

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
	
	// 로그아웃 상태면 로그인 창 출력 후 LoginProcess 페이지로 이동
	if ((String)session.getAttribute("id") == null) {
%>	
		<div class = "container">
			<form method="post" action="<%= request.getContextPath() %>/13Servlet/Controller.do?PageRoute=Login">
			  <fieldset>
			    <legend></legend>
			    <br>
			    <div>
				    <div class="form-group">
				      <input name="id" type="text" class="form-control" id="exampleInputEmail1" placeholder="아이디" style="width: 200px;">
				    </div>
				    <div class="form-group">
				      <input name="pw" type="password" class="form-control" id="exampleInputPassword1" placeholder="비밀번호" style="width: 200px;">
				    </div>
			    </div>
<%
				if (session.getAttribute("nullId") != null) {
%>				
					<p style="color: red;"><b>아이디</b>를 입력해주세요</p>	
<%			
					session.removeAttribute("nullId");
				}
				else if (session.getAttribute("nullPw") != null) {
%>
					<p style="color: red;"><b>비밀번호</b>를 입력해주세요</p>	
<%
					session.removeAttribute("nullPw");
				}
				else if (session.getAttribute("member") != null){
%>				
					<p style="color: red;"><b>아이디</b>나 <b>비밀번호</b>를 확인해주세요</p>	
<%			
					session.removeAttribute("member");
				}
%>
			    <button type="submit" class="btn btn-secondary" style="width: 200px;">로그인</button>
			  </fieldset>
			</form>
		</div>
<%
	}
	
	// 로그인 상태면 세션 삭제하여 로그아웃시키고 List 페이지로 이동
	else {
		
		// 상품목록 페이지에서 로그아웃 눌렀을떄
		if (session.getAttribute("route") != null && session.getAttribute("route") == "ProductSelectAll") {
			session.invalidate();
			response.sendRedirect("../product/ProductSelectAll.jsp");
		}
		
		// 게시판 페이지에서 로그아웃 눌렀을떄
		else if (session.getAttribute("route") != null && session.getAttribute("route") == "List") {
			session.invalidate();
			response.sendRedirect("../board/List.jsp");
		}
	}
%>
	
</body>
</html>