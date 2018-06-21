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
			// join은 세션이 설정되어 있지 않은 상태에서만 가능함
		%>
		<fieldset style="width: 700px; margin: 0 auto;">
			<h1>회원가입</h1>
			<p style="color: red; font-size: 11px">모든 항목을 모두 채워주세요.</p>
			<hr>
			<form name="form1" id="form1" action="main.jsp?pagefile=join_pro"
				method="post" onsubmit="return subCheck();">
					<table>
						<tr>
							<td>아이디</td>
							<td><input type="text" id="user_ID" name="userID"
								onblur="checkFilled(this)" value="" required></td>
							<td><span class="span" id="id_chk"
								style="color: red; font-size: 10px"></span></td>
							<!-- 스펜 테그의 초기 값을 빨간색으로 설정하고 폰트 크기를 10px로 설정 -->
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" id="userPassword1"
								name="userPassword" placeholder="비밀번호" required></td>
						</tr>
						<tr>
							<td>비밀번호 재확인</td>
							<td><input type="password" id="userPassword3"
								name="userPassword2" placeholder="비밀번호 재확인" required></td>
							<td><span class="span" id="pwd_chk"
								style="color: red; font-size: 10px"></span></td>
							<!-- 비밀번호 검사를 위해서 검사를 진행하는 함수를 호출해서 실행한다. -->
							<!-- 비밀번호를 검사한 후 출력되는 메시지를 설정한다. -->
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" placeholder="이름" id="userName"
								name="userName" onfocus="checkPwd()" required></td>
						</tr>
						<tr>
							<td>나이</td>
							<td><input type="number" placeholder="나이" id="userAge"
								name="userAge" onblur="agechk(this)" required></td>
							<td><span class="span" id="age_chk"
								style="color: red; font-size: 10px"></span></td>
						</tr>
						<tr>
							<td>성별</td>
							<td><input type="radio" Name="userGender" value="Male"><span
								class="span">남자</span> <input type="radio" Name="userGender"
								value="Female"><span class="span">여자</span></td>
							<!-- 성별 선택을 위해서 radio타입으로 선언한 뒤 userName과 id를 동일하게 해서 하나만 선택할 수 있도록 한다. -->
						</tr>
						<tr>
							<td>E-mail</td>
							<td><input type="email" placeholder="aa@aa.aa"
								id="userEmail" name="userEmail" required></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="tel" placeholder="010-1111-1111"
								id="userPhone" name="userPhone" required></td>
						</tr>
					</table>

					<p class="p" style="text-align: center;">
						<input type="submit" value="제출">
						<!-- 제출 버튼을 클릭 했을 때 위의 함수를 호출해서 모든 칸이 정확히 입력이 되어있는지 확인한다. -->
						<input type="reset" value="다시쓰기"
							onclick="return confirm('다시 입력하시겠습니까?');">
						<!-- 다시 쓰기의 여부를 물어보기 위해 버튼 클릭 이벤트로 confirm을 선언하고 선택한 값에 따라 true/false로 반환한다. -->
			</form>
		</fieldset>
		<%
			}
			//세션이 설정되어 있는 경우
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