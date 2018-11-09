<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/boardstyle.css" type="text/css" />
</head>
<body>
	<table border="0" cellpadding="3" cellspacing="0" width=100%>
		<tr>
			<td align="center" bgcolor="#DDDDDD" width="10%">이 름</td>
			<td bgcolor="#FFFFE8">${article.getName()}</td>
			<td align="center" bgcolor="#DDDDDD" width=10%>등록날짜</td>
			<td bgcolor="#FFFFE8">${article.getReg_date()}</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DDDDDD">제 목</td>
			<td bgcolor="#FFFFE8" colspan="3">${article.getTitle()}</td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DDDDDD">첨부파일</td>
			<td bgcolor="#FFFFE8" colspan="3"><c:if test="${fn:length(article.getFilename())>0}">
					<a href="./board/download.jsp?filename=${article.getFilename()}">${article.getFilename()}
					</a>
				</c:if>
		</tr>
		<tr>
			<td colspan="4" bgcolor="#ffffff">${article.getContent()}<br></td>
		</tr>
		<tr>
			<td colspan="4" align="right">${article.getIp()}/조회수
				${article.getCount()}</td>
		</tr>
	</table>
	<hr />
	<jsp:include page="reply.jsp">
		<jsp:param name="no" value="${param.no}" />
		<jsp:param name="pageNo" value="${param.pageNo}" />
		<jsp:param name="reply" value="${param.reply}" />
	</jsp:include>
	[
	<a href="boardList.board?pageNo=${param.pageNo}">리스트 </a> |
	<a href="modifyPwd.board?no=${param.no}&pageNo=${param.pageNo}">수 정</a> |
	<a href="deleteForm.board?no=${param.no}&pageNo=${param.pageNo}">삭 제</a> ]
	<br>
</body>
</html>