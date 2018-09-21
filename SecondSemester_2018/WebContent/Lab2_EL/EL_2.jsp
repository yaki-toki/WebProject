<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page isELIgnored="true" %>
    <!-- 표현식을 무시한다. -->
    <%request.setAttribute("siteName","JSP"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>표현 언어 예제 2</title>
</head>
<body>
<h2>EL의 기본 문법2</h2>
사이트 명 : <b>${siteName}</b>
</body>
</html>