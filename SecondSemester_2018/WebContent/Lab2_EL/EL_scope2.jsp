<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <% pageContext.setAttribute("msg","꿈은 이루어 진다."); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>EL의 Scope1</title>
msg(pageScope로 받은 값) : <b>${pageScope.msg}</b><p/>
1에서 10까지 합(request로 받은 값) : <b><%=request.getAttribute("sum") %></b><p/>
1에서 10까지 합(requestScope로 받은 값) : <b>${requestScope.sum}</b><p/>
</head>
<body>

</body>
</html>