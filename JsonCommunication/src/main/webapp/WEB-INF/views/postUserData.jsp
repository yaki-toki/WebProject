<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/block/userData" method="post">
		그룹 이름 : <input type = "text" name = "groupName" required><br/>
		사용자 이메일 : <input type = "text" name = "userEmail" required><br/>
		사용자 권한 : <input type = "text" name = "account" required><br/>
		<input type="submit" value="전송">
	</form>
</body>
</html>