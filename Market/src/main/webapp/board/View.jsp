<!-- 게시물 상세 보기 -->

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
	String num = request.getParameter("num");
	BoardDAO dao = new BoardDAO();
	dao.updateVisitCount(num);
	
	BoardDTO dto = dao.selectView(num);
	dao.close();
%>
	<script type="text/javascript">
		function deletePost() {
			if (confirm("정말로 삭제하시겠습니까?")) {
            	location.href="<%= request.getContextPath() %>/13Servlet/Controller.do?num=<%=dto.getNum()%>&PageRoute=BoardDelete"
	        }
		}
	</script>

	<br><br><br>
	<div class = "container">
		<table class="table table-hover">
		  <thead>
		    <tr class="table-secondary" style="text-align: center;">
		      <th scope="col">번호</th>
		      <th scope="col">제목</th>
		      <th scope="col">작성자</th>
		      <th scope="col">조회수</th>
		      <th scope="col">작성일</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr class="table-light" style="text-align: center;">
		      <td><%=request.getParameter("numm") %></td>
		      <td><%=dto.getTitle()%></td>
		      <td><%=dto.getName() %></td>
		      <td><%=dto.getVisitcount() %></td>
		      <td><%=dto.getPostdate() %></td>
		    </tr>
		  </tbody>
		  <thead>
		    <tr class="table-secondary">
		      <th scope="col" colspan="5" style="text-align: center;">내용</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr class="table-light" style="text-align: center;">
		      <td colspan="5"><%=dto.getContent().replace("\r\n", "<br/>") %></td>
		    </tr>
		  </tbody>
		</table>
		<div>
			<%				
			// 로그인한 사용자와 글의 작성자가 같으면 수정, 삭제 버튼 출력
			if (session.getAttribute("id") != null && session.getAttribute("id").toString().equals(dto.getId())) {
%>
				<button type="button" class="btn btn-secondary" onclick="location.href='Edit.jsp?num=<%=dto.getNum()%>&title=<%=dto.getTitle()%>&content=<%=dto.getContent()%>'">수정</button>
				<button class="btn btn-secondary" onclick="deletePost()">삭제</button>
				<button class="btn btn-secondary" onclick="location.href='List.jsp'">목록</button>
<%
			}
			
			// 로그인한 사용자와 글의 작성자가 다르면 목록 버튼 출력
			else {
%>
				<button type="button" class="btn btn-secondary" onclick="location.href='List.jsp'">목록</button>
<%
			}
%>
		</div>
	</div>
	
</body>
</html>