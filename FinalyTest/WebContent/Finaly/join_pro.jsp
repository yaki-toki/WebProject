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
				userID = (String)session.getAttribute("userID");
				// 세션이 설정 된 경우 userID의 값을 해당 세션의 id값으로 설정
			}
			if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
					|| user.getUserAge() == 0 || user.getUserGender() == null || user.getUserEmail() == null
					|| user.getUserPhone() == null) {
				out.println("<script>");
				out.println("alert('입력이 안 된 사항이 있습니다.')");
				out.println("history.back()");
				out.println("</script>");
				// 입력이 안되있는 항목이 있는 경우
				
			} else {
				UserDAO userDAO = new UserDAO();
				int result = userDAO.join(user);
				// join부분을 실행시켜서 값을 반환 받는다.
				
				if (result == -1) {
					// join실패
					out.println("<script>");
					out.println("alert('이미 존재하는 ID입니다.')");
					out.println("history.back()");
					out.println("</script>");
				} else {
					// join성공시 세션을 자동으로 설정
					session.setAttribute("userID", user.getUserID());
					out.println("<script>");
					out.println("location.href = 'main.jsp'");
					out.println("</script>");
				}
			}
	%>
	<%
		}else{
			// 로그인이 되어있는 경우는 join을 할 수 없음
			out.println("<script>");
			out.println("alert('로그아웃 후 이용해 주세요.')");
			out.println("main.back()");
			out.println("</script>");
		}
	%>

</body>
</html>