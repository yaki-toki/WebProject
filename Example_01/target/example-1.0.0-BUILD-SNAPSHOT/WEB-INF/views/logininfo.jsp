<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 세션에서 token을 가져와서 출력한다. -->
	${sessionScope.token}
	<c:if test="${token } == null">
	</c:if>
	<c:if test="${token } != null">
		<h1>됬다</h1>
	</c:if>
	<br />
	<a href="/example/logout/">로그아웃</a>
	<br />
	<a href="/example/info/">사용자 정보</a>
	<br />
	<a href="/example/agree/">사용자 동의</a>
	<br />
	<a href="/example/profile/">사용자 프로필</a>
</body>
</html>