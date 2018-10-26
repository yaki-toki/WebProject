<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.button1 {
	background: #1AAB8A;
	color: #fff;
	border: none;
	position: relative;
	width: 170px;
	height: 30px;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
	margin-top: 10px;
}

.button1:hover {
	background: #fff;
	color: #1AAB8A;
}

.button1:before, .button1:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #1AAB8A;
	transition: 400ms ease all;
}

.button1:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

.button1:hover:before, .button1:hover:after {
	width: 100%;
	transition: 800ms ease all;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<table style="width: 160px; margin-left: auto; margin-right: auto;">
	<tr>
		<td><button type="submit" class="button1" name="menu1"
				value="menu1" onclick="location='./menuAction.jsp?menu=menu1'">1번</button></td>
	</tr>
	<tr>
		<td><button type="submit" class="button1" name="menu2"
				value="menu2" onclick="location='./menuAction.jsp?menu=menu2'">2번</button></td>
	</tr>
	<tr>
		<td><button type="submit" class="button1" name="menu3"
				value="menu3" onclick="location='./menuAction.jsp?menu=menu3'">3번</button></td>
	</tr>
	<tr>
		<td><button type="submit" class="button1" name="menu4"
				value="menu4" onclick="location='./menuAction.jsp?menu=menu4'">4번</button></td>
	</tr>
</table>
</html>