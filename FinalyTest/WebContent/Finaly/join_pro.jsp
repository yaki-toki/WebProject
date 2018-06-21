<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="user.UserDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if (session.getAttribute("userID") == null) {
	%><jsp:useBean id="user" class="user.User">
		<jsp:setProperty name="user" property="*" />
	</jsp:useBean>
	<%
		//현재 날짜와 시간을 주문 시간으로 지정
			user.setReg_date(new Timestamp(System.currentTimeMillis()));
			String userID = null;
			if (session.getAttribute("userID") != null) {
				userID = (String) session.getAttribute("userID");
			}
			if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
					|| user.getUserAge() == 0 || user.getUserGender() == null || user.getUserEmail() == null
					|| user.getUserPhone() == null) {
				out.println("<script>");
				out.println("alert('입력이 안 된 사항이 있습니다.')");
				out.println("history.back()");
				out.println("</script>");
				System.out.println(user.getUserID());
				System.out.println(user.getUserPassword());
				System.out.println(user.getUserName());
				System.out.println(user.getUserAge());
				System.out.println(user.getUserGender());
				System.out.println(user.getUserEmail());
				System.out.println(user.getUserPhone());
			} else {
				UserDAO userDAO = new UserDAO();
				int result = userDAO.join(user);
				if (result == -1) {
					out.println("<script>");
					out.println("alert('이미 존재하는 ID입니다.')");
					out.println("history.back()");
					out.println("</script>");
				} else {
					session.setAttribute("userID", user.getUserID());
					out.println("<script>");
					out.println("location.href = 'main.jsp'");
					out.println("</script>");
				}
			}
	%>
	<%
		}else{
			out.println("<script>");
			out.println("alert('로그아웃 후 이용해 주세요.')");
			out.println("main.back()");
			out.println("</script>");
		}
	%>

</body>
</html>