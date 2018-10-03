<!-- 201403010 김지하 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String subject[][] = {{"c언어기초", "python기초"}, {"java 프로그래밍", "자료구조"}, {"운영체제 ", "웹시스템설계및개발"},
			{"인턴쉽1", "인턴쉽2"}};
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="javascript">
	function subChk() {
		var subchk = document.form1.sub;
		var isChk = false;
		for (var i = 0; i < subchk.length; i++) {
			if (subchk[i].checked) {
				isChk = true;
				return true;
			}
		}
		alert("과목을 한 과목 이상 선택해 주세요.");
		return false;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>과목 선택</title>
</head>
<body>
	<!-- 받아온 number -->
	<c:choose>
		<c:when test="${number_code == '03' || number_code == '04' }">
			<!-- 학과 코드가 03,04인 경우만 아래의 form을 보여 줍니다. -->
			<form action="Lab1_result.jsp" name="form1" method="POST"
				onSubmit="return subChk();">
				<h2>과목 선택</h2>
				<!-- session이 유지되는 동안의 값들을 출력 합니다. -->
				학번 :
				<c:out value="${number }" />
				<br> 학년 :
				<c:out value="${grade }" />
				<br> 컴퓨터 소프트웨어<br>
				<hr width="400" align="left">

				<!-- 위에서 선언 한 배열을 s에 할당 합니다. -->
				<c:set var="s" value="<%=subject%>" />

				<!-- 선택한 학년의 과목만을 받아 옵니다. -->
				<c:forEach var="i" items="${s[grade-1]}">
					<strong>${i} <input type="checkbox" name="sub"
						value="${i }"></strong>
					<br>
				</c:forEach>
				<br> <input type="submit" value="전송">
			</form>
		</c:when>

		<c:otherwise>
			<!-- 그 외의 학번은 모두 "준비중입니다."를 출력 해 줍니다. -->
			<h2>준비중입니다.</h2>
			<h3><a href="Lab1.jsp">돌아가기</a></h3>
		</c:otherwise>
	</c:choose>
</body>
</html>