<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="TestBean" class="javabeans.TestBean" scope="page">
	<jsp:setProperty name="TestBean" property="id" />
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form>
		<%=TestBean.getId()%>
		<%
			TestBean.setId("Underground");
		%>
		<!-- return 값이 없는 경우 스크립트릿 사용 -->
		<b><%=TestBean.getId()%></b>
		<!-- jsp:forward page="useBeanTest2.jsp" /-->
	</form>
</body>
</html>
