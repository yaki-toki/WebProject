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
<title>Underground의 자동차 등록 센터</title>

<link href="style.css" type="text/css" rel="stylesheet">
<!-- css파일을 호출하기 위한 link태그 -->
</head>
<style>
a:link {
	text-decoration: none;
	color: #646464;
}

a:active {
	text-decoration: none;
	color: blue;
}

a:visited {
	text-decoration: none;
	color: #646464;
}

a:hover {
	text-decoration: none;
	color: #646464;
}

</style>
<body>
	<%
		String pagefile = request.getParameter("pagefile");
		// 어떤 페이지를 선택 했는지를 받아올 변수 선언
	%>
	<div id="container">
		<!-- header 시작  -->
		<div id="header">
			<jsp:include page="header.jsp" />
			<!-- 로그인 form을 include시킨다. -->
		</div>

		<div id="headermenu">
			<a href="main.jsp">홈</a> | <a href="./main.jsp?pagefile=list"> 상품
				보기 </a>
			<!-- 홈을 누르면 main화면으로 가서 pagefile이 intro로 선언된다.
			상품 보기를 누르면 pagefile에 list로 값이 선언된다. -->
		</div>
		<!-- header 끝  -->


		<!--  content 시작  -->
		<div id="content">
			<jsp:include page='<%=pagefile + ".jsp"%>' />
			<!-- main페이지에서 받아온 pagefile를 표현식을 사용해서 입력 해 준다. -->
		</div>
		<!--  content 끝  -->



		<!--  footer 시작   -->
		<div id="footer">
			<jsp:include page="footer.jsp" />
			<!-- copyright를 보여준다. -->
		</div>
		<!--  footer 끝  -->

	</div>
</body>
</html>