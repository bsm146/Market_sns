<!-- 회원 가입 -->

<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="productDAO" class="membership.ProductRepository" scope="session"></jsp:useBean> --%>

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

	<%@include file="../board/Link.jsp"%>
	
	<%
		request.setCharacterEncoding("utf-8");
	%>
	
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
	
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">회원가입</h1>
		</div>
	</div>
	
	<div class = "container">
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
				<form name="fom" method="post" action="SignUpProcess.jsp">
					<p><input type="text" name="id" id="id"></p>
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
		<input style="border: none;" type="button" value="가입" onclick="CheckAddProduct()" class="btn btn-primary btn">
		<input style="border: none; background: gray;" type="button" value="취소" onclick="location.href='ProductSelectAll.jsp'" class="btn btn-primary btn">
	</div>

</body>
</html>