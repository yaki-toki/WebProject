<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tf" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%
	// 매뉴를 선언
	String[] menu = { "아메리카노", "카페라떼", "바닐라라떼" };
%>
<body>
	<h1>커피 주문</h1>
	<form action="Lab2_option.jsp" method="post">
		<h1>커피 주문</h1>
		
		<tf:check_tag name="coffee" coffee1="아메리카노" coffee2="카페라떼" coffee3="바닐라라떼" />
		
		<input type="submit" value="옵션선택">
	</form>
</body>
</html>