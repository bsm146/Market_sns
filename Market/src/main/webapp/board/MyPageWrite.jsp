<!-- 마이페이지 내 글 보기 -->

<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@page import="java.util.Collections"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>?</title>
</head>	
<body>

<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	BoardDAO dao = new BoardDAO();
	ArrayList<BoardDTO> bo = dao.myBoard(id);
	dao.close();
	Collections.reverse(bo);
%>
	
	<br><br>
	<table class="table table-hover">
		<tr style="text-align: center; height: 50px;" class="table-secondary">
<!-- 	            <th width="10%" scope="row">번호</th> -->
            <th width="50%" scope="row">제목</th>
<!-- 	            <th width="15%" scope="row">작성자</th> -->
            <th width="25%" scope="row">조회수</th>
            <th width="25%" scope="row">작성일</th>
        </tr>
<%
		for (int i = 0; i < bo.size(); i++) {
%>
		    
	        <tr align="center" class="table-light" style="height: 50px;">
<%-- 		            <td><%= bo.get(i).getNum() %></td>   --%>
	            <td align="left">  			
	                <a style="color: black; padding-left: 10px;" href="View.jsp?num=<%= bo.get(i).getNum() %>&numm=<%= bo.get(i).getNum() %>"><%= bo.get(i).getTitle() %></a> 
	            </td>
<%-- 		            <td align="center"><%= bo.get(i).getId() %></td>          <!--작성자 아이디--> --%>
	            <td align="center"><%= bo.get(i).getVisitcount() %></td>  <!--조회수-->
	            <td align="center"><%= bo.get(i).getPostdate() %></td>    <!--작성일-->
	        </tr>
<%
		}
%>
	</table>
		
</body>
</html>