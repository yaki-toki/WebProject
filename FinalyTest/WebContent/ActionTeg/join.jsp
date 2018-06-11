<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- 201403010 김지하 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 회원가입 버튼을 눌렀을 때 출력되는 화면 -->
	<form action="main.jsp?pagefile=join_pro" method="post">
		<table border="1" width="700px">
			<thead>
				<tr>
					<td width="20%">항목</td>
					<td width="80%" style="text-align: center;">내용</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>ID</td>
					<td><input type="text"
						style="width: 500px; padding: 2px; border: 1px solid black"
						id="id" name="id"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" id="pwd" name="pwd"></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" id="pwd2" name="pwd2"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" id="name" name="name"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="radio" id="gender" name="gender" value="Male">남자
						<input type="radio" id="gender" name="gender" value="Female">여자</td>
				</tr>
				<tr>
					<td>E-mail</td>
					<td><input type="email" id="email" name="email"></td>
				</tr>
				<tr>
					<td width="20%">전화번호</td>
					<td><input type="tel" id="phone" name="phone"></td>
				</tr>
			</tbody>
		</table>
		<input type="submit" value="제출">
	</form>
</body>
</html>