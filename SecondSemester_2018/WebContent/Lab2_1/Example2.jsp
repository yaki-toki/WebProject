<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="Example2_result.jsp" name="form" id="form" method="post">
		<h1>주문하기</h1>
		학변 : <input type="text" name="std_id" id="std_id" autofocus><br>

		<hr>
		<h3>수강 과목</h3>
		<input type="checkbox" name="class_name" value="웹프로그래밍">웹프로그래밍
		<input type="checkbox" name="class_name" value="운영체제">운영체제 <input
			type="checkbox" name="class_name" value="자료구조">자료구조 <input
			type="checkbox" name="class_name" value="알고리즘">알고리즘
		<hr>
		<p>
			<input type="submit" value="주문"> <input type="reset"
				value="취소">
	</form>
</body>
</html>