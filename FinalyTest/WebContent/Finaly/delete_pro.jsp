<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="user.CarDAO, user.UserDAO"%>
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
			String userID = (String) session.getAttribute("userID");
			CarDAO cardao = new CarDAO();
			UserDAO userdao = new UserDAO();
			String CarNumber = cardao.SearchNumber(userID);
			
			/*
				차량 번호가 등록이 되어있는 경우 member테이블과 car테이블이 연동되어 있기 때문에
				car테이블에 연결된 정보를 먼저 삭제한 후 member테이블에서 정보를 지워야 한다.
			*/
			if (CarNumber != null) {
				// 차량 번호가 존재하는 경우
				// car테이블 에서 먼저 삭제
				if (cardao.DeleteNumber(userID) == -1) {
					out.println("<script>");
					out.println("alert('DB오류1')");
					out.println("</script>");
				} else {
					// 그 다음 member테이블에서 삭제
					if (userdao.DeleteUser(userID) == -1) {
						out.println("<script>");
						out.println("alert('DB오류2')");
						out.println("</script>");
					} else {
						out.println("<script>");
						out.println("alert('회원탈퇴가 완료되었습니다.')");
						out.println("location.href='logout.jsp'");
						out.println("</script>");
					}
				}
			} else {
				// 차량 번호가 등록되어있지 않은 경우 member테이블 에서만 삭제한다.
				if (userdao.DeleteUser(userID) == -1) {
					out.println("<script>");
					out.println("alert('DB오류3')");
					out.println("</script>");
				} else {
					out.println("<script>");
					out.println("alert('회원탈퇴가 완료되었습니다.')");
					out.println("location.href='logout.jsp'");
					out.println("</script>");
				}
			}
		}
	%>
</body>
</html>