<!-- 201403010 김지하 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- 학번과 학년을 한 session안에서 유지 시킵니다. -->
	<c:set var="number" value="${fn:trim(param.number)}" scope="session" />
	<c:set var="grade" value="${param['grade'] }" scope="session" />

	<c:set var="number1" value="${fn:trim(number) }" scope="session" />
	<c:set var="number_code" value="${fn:substring(number,4,6) }" scope="session" />
	<c:if
		test="${ grade!=null && fn:length(number) == 9 || fn:length(number) == 8}">
		<!-- 학번 글자 수가 9자일 때와 학년을 선택한 경우에만  넘어가도록 했습니다. -->
		<c:redirect
			url="Lab1_apply.jsp" />
	</c:if>

	<!-- 위의 if조건이 충족되지 않으면 아래의 리다리렉트로 전 페이지로 돌아갑니다. -->
	<c:redirect
		url="Lab1.jsp" />

</body>
</html>