<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <jsp:useBean id="TestBean" class="javabeans.TestBean" scope="request" />
    <!-- scope가 page인 경우 이름은 동일해도 다른 객체가 된다. -->
    <!-- 하지만, scope가 request인 경우 이름이 동일하면 동일한 객체로 인식한다. -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%=TestBean.getId() %>
</body>
</html>