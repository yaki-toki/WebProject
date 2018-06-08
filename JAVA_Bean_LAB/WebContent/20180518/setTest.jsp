<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="test" class="javabeans.TestBean">
		<jsp:setProperty name="test" property="pwd" param="pwd" />
	</jsp:useBean>
	<%=test.getId()%><!-- 출력할 갯수와 javabean의 변수 명이 동일해야 정확하게 모두 출력 -->
	<%=test.getPwd()%>
</body>
</html>