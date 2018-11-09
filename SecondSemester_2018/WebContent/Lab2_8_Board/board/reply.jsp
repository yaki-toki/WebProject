<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form name="post" method="post" action="reply.board">
		<input type="hidden" name="no" value="${param.no}"> <input
			type="hidden" name="pageNo" value="${param.pageNo}"> <label>댓글</label>
		<p />
		<label>이름</label> <input type="text" name="name" size="15"
			maxlength="15"> <label>비밀번호</label> <input type="password"
			name="pass" size="15" maxlength="15">
		<p />
		<textarea name="content" cols="100" rows="3"></textarea>
		<input type="submit" value="확인" />
	</form>
	<table>
		<colgroup>
			<col width="10%" />
			<col width="50%" />
			<col width="20%" />
			<col width="20%" />
		</colgroup>
		<c:forEach var="reply" items="${reply}">
			<tr>
				<td>이름 : ${reply.getMem_name()}</td>
				<td>${reply.getContent()}</td>
				<td>날짜: ${reply.getReg_date()}</td>
				<td>IP: ${reply.getIp()}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>