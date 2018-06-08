<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- 201403010 김지하 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function idChk() {
		theForm = document.idForm;
		
		// PW 혹은 ID가 비어있는지 확인
		if(theForm.id.value == "" || theForm.pwd.value == ""){
			if(theForm.id.value == ""){
				alert("ID를 입력해 주세요.");
				return false;
			}
			if(theForm.pwd.value==""){
				alert("패스워드를 입력해 주세요.");
				return false;
			}
		}
		
		// 하나도 비어있지 않는 경우 true를 반환
		else
			return true;
	}
</script>
<title>Insert title here</title>

</head>
<body>
	<%
		if (session.getAttribute("id") == null) {
			//세션이 설정되지 않은 경우
	%>

	<form action="./main.jsp?pagefile=login_ok" method="post" name="idForm" onsubmit = "return idChk();">
	<!-- submit버튼을 누른 시점 이벤트 발생 반환된 값이 false인지 true인지에 따라 action수행 -->
		아이디<input type="text" name="id" id="id"> 
		비밀번호<input type="password" name="pwd" id="pwd"> 
		<input type="submit" value="로그인"> 
		<input type="button" value="회원가입" onclick="location.href = './main.jsp?pagefile=join'">
		<!-- 회원가입 버튼을 누른 경우 main으로 pagefile의 값을 join으로 저장해서 전달 -->
	</form>
	<%
		} else {
			//세션 값이 설정이 되어있는 경우
	%>
	<form action="logout.jsp" method="post">
		<%=session.getAttribute("id")%>님 로그인하셨습니다. 
		<input type="submit" value="로그아웃">
		<!-- logout버튼을 누르면 logout페이지로 이동 -->
	</form>
	<%
		}
	%>
</body>
</html>