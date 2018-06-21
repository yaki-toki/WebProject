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
	<!-- 해당 회원에게 등록된 차량 번호를 불러오는 부분 -->
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
							// 해당 ID에 등록된 차량 번호를 모두 출력시킴
							String carNumber = rs.getString("carNumber");
				%>
				<!-- 차량 번호를 while문을 반복 하면서 option을 생성 -->
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
			<input type="submit" value="등록해제">
			<input type="button" value="취소" onclick="location.href='main.jsp'">
	</form>
	<%
		}
	%>

</body>
</html>