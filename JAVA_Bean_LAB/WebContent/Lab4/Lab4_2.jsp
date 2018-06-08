<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>홀/짝 검사</title>
<script type="text/javascript">
	function check() {
		var id = document.getElementById("id");
		var number = document.getElementById("number");
		//식별자를 받아온다.

		if (id.value == "" || number.value == "" || isNaN(number.value)) {
			//해당하는 값들이 비어있는지 확인하고
			//number의 값이 숫자인지 확인한다.
			if (id.value == "") {
				alert("ID를 입력해 주세요!");
				//ID값이 비어있는 경우
				return false;
			} else if (number.value == "") {
				//숫자가 비어있는 경우
				alert("숫자를 입력해 주세요!");
				return false;
			} else {
				alert("숫자만 입력해 주세요!");
				//문자가 들어간 경우
				return false;
			}
		} else
			return true;
			//위의 경우 외에 정확하게 입력된 경우
	}
</script>
</head>
<body>
	<h1>Lab4-2 / 201403010 김지하</h1>
	<br>
	<hr>
	<form action="Lab4_2_result.jsp" onsubmit="return check();"
		name="getTest" method="GET">
		아이디 : <input type="text" id="id" name="id" onkeyup='removeChar(event)'><br>
		숫자를 입력해 주세요 : <input type="text" id="number" name="number"> <input
			type="submit" id="btn" name="btn" value="확인">
	</form>
</body>
</html>