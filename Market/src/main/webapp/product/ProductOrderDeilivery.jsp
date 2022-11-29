<!-- 배송 정보 -->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>

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
	
<%-- 	<%@include file="menu.jsp"%> --%>
	<%@include file="../board/Link.jsp"%>
	 
	 <%
		request.setCharacterEncoding("UTF-8");
		DecimalFormat df = new DecimalFormat("###,###");
	 %>
	 
	 <script type="text/javascript">
	
		function submit() {
			document.fom.submit();
		}

	</script>
	
	 <div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">배송정보</h1>
		</div>
	</div>
		
	<div class = "container">
		<div class="a" >
			<div class="b">
				<p>성명
				<p>배송일
				<p>국가명
				<p>우편번호
				<p>주소
			</div>
			<div class="c">
				<form name="fom" method="post" action="ProductOrderInfo.jsp">
					<p><input type="text" name="name" id="name">
					<p><input type="text" name="date" id="date">
					<p><input type="text" name="nation" id="nation">
					<p><input type="text" name="num" id="num">
					<p><input type="text" name="address" id="address" style="width: 350px"></p>
				</form>
			</div>
		</div>
	</div>
	
	<div class = "container">
		<p>
		   <input onclick="location.href='ProductCart.jsp'" style="border: none; background: gray;" type="button" value="이전" class="btn btn-primary btn">
		   <input onclick="submit()" type="button" style="border: none;" value="등록" class="btn btn-primary btn">
		   <input onclick="location.href='ProductSelectAll.jsp'" 	style="border: none; background: gray;" type="button" value="취소" class="btn btn-primary btn"></p>
	</div>
	
</body>
</html>