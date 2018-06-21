//joinForm에서 ID를 체크하는 부분
function checkFilled(obj) {
	var txt = document.getElementById("id_chk");
	txt.innerHTML = "";
	if (obj.value == "") {
		// id값이 비어있는 경우
		txt.innerHTML = "*ID를 입력해주세요";
		// 값을 입력해 달라는 문구 출력
		obj.focus();
		// 포거스를 다시 잡아준다.
	} else {
		txt.innerHTML = "";
		// 비어있지 않는 경우 공백으로 표시
	}
}


function agechk(obj) {
	var txt = document.getElementById("age_chk");
	txt.innerHTML = "";
	if (obj.value == "") {
		// id값이 비어있는 경우
		txt.innerHTML = "*만 19세 이상만 가입 가능합니다.";
		// 값을 입력해 달라는 문구 출력
		obj.focus();
		// 포거스를 다시 잡아준다.
	} else {
		txt.innerHTML = "";
		// 비어있지 않는 경우 공백으로 표시
	}
}

// joinForm에서 페스워드를 체크하는 부분
function checkPwd() {
	var txt = document.getElementById("pwd_chk");
	// span태그의 식별자를 받아옴
	txt.innerHTML = "";
	// 공백으로 초기화
	theForm = document.form1;
	var number = theForm.userPassword.value;
	if (number == theForm.userPassword2.value) {
		// 두 비밀 번호가 같은 경우
		if (theForm.userPassword.value == "") {
			// 첫 번째 비밀 번호가 비어있는 경우
			txt.style.color = 'red';
			txt.innerHTML = "*비밀번호를 입력해 주세요";
			// 비밀번호를 입력하라는 문구 출력
		} else {
			txt.style.color = 'blue';
			txt.innerHTML = "*비밀번호가 일치합니다." + number + " "
					+ theForm.userPassword2.value;
			// 비밀번호가 서로 일치한 경우 파란 색 글씨로 표시
		}
	} else {
		txt.style.color = 'red';
		txt.innerHTML = "*비밀번호가 일치하지 않습니다." + number + " "
				+ theForm.userPassword2.value;
		// 비밀번호가 일치하지 않는 경우
	}
}

function subCheck() {
	theForm = document.form1;
	// Form태그의 식별자를 정의
	if (theForm.userName.value == "" || theForm.userPassword.value == ""
			|| theForm.userPassword2.value == "" || theForm.user_ID.value == "") {
		// Form의 안에 있는 식별자들의 값이 하나라도 비어있으면 출력
		alert("정확하게 입력해주세요!");
		// 정확하게 입력해 달라고 표시
		return false;
	} else {
		// 비어있지 않는 경우
		var chk_radio = document.getElementsByName('userGender');
		var sel_type = null;
		// 라디오 박스 체크 확인을 위한 인자값 선언

		for (var i = 0; i < chk_radio.length; i++) {
			if (chk_radio[i].checked == true) {
				sel_type = chk_radio[i].value;
				// 라디오 박스 배열을 불러와서 해당 배열의 길이 만큼 for문을 반복
				// 값을 체크해서 해당 값이 비어있지 않는다면 해당 배열 칸에 있는 값을 입력
			}
		}
		if (sel_type == null) {
			// 성별 값이 비어있는 경우
			alert("성별을 선택하세요!");
			return false;
		} else {
			// 성별이 정확하게 채크되있는 경우
			var answer = confirm("회원가입을 진행하시겠습니까?");
			// 회원가입을 진행할지 여부를 물어봄
			if (userPassword1.value == userPassword3.value) {
				// 비밀번호 두 개가 동일한 값인지 확인
				if (answer == true) {
					alert("화원가입 성공!");
					return true;
					window.location.reload();
					// 회원가입 성공 메시지를 출력 해 주고 새로고침을 한다.
				} else {
					alert("다시 작성합니다.");
					return false;
					window.location.reload();
					// 회원가입을 취소한 경우 메시지를 출력하고 새로고침을 한다.
				}
			} else {
				alert("비밀번호를 확인 해 주세요!");
				return false;
				// 입력한 비밀번호의 값이 서로 다른경우 메시지 출력
			}
		}
	}
}

