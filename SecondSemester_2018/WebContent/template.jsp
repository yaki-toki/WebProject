<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>homepage</title>
<link rel="stylesheet" href="./css/boardstyle.css" type="text/css" />
<style>
#container {
	width: 100%;
}

#header {
	margin-bottom: 5px;
	width: 100%;
	height: 30px;
	float: right;
	text-align: right;
}

#content {
	width: 100%;
	padding: 20px;
	margin-top: 50px;
	margin-bottom: 20px;
	float: left;
	
}

#footer {
	clear: both;
	padding: 20px;
	
}
</style>
</head>

</head>
<%
	String pagefile = request.getParameter("pagefile");
%>
<body>
	<div id="container">
		<!-- header 시작  -->
		<div id="header">
			<jsp:include page="header.jsp" />
		</div>
		<!-- header 끝  -->
		<!--  content 시작  -->
		<div id="content">

			<jsp:include page='<%=pagefile + ".jsp"%>' />
		</div>
		<!--  content 끝  -->

		<!--  footer 시작   -->
		<div id="footer">
			<jsp:include page="footer.jsp" />
		</div>
		<!--  footer 끝  -->

	</div>

</body>
</html>
