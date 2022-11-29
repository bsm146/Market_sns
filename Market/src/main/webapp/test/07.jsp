<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@page import="common.Person"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	Cookie cookie = new Cookie("ELCookie", "쿠키맛나요");	// 쿠키 생성
	cookie.setPath(request.getContextPath());			// 경로를 컨텍스트 루트로 설정
	cookie.setMaxAge(3600);								// 유지 시간을 1시간으로 설정
	response.addCookie(cookie);							// 응답 헤더에 쿠키 추가
%>

	<h3>쿠키 값 읽기</h3>
	<ul>
		<li>ELCoocki 값 : ${cookie.ELCookie.value}</li>
	</ul>
	
	<h3>HTTP 헤더 읽기</h3>
	<ul>
		<li>host : ${header.host }</li>
		<li>user-agent : ${header['user-agent'] }</li>
		<li>cookie : ${header.cookie }</li>
	</ul>
	
	<h3>컨텍스트 초기화 매개변수 읽기</h3>
	<ul>
		<li>mysqlID : ${initParam.MysqlID }</li>
	</ul>
	
	<h3>컨텍스트 루트 경로 읽기</h3>
	<ul>
		<li>${pageContext.request.contextPath }</li>
	</ul>
</body>
</html>