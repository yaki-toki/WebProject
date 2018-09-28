<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<fmt:requestEncoding value="euc-kr"/>
	<h2>SQL Tags4</h2>
	<sql:update dataSource="${db}">
		insert member3 value (?,?)
		<sql:param value="${param.id }" />
		<sql:param value="${param.name}" />
	</sql:update>
	데이터를 추가하였습니다.
	<br />
	<a href="sqlTag1.jsp">SELECT</a>
</body>
</html>