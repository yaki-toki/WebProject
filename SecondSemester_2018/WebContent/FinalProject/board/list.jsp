<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/boardstyle.css" type="text/css" />
</head>
<script type="text/javascript">
	function goWrite() {

		location.href = "index.jsp?pagefile=./board/write";
	}
</script>
	<!-- CONTENT -->
	<h3>게시판</h3>
	<table style="width:600px">
		<colgroup>
			<col width="10%" />
			<col width="60%" />
			<col width="10%" />
			<col width="10%" />
			<col width="10%" />
		</colgroup>
		<tr>
			<th scope="col">글번호</th>
			<th scope="col">글제목</th>
			<th scope="col">글쓴이</th>
			<th scope="col">날짜</th>
			<th scope="col">조회수</th>
		</tr>
		<tr>
			<td>1</td>
			<td><a href="index.jsp?pagefile=./board/read">안녕하세요. </a></td>
			<td>test</td>
			<td>2018-11-02</td>
			<td>0</td>
		</tr>
		<tr>
			<td>2</td>
			<td><a href="index.jsp?pagefile=./board/read">안녕하세요. </a></td>
			<td>test</td>
			<td>2018-11-02</td>
			<td>0</td>
		</tr>
	</table>
	<input type="button" onclick="goWrite()" value="글쓰기">
	<div class="paging">
		<ol>
			<li>[이전]</li>
			<li><strong>1</strong></li>
			<li>2</li>
		</ol>
	</div>
	<div class="boardSearch">
		<select id="select">
			<option value="" selected="selected">제목</option>
			<option value="">날짜</option>
		</select> <input type="text" id="txt" /> <input type="button" value="검색" />
	</div>
</html>