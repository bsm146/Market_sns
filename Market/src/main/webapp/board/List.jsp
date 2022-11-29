<!-- 메인 페이지 -->

<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"		prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql"		prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions"	prefix="fn"%>
<jsp:useBean id="DAO" class="model1.board.BoardDAO" scope="session"/>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href = "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
	
    <jsp:include page="Link.jsp"/>
    
<%
	session.setAttribute("route", "List");

	// 게시판 눌렀을때 페이지 번호 초기화
	if (request.getParameter("z") != null) {
		session.removeAttribute("pageButton");
	}
%>
<%
	if (request.getAttribute("list") == null) {
%>
<!-- 	<script type="text/javascript"> -->
<%--    		location.href="<%= request.getContextPath() %>/13Servlet/Controller.do?PageRoute=ListAdd" --%>
<!--    </script> -->
<%
	}


	// totalCount 변수 설정
// 	String totalCount2 = request.getAttribute("totalCount") == null ? "0" : (String)request.getAttribute("totalCount");
// 	int totalCount = Integer.parseInt(totalCount2);
%>

<%	
	// DAO를 생성해 DB에 연결
	BoardDAO dao = new BoardDAO();
	
	// 사용자가 입력한 검색 조건을 Map에 저장
	Map<String, Object> param = new HashMap<String, Object>(); 
	
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	if (searchWord != null) {
	    param.put("searchField", searchField);
	    param.put("searchWord", searchWord);
	}
	
	int totalCount = dao.selectCount(param);  		// 게시물 수 확인
	List<BoardDTO> dto = dao.selectList(param);		// 게시물 목록 받기
	dao.close();  									// DB 연결 닫기
%>




	<br><br>
	<div class = "container">
	    <!-- 검색 --> 
	    <form method="get">  
		    <div>
				<div style="display: flex; justify-content: center;">
					<select name="searchNum"> 
		                <option value="5">5개씩</option> 
		                <option value="10">10개씩</option>
		            </select>
					<select name="searchField"> 
		                <option value="content">제목</option> 
		                <option value="content">내용</option>
		            </select>
		            <input type="text">
		            <button type="submit" class="btn btn-secondary">검색</button>
				</div>
			</div>	    
	    </form>
	    
		<!-- 게시물 목록 테이블(표)  -->
	    <table style="margin: 10px;" class="table table-hover">
	        <!-- 각 칼럼의 이름 --> 
	        <tr style="text-align: center; height: 50px;" class="table-secondary">
	            <th width="10%" scope="row">번호</th>
	            <th width="50%" scope="row">제목</th>
	            <th width="15%" scope="row">작성자</th>
	            <th width="10%" scope="row">조회수</th>
	            <th width="15%" scope="row">작성일</th>
	        </tr>
	        
	    <!-- 목록의 내용 --> 
<%
		
		int virtualNum = 0;
		virtualNum = totalCount--;
		
		// 페이지 번호 눌렀을때 값 받아오기, 현재 페이지를 나타내는 변수
		int pageNum = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		
		// 페이지 번호에 따른 for문 인덱스값 설정, for문 멈출때도 사용
		int pageNumFor = (pageNum == 1 ? 0 : (pageNum - 1) * 5);
%>
		<c:set var="pageNumFor" value="<%=(pageNum == 1 ? 0 : (pageNum - 1) * 5) %>"></c:set>
<%-- 		<c:out value="${pageNumFor}"></c:out> --%>
		
			<c:choose>
				<c:when test="${ empty list }">
			        <tr>
			            <td colspan="5" align="center">zzzzzzzzzzzz</td>
			        </tr>
		        </c:when>
		        <c:otherwise>
		        	<c:forEach items="${ list }" varStatus="status" var="i">
				        <tr align="center" class="table-light" style="height: 50px;">
				            <td><%= virtualNum - pageNumFor %></td>		<!--게시물 번호-->
				            <td align="left"><a style="color: black; padding-left: 10px;" href="View.jsp">${ list[status.index].title }</a></td>
							<td>${ list[status.index + pageNumFor].id }</td>
							<td>${ list[status.index + pageNumFor].visitcount }</td>
							<td>${ list[status.index + pageNumFor].postdate }</td>
				        </tr>
			        </c:forEach>
		        </c:otherwise>
	        </c:choose>
	        
	        
<%-- 		<c:out value="${fn:length(list)}"></c:out> --%>
<%
		if (dto.isEmpty()) {
%>
	        <tr>
	            <td colspan="5" align="center">
	                등록된 게시물이 없습니다
	            </td>
	        </tr>
<%
		}

		// 게시물이 있을 때 
		else {
			
		    for (int i = 0; i < 5; i++) {
%>
		        <tr align="center" class="table-light" style="height: 50px; color: red;">
		            <td><%= virtualNum - pageNumFor %></td>  								<!--게시물 번호-->
		            <td align="left">  			
		                <a style="color: black; padding-left: 10px;" href="View.jsp?num=<%= dto.get(i + pageNumFor).getNum() %>&numm=<%= virtualNum %>"><%= dto.get(i + pageNumFor).getTitle() %></a> 
		            </td>
		            <td align="center"><%= dto.get(i + pageNumFor).getId() %></td>          <!--작성자 아이디-->
		            <td align="center"><%= dto.get(i + pageNumFor).getVisitcount() %></td>  <!--조회수-->
		            <td align="center"><%= dto.get(i + pageNumFor).getPostdate() %></td>    <!--작성일-->
		        </tr>
<%
				// 게시물 다 출력했으면 종료
		    	if ( (i + pageNumFor) == (dto.size() - 1) ) {
		    		break;
		    	}
		    }
		}
%>
	    </table>
	    
	    
	    
	    
	    
	    
	    <!-- 글쓰기 -->
	    <table style="width: 100%;">
	        <tr align="right">
	            <td>
		            <button onclick="location.href='<%= request.getContextPath() %>/13Servlet/Controller.do?PageRoute=BoardAllDelete'" class="btn btn-secondary">전체 삭제</button>
		            <button onclick="location.href='Write.jsp'" type="submit" class="btn btn-secondary">글쓰기</button>
	            </td>
	        </tr>
	    </table>
	</div>
	<br>

	<div class = "container" style="text-align: center;">	
		<div style="display: inline-block;">
<%
			int pageButton = 0;
			
			// 이전 버튼 안눌렀을때
			if (request.getParameter("pageButton") == null) {
				
				// 이전 버튼 안눌렀을때 + 이전 버튼 누른적 있으면
				if (session.getAttribute("pageButton") != null) {
					pageButton = (Integer)session.getAttribute("pageButton");
				}
			}
			
			// 이전 버튼 눌렀을때
			else {
				pageButton = Integer.parseInt(request.getParameter("pageButton"));
				session.setAttribute("pageButton", pageButton);
			}
		
			// 이전 버튼에 담을 값
			int pageNumPrevious = pageNum - 1;
			
			for (int i = 0; i < 5; i++) {
				
				if (pageNumPrevious % 5 == 0) {
					pageNumPrevious = pageNumPrevious - 4;
					break;
				}
				pageNumPrevious--;
			}
		
			int disabledPreviousButton = pageNum;
			
			// 처음, 이전 버튼 on, off
			for (int i = 0; i < 5; i++) {
				
				if (disabledPreviousButton % 5 == 0) {
					
					// 현재 페이지가 첫 블록이면 처음, 이전 버튼 off
					if ((disabledPreviousButton * 5) <= 25) {
%>
						<button disabled="disabled" style="background: #aaaaaa; border: none;" type="button" class="btn btn-secondary">처음</button>
						<button disabled="disabled" style="background: #aaaaaa; border: none;" type="button" class="btn btn-secondary">이전</button>
<%
						break;
					}
					
					// 현재 페이지가 첫 블록이 아니면 처음, 이전 버튼 on
					else {
%>
							<button style="background: #aaaaaa; border: none;" onclick="location.href='List.jsp?page=<%= 1 %>&pageButton=<%= 0 %>'" type="button" class="btn btn-secondary">처음</button>
							<button style="background: #aaaaaa; border: none;" onclick="location.href='List.jsp?page=<%= pageNumPrevious %>&pageButton=<%= pageNumPrevious - 1 %>'" type="button" class="btn btn-secondary">이전</button>
<%
						break;
					}
				}
				else {
					disabledPreviousButton ++;
					continue;
				}
			}
			
		
			// 페이지 버튼 생성
			for (int i = 1; i < 6; i++) {
				
				// 게시글 5개 이하일때 버튼 1개만 생성
				if (dto.size() <= 5) {
%>
					<button style="border: none;" onclick="location.href='List.jsp?page=<%= i %>'" type="button" class="btn btn-secondary"><%= i %></button>
<%
					break;
				}
				
				// 게시글 6개 이상일때
				else {
				
					// 필요한만큼 버튼을 만들었으면
					if ((i + pageButton) == (dto.size() / 5) + 1) {
						
						// 5번째 게시물에서 버튼을 만들지 않기 위함
						if (dto.size() % 5 == 0) {
							break;
						}
%>
						<button style="background: #aaaaaa; border: none;" onclick="location.href='List.jsp?page=<%= i + pageButton %>'" type="button" class="btn btn-secondary"><%= i + pageButton %></button>
<%
						break;
					}
				}
				
				// 현재 페이지 버튼 색 강조
				if (i == (pageNum - pageButton)) {
%>
					<button style="border: none;" onclick="location.href='List.jsp?page=<%= i + pageButton %>'" type="button" class="btn btn-secondary"><%= i + pageButton %></button>
<%
				}
				
				else {
%>
					<button style="background: #aaaaaa; border: none;" onclick="location.href='List.jsp?page=<%= i + pageButton %>'" type="button" class="btn btn-secondary"><%= i + pageButton %></button>
<%
				}
			}
			
			// 다음 버튼 안눌렀을때
			if (request.getParameter("pageButton") == null) {
				
				// 다음 버튼 안눌렀을때 + 다음 버튼 누른적 있으면
				if (session.getAttribute("pageButton") != null) {
					pageButton = (Integer)session.getAttribute("pageButton");
				}
			}
			
			// 다음 버튼 눌렀을때
			else {
				pageButton = Integer.parseInt(request.getParameter("pageButton"));
				session.setAttribute("pageButton", pageButton);
			}
			
			// 다음 버튼에 담을 값
			int pageNumNext = pageNum;
			
			for (int i = 0; i < 5; i++) {
				
				if (pageNumNext % 5 == 0) {
					pageNumNext = pageNumNext + 1;
					break;
				}
				if ((pageNumNext + 1) % 5 == 0) {
					pageNumNext = pageNumNext + 2;
					break;
				}
				pageNumNext++;
			}	
			
			int disabledNextButton = pageNum;
			int lastPage = (dto.size() / 25) + 1; 
			
			// 다음, 마지막 버튼 on, off
			for (int i = 0; i < 5; i++) {
				
				if (disabledNextButton % 5 == 0) {
					
					// 현재 페이지가 마지막 블록이 아니면 다음, 마지막 버튼 on
					if ((disabledNextButton * 5) < dto.size()) {
%>
						<button style="background: #aaaaaa; border: none;" onclick="location.href='List.jsp?page=<%= pageNumNext %>&pageButton=<%= pageNumNext - 1 %>'" type="button" class="btn btn-secondary">다음</button>
						<button style="background: #aaaaaa; border: none;" onclick="location.href='List.jsp?page=<%= ((lastPage - 1) * 5) + 1 %>&pageButton=<%= (lastPage - 1) * 5 %>'" type="button" class="btn btn-secondary">마지막</button>
<%
						break;
					}
					
					// 현재 페이지가 마지막 블록이면 다음, 마지막 버튼 off
					else {
%>
						<button disabled="disabled" style="background: #aaaaaa; border: none;" type="button" class="btn btn-secondary">다음</button>
						<button disabled="disabled" style="background: #aaaaaa; border: none;" type="button" class="btn btn-secondary">마지막</button>
<%
						break;
					}
				}
				else {
					disabledNextButton ++;
					continue;
				}
			}
%>
		
		</div>
	</div>
	<br><br>
	 
</body>
</html>