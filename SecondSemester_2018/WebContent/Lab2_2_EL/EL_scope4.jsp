<%@ page contentType="text/html; charset=EUC-KR"%>
<html>
<head>
<title>표현언어 내장객체 2</title>
</head>
<body>
	<h2>EL의 Scope2</h2>
	id(sessionScope로 받은값) :
	<b>${sessionScope.id}</b>
	<p />
	siteName(applicationScope로 받은값) :
	<b>${applicationScope.siteName}</b>
	<p />
	<a href="EL_scope5.jsp">EL_scope5.jsp로 이동</a>
</body>
</html>