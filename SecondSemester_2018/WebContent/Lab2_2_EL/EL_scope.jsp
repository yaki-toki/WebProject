<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>표현언어 내장객체 예제 1</title>
</head>
<body>
	<%
		int sum = 0;
		for(int i = 0; i <= 10; i++) sum+=i;
		request.setAttribute("sum", new Integer(sum));
	%>
	<jsp:forward page="EL_scope2.jsp"/>
</body>
</html>