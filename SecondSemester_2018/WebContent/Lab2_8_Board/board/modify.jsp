<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>글수정</h3>
	<form action="modify.board" method="post" enctype="multipart/form-data" name="boardform">
		<input type="hidden" name="no" value="${article.getIdx()}"> 
		<input type="hidden" name="pageNo" value="${param.pageNo}">
		<table border="0" width="100%" align="center">
			<tr>
				<td width="20%">성 명</td>
				<td width="80%">
					<input type="text" name="mem_name" size="10" maxlength="8" value="${article.getName()}">
				</td>
			</tr>
			<tr>
				<td width="20%">제 목</td>
				<td width="80%">
					<input type="text" name="title" size="50" maxlength="30" value="${article.getTitle()}">
				</td>
			</tr>
			<tr>
				<td width="20%">내 용</td>
				<td width="80%">
					<textarea name="content" rows="10" cols="50"> ${article.getContent()}</textarea>
				</td>
			</tr>
			<tr>
				<c:if test="${fn:length(article.getFilename())>0}">
					<td>업로드 된 파일 :</td>
					<td>${article.getFilename()}</td>
				</c:if>
			</tr>
			<tr>
				<td width="20%">파일찾기</td>
				<td width="80%">
					<input type="file" name="filename2" size="50" maxlength="50">
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정하기"> 
				<input type="reset" value="다시쓰기"> 
				<input type="button" value="리스트" onClick="javascript:location.href='read.board?no=${param.no}'"></td>
			</tr>
		</table>
	</form>
</body>
</html>