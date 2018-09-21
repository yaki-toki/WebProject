<%@page contentType="text/html; charset=euc-kr"%>
<%@taglib prefix="m" uri="/WEB-INF/Functions.tld"%>
<html>
<head>
<title>Expression Language</title>
</head>
<body>
<%
pageContext.setAttribute("test",request.getAttribute("number"));
%>
	<h2>EL의 정적 메소드</h2>
	123456789를 1000단위 구분 기호(,)로 표시하시오.
	<p />
	<b>result : ${m:comma(123456)}</b>
	<br>
	${pageScope.test}
</body>
</html>