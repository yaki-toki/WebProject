<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>홀/짝 검사</title>
</head>
<body>
	<label style="color:blue;"><%=request.getParameter("id")%></label>
	님이 입력한 값은
	<!-- 아래에 쓰여지는 부분은 빨간색 -->
	<label style="color:red;">
	<%
		int num = Integer.parseInt(request.getParameter("number"));
		//받아온 값을 숫자로 변환한다.
		if(num%2==0){
			//짝수인 경우 출력
			out.print(num+"(짝수)");
		}
		else{
			%></label>
			<label style="color:green;"><%
			//else로 들어오는 경우 초록색
			out.print("("+num+")(홀수)");
		}
	%></label>
	입니다.
</body>
</html>