<!-- 상품 등록 -->

<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="membership.ProductRepository" scope="session"></jsp:useBean>

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
		request.setCharacterEncoding("utf-8");
		String greeting = "상품 등록"; 
	%>
	
	<script type="text/javascript">
	
		function CheckAddProduct() {
			
			var fom = document.fom;
//  			var regExp = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
 			var productID =  /^P[0-9]{4,11}$/;	// 상품 코드 P로 시작 + 상품 코드 영어, 숫자만 + 5~12글자
			var pname = /^.{4,12}$/;				// 상품명 4~12글자
			var unitPrice = /^[0-9.{2}]+$/; 			// 상품 가격 숫자만 입력
			var unitInStock = /^[0-9]+$/;  				// 재고 수 숫자만 입력
			
		// 상품 코드 P로 시작 + 상품 코드 영어, 숫자만 + 5~12글자
// 			if ( (!productID.test(fom.productID.value))  ) {
// 				alert('상품 코드의 첫 글자는 P로 시작하여 5~12글자로')
// 				document.getElementById("productID").focus();
// 				return false;
// 			}
			
		// 상품명 4~12글자
// 			if (!pname.test(fom.pname.value)) {
// 				alert('상품명은 4~12글자로')
// 				document.getElementById("pname").focus();
// 				return false;
// 			}
			
		// 상품 가격 숫자만 입력 + 음수 입력 불가능 + 소수점 2자리
// 			if ( !unitPrice.test(fom.unitPrice.value) || fom.unitPrice.value < 0 ) {
// 				alert('가격은 0이상의 숫자만');
// 				document.getElementById("price").focus();
// 				return false;
// 			}
// 			else {
// 				fom.unitPrice.value = parseFloat(fom.unitPrice.value).toFixed(2);
// 			}
			
		// 재고 수 숫자만 입력 
// 			if (!unitInStock.test(fom.unitInStock.value)) {
// 				alert('재고수는 숫자만');
// 				document.getElementById("unitInStock").focus();
// 				return false;
// 			}
		
			fom.submit();
		}

	</script>
	
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3"><%= greeting %></h1>
		</div>
	</div>
	
	<div class = "container">
		<div class="a" >
			<div class="b">
				<p>상품 코드 
				<p>상품명
				<p>가격
				<p style="margin-bottom: 40px;">상세 정보 
				<p>제조사
				<p>분류
				<p>재고 수
				<p>상태
				<p>이미지
			</div>
			<div class="c">
				<form name="fom" method="post" action="ProductInsert.jsp" enctype="multipart/form-data">
					<p><input type="text" name="productID" id="productID">
					<p><input type="text" name="pname" id="pname">
					<p><input type="text" name="unitPrice" id="unitPrice">
					<p><input type="text" name="description" style="height: 50px; width: 320px;" id="description"></p>
					<p><input type="text" name="menufacturer" id="menufacturer">
					<p><input type="text" name="category" id="category">
					<p><input type="text" name="unitInStock" id="unitInStock">
					<p><input type="radio" name="conditionn" value="신규 제품" id="conditionn"> 신규 제품
					   <input type="radio" name="conditionn" value="중고 제품" id="conditionn"> 중고 제품
					   <input type="radio" name="conditionn" value="재생 제품" id="conditionn"> 재생 제품 </p>
					<p><input type="file" name="fileName">
				</form>
			</div>
		</div>
	</div>
	<div class = "container">
		<input style="border: none;" type="button" value="등록" onclick="CheckAddProduct()" class="btn btn-primary btn">
		<input style="border: none; background: gray;" type="button" value="취소" onclick="location.href='ProductSelectAll.jsp'" class="btn btn-primary btn">
	</div>

</body>
</html>