<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="user.Car"%>
<%@ page import="user.CarDAO"%>
<%@ page import="java.sql.*"%>
<!-- 201403010 김지하 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="car" class="user.Car" scope="request">
		<jsp:setProperty name="car" property="*" />
	</jsp:useBean>
	<%
		if (session.getAttribute("userID") == null) {
			//세션이 설정되지 않은 경우
	%>
	<h1>
		<strong>로그인을 해주세요</strong>
	</h1>

	<%
		} else {
			//세션이 설정 되어있는 경우 구매 열을 출력
	%>
	<h1>
		<strong>상품정보</strong>
	</h1>
	<form action="./main.jsp?pagefile=order" method="post">
		<%!String driverName = "com.mysql.jdbc.Driver";%>
		<%!String url = "jdbc:mysql://203.255.177.208:3306/test12";%>
		<%!String user = "test12";%>
		<%!String psw = "test1234";%>
		<%
			Connection con = null;
				PreparedStatement ps = null;
				try {
					Class.forName(driverName);
					con = DriverManager.getConnection(url, user, psw);
					String sql = "SELECT * FROM model";
					ps = con.prepareStatement(sql);
					ResultSet rs = ps.executeQuery();
		%>
		<p>
			Select Name : <select id="listModel" name="listModel">
				<option value=null>모델번호</option>
				<%
					while (rs.next()) {
								String modelID = rs.getString("modelID");
				%>
				<option value="<%=modelID%>"><%=modelID%></option>
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

			<input type="submit" value="구매하기">
	</form>
	<%
		}
	%>
</body>
</html>