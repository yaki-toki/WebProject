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
	<%
		String pagefile = request.getParameter("pagefile");
		//template페이지에서 값을 받아온다.
		
		if (pagefile == null) {
			
			pagefile = "intro";
			//받아온 pagefile라는 변수의 값이 null인 경우 intro를 저장한다.
		}
	%>
	<jsp:forward page="template.jsp">
		<jsp:param name="pagefile" value="<%=pagefile%>" />
	</jsp:forward>
	<!-- 위에서 선언된 pagefile의 값을 template으로 보내준다. -->
</body>
</html>