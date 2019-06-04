<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page session="false" %> --%>
<html>
<head>
<title>Home</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
</head>
<body class="container">
	<div class="jumbotron" style="padding-bottom: 30px; margin-top: 20px;">
		<h2>LEGO - Blockchain & Book of accounts</h2>
	</div>
	<ul class="nav nav-tabs">
		<li><a href="/block/groupPay">GroupPay Page</a></li>
		<li><a href="/block/getgroup">Group Get</a></li>
		<li><a href="/block/postUserData">Group Post</a></li>
	</ul>
	<br />
	<c:if test="${user == 1 }">
		<script>
			alert("동일한 이메일이 있습니다.");
		</script>
	</c:if>
	<form action="/block/getById" method="get">
		검색하실 아이디를 입력해 주세요<br /> <input type="text" id="userId" name="userId">
		<input type="submit">
	</form>
	<br />
	<c:if test="${reqContext eq 'getgroup' }">
		<table class="table table-hover" style="width: 100%">
			<thead>
				<tr>
					<th>클래스</th>
					<th>사용자 이메일</th>
				</tr>
			</thead>
			<c:forEach items="${groupList }" var="group">
				<tbody>
					<tr>
						<td>${group.getGroupClass() }</td>
						<td>${group.getUserEmail() }</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</c:if>

	<c:if test="${reqContext eq 'getUserIdNull' }">
		<script>
			alert("사용자 명을 입력해 주세요");
		</script>
	</c:if>

	<c:if test="${reqContext eq 'getGroupId' }">
		<h2>${userModel.getUserEmail() }</h2>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>그룹 명</th>
					<th>인증 상태</th>
					<th>그룹 권한</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="num" begin="0" end="${userModel.getGroupName().size() -1 }" step="1">
					<tr>
						<td>${userModel.getGroupName().get(num).toString() }</td>
						<td>${userModel.getGroupState().get(num).toString() }</td>
						<td>${userModel.getGroupAccount().get(num).toString() }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	<br />
	<div class="jumbotron" style="margin-top: 5px; padding: 5px;">
		<h6 style="text-align: center;">Copyright (C) 2019. KimJiHa &
			KimHyeWon. All rights reserved.</h6>
	</div>
</body>
</html>
