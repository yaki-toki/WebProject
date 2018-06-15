<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="user.User"%>
<%@page import="user.UserDAO"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
		<div id="container">
			<label id="label">ID</label> <input type="text" id="userID"
				name="userID" value="<%=user.getUserID()%>"><br> <label
				id="label">Password</label> <input type="text" id="userPassword"
				name="userPassword" value="<%=user.getUserPassword()%>"><br>
			<label id="label">Name</label> <input type="text" id="userName"
				name="userName" value="<%=user.getUserName()%>"><br>
			<label id="label">Age</label> <input type="text" id="userAge"
				name="userAge" value="<%=user.getUserAge()%>"><br>
			<label id="label">Gender</label>
			<div>
				<%
					if (user.getUserGender().equals("Male")) {
				%>
				<input type="radio" id="userGender" name="userGender" value="Female">
				여자 <input type="radio" id="userGender" name="userGender"
					value="Male" checked>남자
				<%
					} else {
				%>
				<input type="radio" id="userGender" name="userGender" value="Female"
					checked>여자 <input type="radio" id="userGender"
					name="userGender" value="Male">남자
				<%
					}
				%>
			</div>
			<br> <label id="label">E-mail</label><input type="email"
				id="userEmail" name="userEmail" value="<%=user.getUserEmail()%>"><br>
			<label id="label">Phone</label><input type="tel" id="userPhone"
				name="userPhone" value="<%=user.getUserPhone()%>">
		</div>
		<input type="submit" value="정보수정">
	</form>
</body>
</html>