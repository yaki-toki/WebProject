<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="user.CarDAO"%>
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
			CarDAO cardao = new CarDAO();
			String carNumber = request.getParameter("Car");
			if (cardao.DeleteCar(carNumber) == -1) {
				out.println("<script>");
				out.println("alert('등록취소에 실패하였습니다.')");
				out.println("history.back()");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('등록취소에 성공하였습니다.')");
				out.println("location.href='main.jsp'");
				out.println("</script>");
			}
		}
	%>
</body>
</html>