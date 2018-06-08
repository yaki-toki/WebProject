<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>홀수의 합과 짝수의 곱</title>
</head>
<body>
	<h2>Lab 4-1</h2>
	<br><br>
	<%@ include file="header.jsp"%>
	<!-- 미리 만들어 둔 header.jsp파일을 불러와서
	함께 컴파일 시킨다. -->
	<%!
	//메소드 선언
	
	public int sum() {
		int sum = 0;
		for (int i = 1; i <= 10; i++) {
			//for문을 이용해서 10번을 돌린다.
			if (i % 2 == 1)
				sum += i;
			//홀수인 경우 값을 더하게 한다.
		}
		return sum;
		//값을 반환한다.
	}
	
	public int mul(){
		int mul=1;
		//곱셈이기 때문에 1로 초기화 시킨다.
		int i = 1;
		while(i!=11){
			//i의 값이 11일경우 while문을 종료
			if(i%2 == 0)
				mul = mul*i;
				//짝수인 경우 곱해준다.
			i++;
			//루프 종료를 위해서 i값을 1씩 증가시킨다.
		}
		return mul;
		//값을 반환한다.
	}
	%>
	1번 )1부터 10 사이의 홀수의 합 구하기<br>
	결과 : 
	<label style="color:red;">
	<!-- 뒤에 나오는 글씨를 빨간색으로 정한다. -->
	<%=sum()%>
	<!-- 표현식을 이용해 반환된 값을 출력한다. -->
	</label><br>
	2번 )1부터 10 사이의 짝수의 곱 구하기<br>
	결과 : <label style="color:red;"><%=mul() %></label>
</body>
</html>