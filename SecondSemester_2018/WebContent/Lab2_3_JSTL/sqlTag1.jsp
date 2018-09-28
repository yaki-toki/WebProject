<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource
	url="jdbc:mysql://localhost:3306/test12?useUnicode=true&characterEncoding=EUC_KR"
	driver="org.gjt.mm.mysql.Driver" user="user" password="password"
	var="db" scope="application"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SQL Tags1</title>
</head>
<body>
	<h2>SQL Tags1</h2>

	<sql:query var="lists" dataSource="${db }">
		select mem_id, mem_name from member3
		</sql:query>

	<c:forEach var="member" items="${lists.rows }">
		${member }<br />
	</c:forEach>
</body>
</html>
