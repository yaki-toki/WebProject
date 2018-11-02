<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="myStyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>
	<div class="header">
		<c:import url="headerMenu.jsp" />
	</div>

	<div class="nav">
		<c:import url="menu.jsp" />
	</div>

	<div class="section">
		<c:import url="${pagefile }.jsp" />
		<h2>Session</h2>
	</div>

	<div class="aside">
		
		<c:if test="${flag ==1}">
			<c:out value="${userid }" />
			<br />
			<c:out value="${userpassword }" />
			<br />
			<form action="login_out.jsp" method="post">
				<button type="submit" class="button1" style="font-size:13px;">Log Out</button>
			</form>
		</c:if>

		<c:if test="${flag==null}">
			<c:import url="loginForm.jsp" />
		</c:if>
	</div>


	<div class="footer">
		<h3>템플릿 페이지 입니다.2</h3>
	</div>

</body>
</html>