<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>EL의 param1</title>
</head>
<body>
id : ${param.id }
pass : ${param["pass"]}
<!-- 읽는 방식은 다르지만 모두 같다. -->
</body>
</html>