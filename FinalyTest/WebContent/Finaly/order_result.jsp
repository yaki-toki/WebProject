<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO, user.CarDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		if (session.getAttribute("userID") == null) {
			out.println("<script>");
			out.println("alert('로그인 후 이용해 주세요')");
			out.println("main.back()");
			out.println("</script>");
		} else {
			String userID = (String) session.getAttribute("userID");
			String modelID = request.getParameter("order_modelID");
			String number = request.getParameter("carNumber1") + request.getParameter("carNumber2")
					+ request.getParameter("carNumber3");
			CarDAO cardao = new CarDAO();
			if (cardao.InsertCar(number, userID, modelID) == -1) {
				%>
					<script>
						alert("이미 존재하는 번호 입니다.")
						history.back()
					</script>
				<%
			} else {
				%>
					회원 등록에 성공하였습니다.
				<%
			}
		}
	%>

</body>
</html>