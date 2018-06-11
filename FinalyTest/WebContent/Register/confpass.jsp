<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
.label {
	float: left:width:120px;
}

.error {
	color: red;
	padding-left: 10px;
}

.submit {
	margin-left: 125px;
	margin-top: 10px;
}

div {
	padding: 5px;
}
</style>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.error').hide();
		$('.submit').click(function(event) {
			data = $('.password').val();

			var len = data.length;
			if (len < 1) {
				$('.password').next().show();
			} else {
				$('.password').next().hide();
			}
			if ($('.password').val() != $('.confpass').val()) {
				$('.confpass').next().show();
			} else {
				$('.confpass').next().hide();
			}
			event.preventDefault();
		});
	});
</script>
</head>
<body>
	<form>
		<div>
			<span class="label">User ID</span><input type="text" class="userid"
				name="userid" />
		</div>
		<div>
			<span class="label">Password</span><input type="password"
				class="password" name="password" /> <span class="error">
				Password cannot be blank</span>
		</div>
		<div>
			<span class="label">Confirm Password</span> <input type="password"
				class="confpass" name="confpass" /><span class="error">
				Password and Confirm Password don't match</span>
		</div>
		<input class="submit" type="submit" value="Submit">
	</form>
</body>
</html>