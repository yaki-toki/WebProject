<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>정보 수정하기</title>
</head>
<body>
	<form name="regFrm" method="post" action="modifyForm.jsp">
		비밀번호 <input id="passwd" name="passwd" type="password" size="20"
			placeholder="6~16자 숫자/문자" maxlength="16">
		<p>
			<input type="button" onClick="javascript:regFrm.submit()" value="수정">
	</form>
</body>
</html>