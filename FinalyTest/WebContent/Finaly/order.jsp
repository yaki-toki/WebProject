<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@page import="user.CarDAO"%>
<!-- 201403010 김지하 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table {
	border: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #444444;
	width: 150px;
	text-align: center;
}

#td {
	text-align: center;
	width: 350px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="car" class="user.Car" scope="request">
		<jsp:setProperty name="car" property="*" />
	</jsp:useBean>
	<%
		if (session.getAttribute("userID") == null) {
			out.println("<script>");
			out.println("alert('로그인 후 이용해 주세요')");
			out.println("main.back()");
			out.println("</script>");
		} else {
	%>
	<form action="main.jsp?pagefile=order_result" method="post" class = "order-form">

		<%
			String modelID = request.getParameter("listModel");
				if (modelID == null) {
					out.println("<script>");
					out.println("alert('모델ID를 선택해 주세요.')");
					out.println("history.back()");
					out.println("</script>");
				} else {
					CarDAO dao = new CarDAO();
					//CarDAO에서 실행시킨 rs를 반환받는다.
					ResultSet rs = dao.SetModel(modelID);
					
					//반환받은 데이터를  Car에 저장한다.
					car.setModelID(rs.getString(1));
					car.setManufacturer(rs.getString(2));
					car.setModelName(rs.getString(3));
					car.setModelYear(rs.getInt(4));
					car.setModelDsp(rs.getInt(5));
					car.setModelType(rs.getString(6));
					car.setModelEngine(rs.getString(7));
					car.setModelGear(rs.getString(8));
					car.setGearNumber(rs.getInt(9));
					car.setModelMax(rs.getInt(10));
					car.setModelDriving(rs.getString(11));
					car.setModelFuel(rs.getString(12));
		%>
		<!-- 위에서 저장한 데이터들을 불러온다. -->
		<div id="sidebar">
			<table>
				<tr>
					<td>기종 번호</td>
					<td id="td"><%=car.getModelID()%></td>
				</tr>
				<tr>
					<td>제조사</td>
					<td id="td"><%=car.getManufacturer()%></td>
				</tr>
				<tr>
					<td>모델</td>
					<td id="td"><%=car.getModelName()%></td>
				</tr>
				<tr>
					<td>제조연식</td>
					<td id="td"><%=car.getModelYear()%></td>
				</tr>
				<tr>
					<td>배기 량</td>
					<td id="td"><%=car.getModelDsp()%>.cc</td>
				</tr>
				<tr>
					<td>차종</td>
					<td id="td"><%=car.getModelType()%></td>
				</tr>
				<tr>
					<td>엔진</td>
					<td id="td"><%=car.getModelEngine()%></td>
				</tr>
				<tr>
					<td>기어</td>
					<td id="td"><%=car.getModelGear()%></td>
				</tr>
				<tr>
					<td>단수</td>
					<td id="td"><%=car.getGearNumber()%> 단</td>
				</tr>
				<tr>
					<td>최대 탑승 인원</td>
					<td id="td"><%=car.getModelMax()%> 명</td>
				</tr>
				<tr>
					<td>구동</td>
					<td id="td"><%=car.getModelDriving()%> 구동</td>
				</tr>
				<tr>
					<td>연료</td>
					<td id="td"><%=car.getModelFuel()%></td>
				</tr>
			</table>
		</div>
		
		<!-- 사진이 나오는 부분 -->
		<div id="aside">
			<p align="center">
				<img src="img/<%=modelID%>.jpg">
		</div> <br>
		
		<!-- 선택한 모델ID를 넘기기 위해서 hidden을 써서 값을 저장한다.-->
		<input type="hidden" id="order_modelID" name="order_modelID" value="<%=modelID%>">
		<div id="footer">
		<!-- 차량 번호 입력 부분 -->
			<br> 차량 번호 : <input type="text" id="carNumber1"
				name="carNumber1" maxlength="2" required> <select
				id="carNumber2" name="carNumber2">
				<option value="가">가</option>
				<option value="나">나</option>
				<option value="다">다</option>
				<option value="라">라</option>
				<option value="마">마</option>
			</select> <input type="text" id="carNumber3" name="carNumber3" maxlength="4"
				required> <br> <br>
			<p align="right">
				<input type="submit" value="등록하기"> <input type="button"
					value="뒤로가기" onclick="history.back()">
		</div>
	</form>
	<%
		}
		}
	%>
</body>
</html>