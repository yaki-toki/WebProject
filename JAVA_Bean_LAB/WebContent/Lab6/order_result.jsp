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
<style>
h2{
margin:auto;
}
</style>
</head>
<body>
	<h1> > 주문완료 < </h1>
	<h2><%=session.getAttribute("id")%>님!</h2><br><br>
	<!-- 세션에 설정된 값을 출력 -->
	<h2><%=request.getParameter("name")%></h2>
	<!-- 주문한 품목을 출력 -->
	<h3>을 주문하셨습니다.</h3>
	<br>
	<h2>금액</h2>
	<%=request.getParameter("money")%>원
	<!-- 금액 출력 -->
	<br><br> <h2>> 요청사항 < </h2>
	<br>
	<%
		String user = request.getParameter("contents");
		out.print(user.replace("\n","<br>"));
		// 사용자가 요청한 내용을 출력하고 엔터를 친 상황이 있으면 줄 바꿈
	%>
</body>
</html>