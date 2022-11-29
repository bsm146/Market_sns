<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="04.jsp" method="post" name="frm">
		이름 <input type="text" name="name"><br>
		성별 <input type="radio" name="gender" value="man">남자
			<input type="radio" name="gender" value="woman">여자<br>
		학력
			<select name="grade">
				<option value="ele">초딩</option>
				<option value="mid">중딩</option>
				<option value="high">고딩</option>
				<option value="uni">대딩</option>
			</select><br>
		관심사항
			<input type="checkbox" name="inter" value="pol">정치
			<input type="checkbox" name="inter" value="eco">경제
			<input type="checkbox" name="inter" value="ent">연예
			<input type="checkbox" name="inter" value="spo">운동<br>
			<input type="submit" value="전송">
	</form>
	
</body>
</html>