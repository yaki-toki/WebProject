<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>
	<!-- https://kauth.kakao.com/oauth/authorize?client_id=620ca424e3826dc2d009a6dcdb21877f&redirect_uri=http://localhost:8080/example/oauth&response_type=code -->
	<P>The time on the server is ${serverTime}.</P>
	<h1>테스트</h1>
	<a href="/example/in/"><img src="./resources/image/kakao_account_login_btn_medium_wide.png"></a>
	<br />
	<img src="./resources/image/login.png" width="110" height="110">
</body>
</html>
