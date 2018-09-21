<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	session.setAttribute("id", "test");
	application.setAttribute("siteName", "jsp");
%>
<html>
<head>
<title>표현언어 내장객체 2</title>
</head>
<body>
	<h2>EL의 Scope2</h2>
	<jsp:forward page="EL_scope4.jsp" />
</body>
</html>