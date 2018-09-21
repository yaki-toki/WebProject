<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>EL의 param2</h2>
<form method="post" action="EL_param4.jsp">
이름 : <input type="text" name="name"><br/>
취미 : 
	독서 <input type="checkbox" name="hobby" value="독서">
	여행 <input type="checkbox" name="hobby" value="여행">
	게임 <input type="checkbox" name="hobby" value="게임">
	영화 <input type="checkbox" name="hobby" value="영화">
	운동 <input type="checkbox" name="hobby" value="운동">
	<input type="submit" value="SAVE">
</form>
</body>
</html>