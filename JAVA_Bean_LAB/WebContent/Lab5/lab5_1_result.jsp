<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>눈벌려 주문서 들어간다!</title>
<link href="style.css" type="text/css" rel="stylesheet">
</head>
<body>
	<div id="container">
		<h1><%=request.getParameter("name")%>님의 상품
		</h1>
		<hr>
		<strong>
			<table>
				<tr>
					<td align=right>주소 :</td>
					<td align=center><%=request.getParameter("addr")%></td>
				</tr>
				<tr>
					<td align=right>전화번호 :</td>
					<td align=center><%=request.getParameter("phone")%></td>
				</tr>
			</table>
		</strong>
		<hr>
		<strong>주문서</strong> <br>
		<%!
			int price = 0;
			//값을 더하기 위한 초기화
		
			public void setPrice(int a) {
				price += a;
			}
			//메뉴에 따라 값을 더해간다.
		
			public int getPrice() {
				return price;
			}
			//값을 출력해준다.
			
			public void setMoney() {
				this.price = 0;
			}
			//뒤로 가기 버튼을 누른경우가 있기 때문에 값을 초기화 한다.
		%>

		<%
			String[] main_menu = request.getParameterValues("menu");
			for (int i = 0; i < main_menu.length; i++) {
				//추가한 메뉴의 수 만큼 for문을 반복한다.
		%>
		<%=main_menu[i]%>&nbsp;
		<!-- 선택한 메뉴를 순서대로 출력 -->
		<%
			if (main_menu[i].equals("불고기버거"))
					setPrice(4000);
			else if (main_menu[i].equals("앙념치킨"))
				setPrice(16500);
			else if (main_menu[i].equals("반반치킨"))
				setPrice(17500);
			else
				setPrice(16000);
			//조건에 따라서 메뉴의 가격을 더해준다.
			}
		%><br> <br> 
		<strong>사이드 메뉴 :
		<label style="color: blue;"> 
		<%
		 	String side = request.getParameter("sidemenu");
			//sidemenu의 값이 ok로 넘어온 경우와 no로 넘어온 경우를 판단
			
		 	if (side.equals("ok")) 
		 	{
		 		String side_menu = request.getParameter("drink");
		 		//ok를 한 경우 drink의 값들을 가져온다.
		 		
		 		if (side_menu.equals("콜라"))
		 			setPrice(1500);
		 		//drink의 값이 콜라인 경우
		 		
		 		else
		 			setPrice(2000);
		 		//스프라이트인 경우
		 		
		 		out.print(side_menu);
		 		//선택한 메뉴 출력
		 	} 
		 	else 
		 		out.print("메뉴가 없습니다.");
 		%></label></strong> 
 		
		<br> <br> <strong>총 금액 : 
		<label style="color: red;"><%=getPrice()%> 	<%setMoney();%></label>
				<!-- 값 출력			값 초기화  -->
		원 입니다.
		</strong>
	</div>
</body>
</html>
