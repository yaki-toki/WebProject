<!-- 201403010 김지하 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>수강 신청 시스템</title>
</head>
<body>
	<h1>수강 신청 시스템</h1>
	<hr width="400" align="left">
	<form action="Lab1_processing.jsp" method="POST">
		학번 : <input type="text" maxlength="9" name = "number"><br />
		학년<br /> 
		1학년 <input type="radio" name="grade" value="1"> 
		2학년 <input type="radio" name="grade" value="2">
		3학년 <input type="radio" name="grade" value="3"> 
		4학년 <input type="radio" name="grade" value="4"><br />
		<input type="submit" value="확인">
	</form>
</body>
</html>