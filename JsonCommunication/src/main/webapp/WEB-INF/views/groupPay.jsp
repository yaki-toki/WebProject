<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">

<title>Insert title here</title>
</head>
<body>
	<h1>Group Information</h1>

	<form style="width:40%;" action="/block/addGroup" method="POST">
		<h2>Group Information Send Server</h2>
		<br />
		<table class="table">
			<thead>
				<tr>
					<td>유형</td>
					<td>정보</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Group Name</td>
					<td><input type="text" name="groupName" required></td>
				</tr>
				<tr>
					<td>Group Pay</td>
					<td><input type="number" name="pay" min="0" step="1000"
						required></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2"><input type="submit" value="전송"></td>
				</tr>
			</tfoot>
		</table>
	</form>

	<br />

	<form style="width:40%;" action="/block/getGroupPay" method="GET">
		<h2>Group Information Search All Group</h2>
		<table class="table">
			<tr style="margin: auto;">
				<td colspan="2"><input type="submit" value="조회"></td>
			</tr>
		</table>
		<c:if test="${groupPayModel ne null }">
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
				<c:forEach items="${groupPayModel }" var="groupPay">
					<tbody>
						<tr>
							<td>${groupPay.getPayClass() }</td>
							<td>${groupPay.getGroupName() }</td>
							<td>${groupPay.getPay() }</td>
							<td>${groupPay.getParticipantNum() }</td>
							<td>${groupPay.getNowPay() }</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</c:if>
	</form>

	<!-- GroupName로 정보 검색 -->
	<form style="width:40%;" action="/block/searchGroup" method="GET">
		<h2>Group Information Search By Group Name</h2>
		<table>
			<tr style="margin: auto;">
				<td><input type="text" name="group"></td>
				<td><input type="submit" value="검색"></td>
			</tr>
		</table>
		<c:if test="${groupPay ne null }">
			<br />
			<table class="table">
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
			
			<table class="table">
				<thead>
					<tr>
						<th>그룹</th>
						<th>일반</th>
						<th>회계</th>
						<th>ID값</th>
						<th>시간</th>
					</tr>
				</thead>
				<c:forEach items="${groupPayUserModel }" var="groupPayUser">
					<tbody>
						<tr>
							<td>${groupPayUser.getGroupPay() }</td>
							<td>${groupPayUser.getNormal() }</td>
							<td>${groupPayUser.getAccoutant() }</td>
							<td>${groupPayUser.getTransactionId() }</td>
							<td>${groupPayUser.getTimestamp() }</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</c:if>
	</form>
</body>
</html>