<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- 201403010 김지하 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		session.setAttribute("id", id);
		//세션을 생성한다.
		//id파라미터의 값을 사용자가 입력해서 받아온 id를 사용

		//response.sendRedirect("main.jsp");
	%>
	<jsp:forward page="main.jsp">
		<jsp:param name="id" value="<%=id%>" />
		<jsp:param name="pwd" value="<%=pwd%>" />
		<jsp:param name="pagefile" value="list" />
	</jsp:forward>
	<!-- 로그인 버튼을 눌렀을 경우 입력한 값들과 pagefile의 값을 list로 변경해서 main에 전달 -->

</body>
</html>