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
<script type="text/javascript">
	function GoodsCheck() {
		// 체크박스가 비어있는지 확인
		goodForm = document.goodForm;
		var isGoodsChk = false;
		//체크 박스가 비어있는 경우 false그대로 가게 됨
		for (var i = 0; i < goodForm.goods.length; i++) {
			//체크 박스가 비어있는지 확인
			if (goodForm.goods[i].checked == true) {
				isGoodsChk = true;
				break;
			}
		}
		if (!isGoodsChk) {
			//isMenuChk가 false인 경우
			alert("하나라도 선택해 주세요.");
			return false;
		} else {
			return true;
		}
	}
</script>
</head>
<body>
	<%
		if (session.getAttribute("id") == null) {
			//세션이 설정되지 않은 경우
	%>
	<h1>
		<strong>상품정보</strong>
	</h1>
	<table width="860" border="1" align="center">
		<thead>
			<tr>
				<td width="10%">번호</td>
				<td width="70%">상품명</td>
				<td width="30%">가격</td>
			</tr>
		</thead>

		<tbody>
			<tr>
				<td width="10%">1</td>
				<td width="70%">웹 시스템 설계 및 개발</td>
				<td width="30%">20000원</td>
			</tr>

			<tr>
				<td width="10%">2</td>
				<td width="70%">네트워크 프로그래밍</td>
				<td width="30%">25000원</td>
			</tr>

			<tr>
				<td width="10%">3</td>
				<td width="70%">데이터베이스 이론</td>
				<td width="30%">15000원</td>
			</tr>
		</tbody>
	</table>
	<%
		} else {
			//세션이 설정 되어있는 경우 구매 열을 출력
	%>
	<h1>
		<strong>상품정보</strong>
	</h1>
	<form action="./main.jsp?pagefile=order" onsubmit = "return GoodsCheck();" method="post" name="goodForm">
	<!-- 값이 체크가 되어있는지 확인되면 pagefile의 값을 order로 설정해서 메인으로 전달 -->
	
		<table width="860" border="1" align="center">
			<thead>
				<tr>
					<td width="10%">번호</td>
					<td width="70%">상품명</td>
					<td width="15%">가격</td>
					<td width="15%">구매</td>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td width="10%">1</td>
					<td width="70%">웹 시스템 설계 및 개발</td>
					<td width="15%">20000원</td>
					<td width="15%"><input type="checkbox" name="goods" id="goods"
						value="1"></td>
				</tr>

				<tr>
					<td width="10%">2</td>
					<td width="70%">네트워크 프로그래밍</td>
					<td width="15%">25000원</td>
					<td width="15%"><input type="checkbox" name="goods" id="goods"
						value="2"></td>
				</tr>

				<tr>
					<td width="10%">3</td>
					<td width="70%">데이터베이스 이론</td>
					<td width="15">15000원</td>
					<td width="15%"><input type="checkbox" name="goods" id="goods"
						value="3"></td>
				</tr>
			</tbody>
		</table>
		<p align="right"> <input type="submit" value="구매하기">
		</form>
	<%
		}
	%>

</body>
</html>