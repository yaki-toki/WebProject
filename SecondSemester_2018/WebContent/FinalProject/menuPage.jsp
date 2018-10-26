<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<c:choose>
	<c:when test="${not empty menu && menu eq 'menu1'}">
		<c:import url="http://localhost:8080/SecondSemester_2018/FinalProject/board/list.jsp"></c:import>
	</c:when>
	<c:when test="${not empty menu && menu eq 'menu2'}">
		2번
	</c:when>
	<c:when test="${not empty menu && menu eq 'menu3'}">
		3번
	</c:when>
	<c:when test="${not empty menu && menu eq 'menu4'}">
		4번
	</c:when>
	<c:otherwise>
		<c:out value="응 페이지 없어 돌아가~"/>
	</c:otherwise>
</c:choose>
<c:redirect url="index.jsp?pagefile=menuPage" />
</html>