<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>템플릿 페이지 입니다.1</h2>

	<c:if test="${userID != null && userPassword != null }">
		<c:out value="${param.userID }" />
		<br />
		<c:out value="${param.userPassword }" />
		<br />
		<form action = "login_out.jsp" method="post">
			<input type="submit" value="로그아웃"/>
		</form>
	</c:if>

	<c:if test="${userID == null || userPassword == null }">
		<c:import url="loginForm.jsp"/>
	</c:if>
	
	<div id="content">
		<jsp:include page="${pagefile }.jsp" />
	</div>

	<h3>템플릿 페이지 입니다.2</h3>

</body>
</html>