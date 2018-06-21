<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	function SearchNumber(){
		sform = document.searchForm;
		if(sform.searchNumber1.value == "" || sform.searchNumber3.value == "" || sform.searchNumber1.value.length!=2 || sform.searchNumber3.value.length!=4){
			alert("정확한 정보를 입력해 주세요.");
			return false;
		}else{
			return true;
		}
		return false;
	}
</script>
</head>
<body>
	<h1>
		<strong>회원 정보 검색</strong>
	</h1>
	<form action="main.jsp?pagefile=search_pro" method="post" id="searchForm" name="searchForm" onsubmit="return SearchNumber();">
		<div id="footer">
			<!-- 차량 번호 입력 부분 -->
			<br> 검색 차량 번호 : <input type="text" id="searchNumber1"
				name="searchNumber1" maxlength="2" required>
			<!-- 차량 번호 앞의 두 수 -->

			<select id="searchNumber2" name="searchNumber2">
				<option value="가" selected>가</option>
				<option value="나">나</option>
				<option value="다">다</option>
				<option value="라">라</option>
				<option value="마">마</option>
			</select>
			<!-- 차량의 한글 부분 아직 가~마 밖에 안만들었습니다. -->

			<input type="text" id="searchNumber3" name="searchNumber3" maxlength="4"
				required>
			<!-- 차량 뒤의 4수 -->

			<br> <br>
			<p align="right">
				<input type="submit" value="검색하기"> <input type="button"
					value="뒤로가기" onclick="history.back()">
		</div>
	</form>
</body>
</html>