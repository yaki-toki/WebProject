<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="t" uri="/WEB-INF/tlds/WelcomeTag.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Custom Tag1</title>
</head>
<body>
	<h1>First Custom Tag</h1>
	<font color="red"> 
		<t:welcome />
		<!-- 클래스에서 선언했던 문자열이 출력 됨 -->
	</font>
	<!-- TLD(Tag Library Directives) 태그 라이브러리 지시자 -->
	<!-- uri가 너무 길게 된다면 web.xml을 수정 해 주면 된다. -->
</body>
</html>