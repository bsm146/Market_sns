<!-- 마이페이지 수정 -->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>

<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
	
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

	<script type="text/javascript">
	
		function CheckAddProduct() {
			
			var fom = document.fom;
			
			// 비밀번호 확인
// 			if (fom.pw1.value != fom.pw2.value) {
// 				alert('비밀번호 확인')
// 				document.getElementById("pw1").focus();
// 				return false;
// 			}
			
			fom.submit();
		}

	</script>
		
	<jsp:include page="Link.jsp" />
	
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">회원수정</h1>
		</div>
	</div>
	
	<div class = "container">
<!-- 			  <fieldset> -->
<!-- 			    <legend></legend> -->
<!-- 			    <div> -->
<!-- 			    	<label class="form-label mt-4">ID</label> -->
<!-- 				    <div class="form-group"> -->
<%-- 				      <input name="id" type="text" class="form-control" value="<%=session.getAttribute("id") %>" style="width: 200px;" disabled="disabled"> --%>
<!-- 				    </div> -->
<!-- 				    <label class="form-label mt-4">Password</label> -->
<!-- 				    <div class="form-group"> -->
<%-- 				      <input name="pw" type="password" class="form-control" value="<%=session.getAttribute("pw") %>" style="width: 200px;"> --%>
<!-- 				    </div> -->
<!-- 				    <label class="form-label mt-4">Name</label> -->
<!-- 				    <div class="form-group"> -->
<%-- 				      <input name="pw" type="text" class="form-control" value="<%=session.getAttribute("pw") %>" style="width: 200px;"> --%>
<!-- 				    </div> -->
<!-- 			    </div> -->
<!-- 			    <br> -->
<!-- 			    <button onclick="location.href='List.jsp'" type="submit" class="btn btn-secondary" style="width: 200px;">완료</button> -->
<!-- 			  </fieldset> -->

		<div class="a" >
			<div class="b">
				<p>아이디
				<p>비밀번호
				<p>비밀번호확인
				<p>이름
				<p>성별
				<p>생일
				<p>이메일
				<p>전화번호
				<p>주소
			</div>
			<div class="c">
				<form name="fom" method="post" action="<%= request.getContextPath() %>/13Servlet/Controller.do?PageRoute=MyPageUpdate">
					<p><input disabled="disabled" type="text" name="id" id="id" value="<%= request.getParameter("id") %>" placeholder="<%= request.getParameter("id") %>"></p>
					<p><input type="password" name="pw1" id="pw1"></p>
					<p><input type="password" name="pw2" id="pw2"></p>
					<p><input type="text" name="name" id="name"></p>
					<p>
						<input type="radio" name="gender" value="남자" id="gender"> 남자
						<input type="radio" name="gender" value="여자" id="gender"> 여자</p>
					<p>
						<input type="text" name="birth1" id="birth1" style="width: 80px;">
					    <select name="birth2"> 
				            <option value="1">1</option> 
				            <option value="2">2</option>
				            <option value="3">3</option>
				            <option value="4">4</option>
				            <option value="5">5</option>
				            <option value="6">6</option>
				            <option value="7">7</option>
				            <option value="8">8</option>
				            <option value="9">9</option>
				            <option value="10">10</option>
				            <option value="11">11</option>
				            <option value="12">12</option>
		                </select>
		                <input type="text" name="birth3" id="birth3" style="width: 50px;"></p>
					<p>
						<input type="text" name="email1" id="email1">
						@
						<select name="email2"> 
				            <option value="naver.com">naver.com</option> 
				            <option value="google.com">google.com</option>
		                </select></p>
					<p><input type="text" name="number" id="number">
					<p><input type="text" name="address" id="address">
				</form>
			</div>
		</div>
	</div>
	
	<div class = "container">
		<input style="border: none;" type="button" value="수정" onclick="CheckAddProduct()" class="btn btn-primary btn">
		<input style="border: none; background: gray;" type="button" value="취소" onclick="location.href='List.jsp'" class="btn btn-primary btn">
	</div>
	
</body>
</html>