<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Formatting Tags3</title>
</head>
<body>
	<h2>Formatting Tags3</h2>

	<c:set var="dayTime" value="<%=new Date()%>" />
	<c:out value="${dayTime}" />
	<br />
	<fmt:formatDate value="${dayTime }" type="date" dateStyle="full" />
	<br />
	<fmt:formatDate value="${dayTime }" type="time" />
	<p />

	<c:set var="today" value="10/01/13 7:03 PM" />
	<fmt:parseDate value="${today}" type="both" parseLocale="en_US"
		dateStyle="short" timeStyle="short" var="now" />
	<c:out value="${now}" />
	<br />
	<p />


	<fmt:timeZone value="Europe/London">
	Europe/London : <fmt:formatDate value="${dayTime }" type="both"
			dateStyle="full" timeStyle="full" />
		<br />
	</fmt:timeZone>

	<fmt:setTimeZone value="America/New_York" />
	America/New_York :
	<fmt:formatDate value="${dayTime}" type="both" dateStyle="full"
		timeStyle="full" />
	<br />

	<!-- 22번줄; var = "now" : now라는 변수에 파싱 된 데이터를 저장하는 변수로 사용한다. -->
</body>
</html>