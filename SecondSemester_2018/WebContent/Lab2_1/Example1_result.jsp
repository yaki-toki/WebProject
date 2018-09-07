<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import = "java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1> 결과 </h1>
<%
request.setCharacterEncoding("euc-kr");
String name = request.getParameter("name");
String dept = request.getParameter("dept");
String number = request.getParameter("number");

double score = Double.parseDouble(request.getParameter("score"));
double class_score = Double.parseDouble(request.getParameter("class_score"));
DecimalFormat format = new DecimalFormat();
format.applyLocalizedPattern("0.##");
String change_1 = format.format(score * 4.5/ class_score);
String change_2 = format.format(score * 4.3/ class_score);
String change_3 = format.format(score * 4.0/ class_score);
out.print("이름 : "+name+"<br>");
out.print("학번 : "+number+"<br>");
out.print("학과 : "+dept+"<br>");
out.print("학점 : "+score+"/"+class_score+"<br>");
%>
<h3> 학점 변환 결과</h3>
<%=change_1 %> / 4.5 만점<br>
<%=change_2 %> / 4.3 만점<br>
<%=change_3 %> / 4.3 만점<br>
</body>
</html>