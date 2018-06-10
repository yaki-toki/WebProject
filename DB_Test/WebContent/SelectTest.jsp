<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<thead>
			<tr>
				<td >Num</td>
				<td>ID</td>
				<td>Password</td>
				<td>Date</td>
				<td>Name</td>
				<td>Address</td>
				<td>Tel</td>
			</tr>
		</thead>
		<tbody>
			<%
			String DB_URL = "jdbc:mysql://localhost:3306/test12";
			String DB_USER = "kjh_tester";
			String DB_PASSWORD = "9509";
				Connection conn;
				Statement stmt;
				ResultSet rs = null;
				String query = "select * from member";
				try {
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
					stmt = conn.createStatement();
					rs = stmt.executeQuery(query);
					out.print("result: </br>");
					String s;
					while (rs.next()) {
						out.print("<tr>");
						out.println("<td>" + rs.getString(1) + "</td>");
						s = rs.getString(2);
						s = new String(s.getBytes());
						out.println("<td>" + s + "</td>");
						s = rs.getString(3);
						s = new String(s.getBytes());
						out.println("<td>" + s + "</td>");
						s = rs.getString(4);
						s = new String(s.getBytes());
						out.println("<td>" + s + "</td>");
						s = rs.getString(5);
						s = new String(s.getBytes());
						out.println("<td>" + s + "</td>");
						s = rs.getString(6);
						s = new String(s.getBytes());
						out.println("<td>" + s + "</td>");
						s = rs.getString(7);
						s = new String(s.getBytes());
						out.println("<td>" + s + "</td>");
						out.print("</tr>");
					}
					rs.close();
					stmt.close();
					conn.close();
				} catch (Exception e) {
					out.print("Exception Error...");
					out.print(e.toString());

				}
			%>
		</tbody>
	</table>
</body>
</html>