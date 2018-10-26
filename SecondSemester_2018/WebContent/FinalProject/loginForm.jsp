<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<!------ Include the above in your HEAD tag ---------->
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<nav class="navbar navbar-default">
	<div class="container-fluid" style="padding:0px; margin:auto;">

		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

			<form id="signin" class="navbar-form navbar-right" role="form" method="post" action="login_ok.jsp">
				<div class="input-group">
					<span class="input-group-addon">
						<i class="glyphicon glyphicon-user"></i>
					</span> 
					<input id="userEmail" type="email" class="form-control" name="userEmail" value="" placeholder="Email Address">
				</div>

				<div class="input-group">
					<span class="input-group-addon">
						<i class="glyphicon glyphicon-lock"></i>
					</span> 
					<input id="userPassword" type="password" class="form-control" name="userPassword" value="" placeholder="Password">
				</div>

				<button type="submit" class="button1">Login</button>
			</form>
		</div>
	</div>
	</nav>
</html>