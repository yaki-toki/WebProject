<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table {
	width: 40%;
	text-align: center;
	border: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #444444;
	padding: 10px;
	text-align: center;
}
</style>
<body>
	<h1>Group Information</h1>

	<form action="/block/addGroup" method="POST">
		<h2>Group Information Send Server</h2>
		<br />
		<table>
			<thead>
				<tr>
					<td>유형</td>
					<td>정보</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Group Name</td>
					<td><input style="width: 100%" type="text" name="groupName"
						required></td>
				</tr>
				<tr>
					<td>Group Pay</td>
					<td><input style="width: 100%" type="number" name="pay"
						min="0" step="1000" required></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2"><input style="width: 80%" type="submit"
						value="전송"></td>
				</tr>
			</tfoot>
		</table>
	</form>

	<br />
	<br />
	<form action="/block/searchGroup" method="GET">
		<h2>Group Information Search</h2>
		<table>
			<tr style="margin: auto;">
				<td><input style="width: 100%; height: 100%" type="text" name="group"></td>
				<td><input style="width: 100%; height: 100%" type="submit" value="검색"></td>
			</tr>
		</table>
		<c:if test="${groupPay ne null }">
			<br />
			<table class="table table-hover">
				<thead>
					<tr>
						<th>클래스</th>
						<th>그룹 명</th>
						<th>회비 금액</th>
						<th>납부 인원수</th>
						<th>납부된 금액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${groupPay.getPayClass() }</td>
						<td>${groupPay.getGroupName() }</td>
						<td>${groupPay.getPay() }</td>
						<td>${groupPay.getParticipantNum() }</td>
						<td>${groupPay.getNowPay() }</td>
					</tr>
				</tbody>
			</table>
		</c:if>
	</form>
</body>
</html>