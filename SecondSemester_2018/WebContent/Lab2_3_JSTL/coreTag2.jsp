<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
request.setCharacterEncoding("EUC-KR");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSTL</title>
</head>
<body>
	<h2>Core Tags</h2>
	<c:if test="${param.id != null }">
		<b>${param.id }</b>
	</c:if>
	<c:if test="${param.id == null }">
		<b>Guest</b>
	</c:if>
	<c:choose>
		<c:when test="${param.color=='yellow' }">
			<c:set var="c" value="노란색" />
		</c:when>
		<c:when test="${param.color=='blue' }">
			<c:set var="c" value="파란색" />
		</c:when>
		<c:when test="${param.color=='orange' }">
			<c:set var="c" value="오렌지색" />
		</c:when>
		<c:when test="${param.color=='pink' }">
			<c:set var="c" value="핑크색" />
		</c:when>
		<c:otherwise>
			<c:set var="c" value="블랙" />
		</c:otherwise>
	</c:choose>
	님이 좋아하는 색상은
	<font color="${param.color}">${c}</font> 입니다

</body>
</html>