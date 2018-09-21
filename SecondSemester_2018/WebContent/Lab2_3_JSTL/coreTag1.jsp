<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String str1 = "JAVA의 JSTL";
	String str2 = null;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JSTL</title>
</head>
<body>
	<h2>Core Tags1</h2>
	<c:set var="str3" value="JSP" scope="page" />
	<c:set var="str4" value="JSTL" scope="session" />
	-
	<c:out value="<%=str1%>" default="기본출력값" />
	<br /> -
	<c:out value="<%=str2%>" default="기본출력값" />
	<br /> -
	<c:out value="${str3 }" default="기본출력값" />
	<br />
	<c:remove var="str4" />
	<p />
	<%
		String s = (String) pageContext.getAttribute("str3");
	%>
	-
	<font color="red"><b><%=s%></b></font> - ${str3 }의 ${str4 } ...
</body>
</html>