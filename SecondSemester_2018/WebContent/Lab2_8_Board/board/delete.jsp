<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="delete.board" method="post">
		<h1>비밀번호를 입력하세요</h1>
		<input type="password" name="pass"> <input type="hidden"
			name="no" value="${param.no}"> <input type="hidden"
			name="pageNo" value="${param.pageNo}"> <input type="submit"
			value="확인">
	</form>
</body>
</html>