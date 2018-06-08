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
	<form action="main.jsp?pagefile=order_result" method="post">
		<h1>> 주문하기 <</h1>
		아이디
		<input type="text" value='<%=session.getAttribute("id")%>' readonly>
		<br> <br> 주문 내역 <br>
		<%!
			int money = 0;
			String names = "";
			// hidden을 이용해서 값을 전달할 내용들 선언
		%>
		
		<%
			String[] goods_print = request.getParameterValues("goods");
			// 선택한 항목들을 배열 형식으로 전달받음
		
			for (int i = 0; i < goods_print.length; i++) {
				if (goods_print[i].equals("1")) {
					out.print("[웹 시스템 설계 및 개발] ");
					// 선택한 항목에 해당하는 제품을 출력
					names += "[웹 시스템 설계 및 개발] ";
					// names에 name값을 더해서 저장
					money += 20000;
					// money에 항목에 따른 값을 저장

				} else if (goods_print[i].equals("2")) {
					out.print("[네트워크 프로그래밍] ");
					names += "[네트워크 프로그래밍] ";
					money += 25000;

				} else if (goods_print[i].equals("3")) {
					out.print("[데이터베이스 이론] ");
					names += "[데이터베이스 이론] ";
					money += 15000;
				}
			}
		%>
		<br> 가격
		<label style="color:red;"><%=money%></label>
		<!-- 총 금액을 빨간 색으로 출력 -->
		<input type="hidden" name="name" value="<%=names%>"> 
		<input type="hidden" name="money" value="<%=money%>">
		<!-- 전달할 값을 hidden태그를 이용해서 저장한다. -->
		<br>
		<textarea rows="5" cols="30" name="contents"> </textarea><br>
		<!-- 사용자의 주문 요청 사항을 입력하게 만들어 줌 -->
		<input type="submit" value="제출">
		<!-- 값을 전송 -->
		
	</form>
	<%
		money = 0;
		names = "";
	%>
</body>
</html>