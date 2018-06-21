<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String carNumber = request.getParameter("searchNumber1") + request.getParameter("searchNumber2")
				+ request.getParameter("searchNumber3");
		UserDAO dao = new UserDAO();
		ResultSet rs = dao.SearchData(carNumber);
		if (rs == null) {
			out.println("<script>");
			out.println("alert('검색된 정보가 없습니다.')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			%>
			<table>
				<thead>
					<tr>
						<td>차량번호</td>
						<td>사용자 이름</td>
						<td>전화 번호</td>
					</tr>
				</thead>
				<%
					while (rs.next()) {
						out.print("<tr>");
						out.println("<td>" + rs.getString(1) + "</td>");
						out.println("<td>" + rs.getString(2) + "</td>");
						out.println("<td>" + rs.getString(3) + "</td>");
						out.print("</tr>");
					}
				%>
			</table>
			<p style="text-align:right;">
			<input type="button" value="뒤로가기" onclick="history.back()">
			<input type="button" value="메인으로" onclick="location.href='main.jsp'">
			<%
		}
	%>
</body>
</html>