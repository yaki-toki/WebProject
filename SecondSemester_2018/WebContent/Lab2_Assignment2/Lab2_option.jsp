<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 선언한 태그를 받아온다. -->
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<fmt:requestEncoding value="euc-kr" />
	<c:set var="menu" value="${paramValues.menu }" />
	
	<!-- 앞에서 전송한 매뉴를 받아와서 선택한 수를 검사한다. -->
	<c:if test="${fn:length(paramValues.menu) != 0}">
		<c:forEach var="menu" items="${menu }">
			${menu }
			<tf:select name="${menu }_tem" ice="ice" hot="hot" />
			<tf:select name="${menu }_size" tall="tall" grande="grande" venti="venti" />
			<br>
		</c:forEach>
	</c:if>
	
	<!-- 선택한 값이 없는경우 출력 -->
	<c:if test="${fn:length(paramValues.menu) == 0 }">
		선택안함
	</c:if>
</body>
</html>