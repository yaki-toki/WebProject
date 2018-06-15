<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="user.User"%>
<%@page import="user.UserDAO"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%!
		UserDAO dao = new UserDAO();
		ResultSet rs = dao.SetUser("test");
		User user  = new User();
	%>
	<%
	user.setUserID(rs.getString(2));
	user.setUserPassword(rs.getString(3));
	user.setUserName(rs.getString(4));
	user.setUserAge(rs.getInt(5));
	user.setUserGender(rs.getString(6));
	user.setUserEmail(rs.getString(7));
	user.setUserPhone(rs.getString(8));
	%>
	<%=user.getUserID() %>
</body>
</html>