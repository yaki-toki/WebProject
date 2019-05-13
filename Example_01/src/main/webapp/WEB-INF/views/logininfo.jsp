<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${token eq null}">
		Access Token 없음
	</c:if>
	<c:if test="${token ne null}">
		<br />
		<a href="/example/logout/">로그아웃</a>
		<br />
		<a href="/example/info/">사용자 정보</a>
		<br />
		<a href="/example/agree/">사용자 동의 항목</a>
		<br />
		<a href="/example/unlink/">사용자 연결 해제</a>
		<br />
		<c:if test="${userID ne null }">
			<br />
			<c:if test="${manager == 1}">
				<a href="/example/userlist">사용자 목록</a>
				<br />
			</c:if>
			<c:if test="${email eq null || email eq ''}">
				<a href="/example/emailPage/">이메일 생성</a><br />
			</c:if>
			<br />
			사용자 등록 ID : ${userID }
			<br />
			사용자 닉네임 : ${nickname }
			<br />
			사용자 프로필 이미지 : ${profileImageURL }
			<br />
			사용자 썸네일 이미지 : ${thumbnailURL }
			<br />
			사용자 이메일 : ${email }
			<br />
			<br />
			<img src="${profileImageURL }" width="500" height="640">
			<br />
			<img src="${thumbnailURL }" width="110" height="110">
		</c:if>
	</c:if>
</body>
</html>