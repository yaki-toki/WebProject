<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SQL Tags2</title>
</head>
<body>
	<fmt:requestEncoding value="euc-kr" />
	<h2>SQL Tags2</h2>
	<sql:update dataSource="${db}">
		update member3 set mem_name=? where mem_id=?
		<sql:param value="${param.name }" />
		<sql:param value="${'test@naver.com' }" />
	</sql:update>
	업데이트를 하였습니다.
	<br />
	<a href="sqlTag1.jsp">SELECT</a>
</body>
</html>