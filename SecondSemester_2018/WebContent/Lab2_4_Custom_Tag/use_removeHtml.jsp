<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:set var="dateEL" value="<%=new Date()%>" />
	<tf:removeHtml trim="true">
		<font size="10">현재
			<style>시간</style>은 ${dateEL} 입니다.
		</font>
	</tf:removeHtml>
	<br>
	<!-- length가 15이기 때문에 문자열을 0~15로 자르게 된다. -->
	<!-- 잘려진 문자열 뒷 부분에는 '...'을 붙여준다. -->
	<tf:removeHtml length="15" trail="..." trim="true">
		<u>현재 시간</u>은 <b>${dateEL }</b> 입니다.
</tf:removeHtml>
	<br>
	<tf:removeHtml length="15">
		<jsp:body>
			<u>현재 시간</u>은 <b>${dateEL }</b> 입니다.
		</jsp:body>
	</tf:removeHtml>
</body>
</html>