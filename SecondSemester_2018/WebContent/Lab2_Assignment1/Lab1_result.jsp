<!-- 201403010 김지하 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>수강 신청 결과</title>
</head>
<body>
	<fmt:requestEncoding value="euc-kr" />
	<h2>수강 신청 결과</h2>
	<br>
	<hr width="400" align="left">
	<c:out value="${number }" />
	님의 수강신청 결과
	<br><br>
	<!-- 넘겨온 값을 출력 해 줍니다. -->
	<c:forEach var="item" items="${paramValues.sub }">
		<strong><c:out value="${item }" /></strong>
		<br>
	</c:forEach>
</body>
</html>