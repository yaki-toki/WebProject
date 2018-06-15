<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- css파일을 호출하기 위한 link태그 -->

<script type="text/javascript">
	function checkFilled(obj) {
		var txt = document.getElementById("id_chk");
		txt.innerHTML = "";
		if (obj.value == "") {
			//id값이 비어있는 경우
			txt.innerHTML = "*이름을 입력해주세요";
			//값을 입력해 달라는 문구 출력
			obj.focus();
			//포거스를 다시 잡아준다.
		} else {
			txt.innerHTML = "";
			//비어있지 않는 경우 공백으로 표시
		}
	}

	function subCheck() {
		theForm = document.form1;
		//Form태그의 식별자를 정의
		if (theForm.userName.value == "" || theForm.userPassword.value == ""
				|| theForm.userPassword2.value == ""
				|| theForm.userID.value == "") {
			//Form의 안에 있는 식별자들의 값이 하나라도 비어있으면 출력
			alert("정확하게 입력해주세요!");
			//정확하게 입력해 달라고 표시
		} else {
			//비어있지 않는 경우
			var chk_radio = document.getElementsByName('userGender');
			var sel_type = null;
			//라디오 박스 체크 확인을 위한 인자값 선언

			for (var i = 0; i < chk_radio.length; i++) {
				if (chk_radio[i].checked == true) {
					sel_type = chk_radio[i].value;
					//라디오 박스 배열을 불러와서 해당 배열의 길이 만큼 for문을 반복
					//값을 체크해서 해당 값이 비어있지 않는다면 해당 배열 칸에 있는 값을 입력
				}
			}
			if (sel_type == null) {
				//성별 값이 비어있는 경우
				alert("성별을 선택하세요!");
				return false;
			} else {
				//성별이 정확하게 채크되있는 경우
				var answer = confirm("회원가입을 진행하시겠습니까?");
				//회원가입을 진행할지 여부를 물어봄
				if (userPassword.value == userPassword2.value) {
					//비밀번호 두 개가 동일한 값인지 확인
					if (answer == true) {
						alert("화원가입 성공!");
						window.location.reload();
						//회원가입 성공 메시지를 출력 해 주고 새로고침을 한다.
					} else {
						alert("다시 작성합니다.");
						window.location.reload();
						//회원가입을 취소한 경우 메시지를 출력하고 새로고침을 한다.
					}
				} else {
					alert("비밀번호를 확인 해 주세요!");
					//입력한 비밀번호의 값이 서로 다른경우 메시지 출력
				}
			}
		}
	}
</script>
</head>
<body class="mybody">
	<div>
		<fieldset style="width: 500px; margin: 0 auto;">
			<h1>회원가입</h1>
			<p style="color: red; font-size: 11px">모든 항목을 모두 채워주세요.</p>
			<hr>
			<form userName="form1" id="form1" action="main.jsp?pagefile=join_pro"
				method="post">
				<script type="text/javascript">
					function checkPwd() {
						var txt = document.getElementById("pwd_chk");
						//span태그의 식별자를 받아옴
						txt.innerHTML = "";
						//공백으로 초기화
						var userPassword = document.getElementById("userPassword");
						var userPassword2 = document.getElementById("userPassword2");
						
						if (userPassword.value == userPassword2.value) {
							//두 비밀 번호가 같은 경우
							if (userPassword.value == "") {
								//첫 번째 비밀 번호가 비어있는 경우
								txt.style.color = 'red';
								txt.innerHTML = "*비밀번호를 입력해 주세요";
								//비밀번호를 입력하라는 문구 출력
							} else {
								txt.style.color = 'blue';
								txt.innerHTML = "*비밀번호가 일치합니다.";
								//비밀번호가 서로 일치한 경우 파란 색 글씨로 표시
							}
						} else {
							txt.style.color = 'red';
							txt.innerHTML = "*비밀번호가 일치하지 않습니다.";
							//비밀번호가 일치하지 않는 경우
						}
					}
				</script>
				<p class="p">아이디</p>
				<input type="text" id="userID" name="userID"
					onblur="checkFilled(this)" value="" required> <span class="span"
					id="id_chk" style="color: red; font-size: 10px"></span>
				<!-- 스펜 테그의 초기 값을 빨간색으로 설정하고 폰트 크기를 10px로 설정 -->

				<p class="p">비밀번호</p>
				<input type="password" id="userPassword" name="userPassword"
					placeholder="비밀번호" required>

				<p class="p">비밀번호 재확인</p>
				<input type="password" id="userPassword2" name="userPassword2"
					placeholder="비밀번호 재확인" onblur="checkPwd()" required>
				<!-- 비밀번호 검사를 위해서 검사를 진행하는 함수를 호출해서 실행한다.  -->
				<span class="span" id="pwd_chk" style="color: red; font-size: 10px"></span>
				<!-- 비밀번호를 검사한 후 출력되는 메시지를 설정한다. -->

				<p class="p">이름</p>
				<input type="text" placeholder="이름" id="userName" name="userName" required>

				<p class="p">나이</p>
				<input type="text" placeholder="나이" id="userAge" name="userAge" required>

				<p class="p">성별</p>
				<input type="radio" Name="userGender" id="userGender" value="Male"><span
					class="span">남자</span> <input type="radio" Name="userGender"
					id="userGender" value="Female"><span class="span">여자</span>
				<!-- 성별 선택을 위해서 radio타입으로 선언한 뒤 userName과 id를 동일하게 해서 하나만 선택할 수 있도록 한다. -->

				<p class="p">E-mail</p>
				<input type="email" placeholder="aa@aa.aa" id="userEmail"
					name="userEmail" required>

				<p class="p">전화번호</p>
				<input type="tel" placeholder="010-1111-1111" id="userPhone"
					name="userPhone" required>

				<p class="p">
					<input type="submit" value="제출" onclick="subCheck()">
					<!-- 제출 버튼을 클릭 했을 때 위의 함수를 호출해서 모든 칸이 정확히 입력이 되어있는지 확인한다. -->
					<input type="reset" value="다시쓰기"
						onclick="return confirm('다시 입력하시겠습니까?');">
					<!-- 다시 쓰기의 여부를 물어보기 위해 버튼 클릭 이벤트로 confirm을 선언하고 선택한 값에 따라 true/false로 반환한다. -->
			</form>
		</fieldset>
	</div>
</body>
</html>