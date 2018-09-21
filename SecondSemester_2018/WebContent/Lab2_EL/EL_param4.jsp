<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>표현언어 내장객체 예제</title>
</head>
<body>
<h2>EL의 param2</h2>
이름 : ${param['name']}<br/>
취미 : 
${paramValues.hobby[0] }&nbsp;
${paramValues.hobby[1] }&nbsp;
${paramValues.hobby[2] }&nbsp;
${paramValues.hobby[3] }&nbsp;
${paramValues.hobby[4] }&nbsp;
</body>
</html>