<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link href='<c:url value="css/bootstrap.min.css" />' rel="stylesheet">
<style>
select {
	width: 100%; /* 원하는 너비설정 */
	font-family: inherit; /* 폰트 상속 */
	border: 1px solid #999;
	border-radius: 0px; /* iOS 둥근모서리 제거 */
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
}
</style>
<title>Insert title here</title>
</head>
<body class="container">

	<div class="jumbotron" style="margin-top:5px; padding:5px;">
		<h3 style="text-align:center;">User Group Post</h3>
	</div>
	<form action="/block/userData" method="post">
		<table class="table table-hover" style="width:50%; margin:center;">
			<tr>
				<td style="text-align:center;">그룹 이름</td>
				<td><input type="text" style="width:100%;" name="groupName" required></td>
			</tr>
			<tr>
				<td style="text-align:center;">사용자 이메일</td>
				<td><input type="text" style="width:100%;" name="userEmail" required></td>
			</tr>
			<tr>
				<td style="text-align:center;">사용자 권한</td>
				<td><select name="account">
						<option value="master">회장</option>
						<option value="accoutant">회계</option>
						<option value="normal">일반</option>
				</select></td>
			</tr>
			<tr>
				<td style="text-align:center;">가입 유형</td>
				<td><select name="oauth">
						<option value="kakao">카카오</option>
						<option value="naver">네이버</option>
						<option value="google">구글</option>
						<option value="nothing">일반</option>
				</select></td>
			</tr>
			<tfoot>
				<tr>
					<td colspan="2"><input type="submit" value="전송"></td>
				</tr>
			</tfoot>
		</table>
	</form>
</body>
</html>