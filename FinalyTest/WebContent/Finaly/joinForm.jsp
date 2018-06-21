<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- css파일을 호출하기 위한 link태그 -->
<script src="script.js"></script>
</head>
<body class="mybody">
	<div>
		<%
			if (session.getAttribute("userID") == null) {
		%>
		<fieldset style="width: 500px; margin: 0 auto;">
			<h1>회원가입</h1>
			<p style="color: red; font-size: 11px">모든 항목을 모두 채워주세요.</p>
			<hr>
			<form name="form1" id="form1" action="main.jsp?pagefile=join_pro"
				method="post" onsubmit="return subCheck();">
				<p class="p">아이디</p>
				<input type="text" id="user_ID" name="userID"
					onblur="checkFilled(this)" value="" required> <span
					class="span" id="id_chk" style="color: red; font-size: 10px"></span>
				<!-- 스펜 테그의 초기 값을 빨간색으로 설정하고 폰트 크기를 10px로 설정 -->

				<p class="p">비밀번호</p>
				<input type="password" id="userPassword1" name="userPassword"
					placeholder="비밀번호" required>

				<p class="p">비밀번호 재확인</p>
				<input type="password" id="userPassword3" name="userPassword2"
					placeholder="비밀번호 재확인" required>
				<!-- 비밀번호 검사를 위해서 검사를 진행하는 함수를 호출해서 실행한다.  -->
				<span class="span" id="pwd_chk" style="color: red; font-size: 10px"></span>
				<!-- 비밀번호를 검사한 후 출력되는 메시지를 설정한다. -->

				<p class="p">이름</p>
				<input type="text" placeholder="이름" id="userName" name="userName"
					onfocus="checkPwd()" required>

				<p class="p">나이</p>
				<input type="number" placeholder="나이" id="userAge" name="userAge"
					onblur="agechk(this)" required>
				<span class="span"
					id="age_chk" style="color: red; font-size: 10px"></span>

				<p class="p">성별</p>
				<input type="radio" Name="userGender" value="Male"><span
					class="span">남자</span> <input type="radio" Name="userGender"
					value="Female"><span class="span">여자</span>
				<!-- 성별 선택을 위해서 radio타입으로 선언한 뒤 userName과 id를 동일하게 해서 하나만 선택할 수 있도록 한다. -->

				<p class="p">E-mail</p>
				<input type="email" placeholder="aa@aa.aa" id="userEmail"
					name="userEmail" required>

				<p class="p">전화번호</p>
				<input type="tel" placeholder="010-1111-1111" id="userPhone"
					name="userPhone" required>

				<p class="p">
					<input type="submit" value="제출">
					<!-- 제출 버튼을 클릭 했을 때 위의 함수를 호출해서 모든 칸이 정확히 입력이 되어있는지 확인한다. -->
					<input type="reset" value="다시쓰기"
						onclick="return confirm('다시 입력하시겠습니까?');">
					<!-- 다시 쓰기의 여부를 물어보기 위해 버튼 클릭 이벤트로 confirm을 선언하고 선택한 값에 따라 true/false로 반환한다. -->
			</form>
		</fieldset>
		<%
			}
			//세션이 설정되지 않은 경우
			else {
				out.println("<script>");
				out.println("alert('로그아웃 후 이용해 주세요')");
				out.println("main.back()");
				out.println("</script>");
			}
		%>

	</div>
</body>
</html>