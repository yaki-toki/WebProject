<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="user.User"%>
<%@page import="user.UserDAO"%>
<%@page import="user.CarDAO"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	<jsp:useBean id="user" class="user.User">
		<jsp:setProperty name="user" property="*" />
		<!-- beans페키지 내에 있는 Information파일을 불러온다. -->
		<!-- property의 값을 *로 선언하면 모든 변수를 가져오는 것 -->
	</jsp:useBean>
	<%!UserDAO dao = new UserDAO();
	ResultSet rs = null;%>
	<%
		rs = dao.SetUser(user.getUserID());
			user.setUserID(rs.getString(1));
			user.setUserPassword(rs.getString(2));
			user.setUserName(rs.getString(3));
			user.setUserAge(rs.getInt(4));
			user.setUserGender(rs.getString(5));
			user.setUserEmail(rs.getString(6));
			user.setUserPhone(rs.getString(7));
	%>
	<form action="update_pro.jsp" method="post">
		<div id="session">
			<table>
				<tr>
					<td><label id="label">ID</label></td>
					<td><input type="text" id="userID" name="userID"
						value="<%=user.getUserID()%>" readonly></td>
				</tr>
				<tr>
					<td><label id="label">Password</label></td>
					<td><input type="text" id="userPassword" name="userPassword"
						value="<%=user.getUserPassword()%>"></td>
				</tr>
				<tr>
					<td><label id="label">Name</label></td>
					<td><input type="text" id="userName" name="userName"
						value="<%=user.getUserName()%>"></td>
				</tr>
				<tr>
					<td><label id="label">Age</label></td>
					<td><input type="text" id="userAge" name="userAge"
						value="<%=user.getUserAge()%>"></td>
				</tr>
				<tr>
					<td><label id="label">Gender</label></td>
					<td>
						<%
							if (user.getUserGender().equals("Male")) {
						%> <input type="radio" id="userGender" name="userGender"
						value="Female"> 여자 <input type="radio" id="userGender"
						name="userGender" value="Male" checked> 남자 <%
						 	} else {
						%> <input type="radio" id="userGender" name="userGender" value="Female" checked> 여자 
						<input type="radio" id="userGender" name="userGender" value="Male">남자 
						<%
						 	}
						%>
					</td>
				</tr>
				<tr>
					<td><label id="label">E-mail</label></td>
					<td><input type="email" id="userEmail" name="userEmail"
						value="<%=user.getUserEmail()%>"></td>
				</tr>
				<tr>
					<td><label id="label">Phone</label></td>
					<td><input type="tel" id="userPhone" name="userPhone"
						value="<%=user.getUserPhone()%>"></td>
				</tr>
			</table>
			
			<input type="submit" value="정보수정"> <input type="button"
				value="회원탈퇴" onclick="location.href='delet_pro.jsp'">
		</div>
		<br>
		<%
			CarDAO car = new CarDAO();
				if (car.SearchNumber(user.getUserID()) == null) {
		%>
		<div id="session">
			<h2>등록된 차량이 없습니다.</h2>
		</div>
		<%
			} else {
		%>
		<div id="session">
			<table>
				<thead>
					<tr>
						<td>차량번호</td>
						<td>사용자 이름</td>
						<td>차량 이름</td>
						<td>년식</td>
						<td>최대인원</td>
						<td>기어</td>
					</tr>
				</thead>
				<%
					rs = dao.UserData(user.getUserID());
							while (rs.next()) {
								out.print("<tr>");
								out.println("<td>" + rs.getString(1) + "</td>");
								out.println("<td>" + rs.getString(2) + "</td>");
								out.println("<td>" + rs.getString(3) + "</td>");
								out.println("<td>" + rs.getInt(4) + "년식 </td>");
								out.println("<td>" + rs.getInt(5) + "명 </td>");
								out.println("<td>" + rs.getString(6) + "</td>");
								out.print("</tr>");
							}
				%>
			</table>
			<input type="button" value="차량등록취소"
				onclick="location.href='main.jsp?pagefile=CarSelectDelete'">
		</div>
		<%
			}
		%>
	</form>
	<%
		}
	%>
</body>
</html>