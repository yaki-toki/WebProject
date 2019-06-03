<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page session="false" %> --%>
<html>
<head>
<title>Home</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
</head>
<body class="container">
	<div class="jumbotron" style="padding-bottom:30px; margin-top:20px;">
		<h2> LEGO - Blockchain & Book of accounts </h2>
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
		<table class="table table-hover" style="width:100%">
			<thead>
				<tr>
					<th>클래스</th>
					<th>그룹 명</th>
					<th>사용자 이메일</th>
					<th>사용자 권한</th>
					<th>회비 납부 여부</th>
					<th>가입 유형</th>
				</tr>
			</thead>
			<c:forEach items="${groupList }" var="group">
				<tbody>
					<tr>
						<td>${group.getGroupClass() }</td>
						<td>${group.getGroupName() }</td>
						<td>${group.getUserEmail() }</td>
						<td>${group.getAccount() }</td>
						<td>${group.getState() }</td>
						<td>${group.getOauth() }</td>
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
		<table class="table table-hover">
			<thead>
				<tr>
					<th>클래스</th>
					<th>그룹 명</th>
					<th>사용자 이메일</th>
					<th>사용자 권한</th>
					<th>회비 납부 여부</th>
					<th>가입 유형</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${userModel.getGroupClass()}</td>
					<td>${userModel.getGroupName()}</td>
					<td>${userModel.getUserEmail()}</td>
					<td>${userModel.getAccount()}</td>
					<td>${userModel.getState()}</td>
					<td>${userModel.getOauth()}</td>
				</tr>
			</tbody>
		</table>
	</c:if>
	<br />
	<div class="jumbotron" style="margin-top:5px; padding:5px;">
		<h6 style="text-align:center;">Copyright (C) 2019. KimJiHa & KimHyeWon. All rights reserved.</h6>
	</div>
</body>
</html>
