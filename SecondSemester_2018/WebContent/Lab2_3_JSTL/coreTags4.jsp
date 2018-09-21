<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSTL</title>
</head>
<body>
	<h2>Core Tags4</h2>
	<hr width="150" align="left" />
	<c:import
		url="http://localhost:8085/SecondSemester_2018/Lab2_3_JSTL/coreTag2.jsp">
		<c:param name="id" value="JSP" />
		<c:param name="color" value="orange" />
	</c:import>
	<hr width="360" align="left" />
	<c:url var="url1" value="https://www.google.co.kr/">
		<c:param name="q" value="JSP" />
		<c:param name="safe" value="off" />
	</c:url>
	<a href="${url1 }">구글에서 JSP 검색</a>

</body>
</html>