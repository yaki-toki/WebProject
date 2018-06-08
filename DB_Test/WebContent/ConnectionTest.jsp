<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String driverName = "com.mysql.jdbc.Driver";
	String jdbcUrl = "jdbc:mysql://localhost:3306/test12";
	String dbId = "kjh_tester";
	String dbPass = "9509";

		try {
			//[1] JDBC 드라이버 로드
			Class.forName(driverName);
			out.println("mysql jdbc Driver registered!!");
			out.println("<br>");
			//[2]데이타베이스 연결 
			Connection conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			out.println("DB연결성공!!");

			//[3]데이타베이스 연결 해제
			conn.close();
		} catch (ClassNotFoundException e) {
			out.println("Where is your mysql jdbc driver?");
			e.printStackTrace();
			return;
		}
	%><br>
	<br>

</body>
</html>