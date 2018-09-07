<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Example1</title>
</head>
<body>
<form method="post" action="Example1_result.jsp">

이름 <input type="text" name="name"> <br>
학번 <input type="text" name="number"> <br>
<hr>

학과<br/>
컴소 <input type="radio" name="dept" value="컴소" checked>
성서 <input type="radio" name="dept" value="성서">
사복 <input type="radio" name="dept" value="사복">
간호 <input type="radio" name="dept" value="간호">
<hr>
<input type="text" name="score"> / <select name="class_score">
<option value="4.5"> 4.5 </option>
<option value="4.5"> 4.3 </option>
<option value="4.5"> 4.0 </option>
</select>
<input type="submit" value="전송">
</form>
</body>
</html>