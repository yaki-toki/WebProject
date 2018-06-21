<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO, user.CarDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		String userID = (String)session.getAttribute("userID");
		String modelID = request.getParameter("order_modelID");
		String number = request.getParameter("carNumber1")+request.getParameter("carNumber2")+request.getParameter("carNumber3");
	%>
	userID <%=userID %> <br>
	modelID <%=modelID %> <br>
	number <%=number %> <br>
</body>
</html>