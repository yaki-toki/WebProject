<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		if ((session.getAttribute("userID") == null)) {
			out.println("<script>");
			out.println("alert('로그인을 먼저 해주세요.')");
			out.println("location.href='main.jsp'");
			out.println("</script>");
		} else {
	%>
	<form action="./main.jsp?pagefile=CarDelete_pro" method="post">
		<%!String driverName = "com.mysql.jdbc.Driver";%>
		<%!String url = "jdbc:mysql://203.255.177.208:3306/test12";%>
		<%!String user = "test12";%>
		<%!String psw = "test1234";%>
		<%
			String userID = (String) session.getAttribute("userID");
				Connection con = null;
				PreparedStatement ps = null;
				try {
					Class.forName(driverName);
					con = DriverManager.getConnection(url, user, psw);
					String sql = "SELECT * FROM car where userID = '" + userID + "'";
					ps = con.prepareStatement(sql);
					ResultSet rs = ps.executeQuery();
		%>
		<p>
			Select Car Number : <select id="Car" name="Car">
				<option value=null>차량번호</option>
				<%
					while (rs.next()) {
								String carNumber = rs.getString("carNumber");
				%>
				<option value="<%=carNumber%>"><%=carNumber%></option>
				<%
					}
				%>
			</select>
		</p>
		<%
			} catch (SQLException sqe) {
					out.println(sqe);
				}
		%>
		<p align="right">
			<input type="submit" value="등록취소">
	</form>
	<%
		}
	%>

</body>
</html>