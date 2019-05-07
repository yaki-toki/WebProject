<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>
	<!-- https://kauth.kakao.com/oauth/authorize?client_id=620ca424e3826dc2d009a6dcdb21877f&redirect_uri=http://localhost:8080/example/oauth&response_type=code -->
	<P>The time on the server is ${serverTime}.</P>
	<h1>테스트</h1>
	<input type="button" value="로그인" id="kakao-login-btn"
		onclick="location.href = 'https://kauth.kakao.com/oauth/authorize?client_id=620ca424e3826dc2d009a6dcdb21877f&redirect_uri=http://localhost:8080/example/oauth&response_type=code'">
	<br />

</body>
</html>
