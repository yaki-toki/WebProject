<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Formatting Tags1</title>
</head>
<body>
<h2>Formatting Tags1</h2>
<fmt:setLocale value="ko_kr"/>
<fmt:requestEncoding value="euc-kr"/>
name : <%=request.getParameter("name") %>
<form method="post">
name : <input type="text" name="name">
<input type="submit">
</form>
</body>
</html>