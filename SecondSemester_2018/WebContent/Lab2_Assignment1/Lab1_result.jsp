<!-- 201403010 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ��û ���</title>
</head>
<body>
	<fmt:requestEncoding value="euc-kr" />
	<h2>���� ��û ���</h2>
	<br>
	<hr width="400" align="left">
	<c:out value="${number }" />
	���� ������û ���
	<br><br>
	<!-- �Ѱܿ� ���� ��� �� �ݴϴ�. -->
	<c:forEach var="item" items="${paramValues.sub }">
		<strong><c:out value="${item }" /></strong>
		<br>
	</c:forEach>
</body>
</html>