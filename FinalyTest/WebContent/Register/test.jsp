<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	alert("HEAD ALERT 경고창");
	window.onload = function() {
		alert("window.onload ALERT 경고창");
	}
	$(document).ready(function() {
		alert("$(document).ready ALERT 경고창");
	})
</script>
</head>
<body>
	<script type="text/javascript">
		alert("BODY ALERT 경고창");
	</script>
</body>
</html>