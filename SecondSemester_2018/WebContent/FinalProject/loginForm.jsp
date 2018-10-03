<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<form action="login_ok.jsp" method="post">
	로그인 Form <br>
	<div class="loginTable">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userID" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="userPassword" /></td>
			</tr>
		</table>
	</div>
	<input type="submit" value="로그인" class="buttonLogin">
</form>
</html>