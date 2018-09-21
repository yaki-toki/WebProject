<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    	String studyArr[] = {"Java","JSP","Android"};
    	pageContext.setAttribute("study",studyArr);
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>표현언어 배열 예제</title>
</head>
<body>
<h2>EL의 Array</h2>
<b>Java Program 과목</b>
<hr width="150" align="left"/>
1. ${study[0] }<br/>
2. ${study[1] }<br/>
3. ${study[2] }<br/>
</body>
</html>