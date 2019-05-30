<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
select {
	width: 100%; /* 원하는 너비설정 */
	font-family: inherit; /* 폰트 상속 */
	border: 1px solid #999;
	border-radius: 0px; /* iOS 둥근모서리 제거 */
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
}
</style>
<body>
	<form action="/block/userData" method="post">
		<table>
			<tr>
				<td>그룹 이름</td>
				<td><input type="text" name="groupName" required></td>
			</tr>
			<tr>
				<td>사용자 이메일</td>
				<td><input type="text" name="userEmail" required></td>
			</tr>
			<tr>
				<td>사용자 권한</td>
				<td><select name="account">
						<option value="master">회장</option>
						<option value="accoutant">회계</option>
						<option value="normal">일반</option>
				</select></td>
			</tr>
			<tr>
				<td>가입 유형</td>
				<td><select name="oauth">
						<option value="kakao">카카오</option>
						<option value="naver">네이버</option>
						<option value="google">구글</option>
						<option value="nothing">일반</option>
				</select></td>
			</tr>
		</table>
		<input type="submit" value="전송">
	</form>
</body>
</html>