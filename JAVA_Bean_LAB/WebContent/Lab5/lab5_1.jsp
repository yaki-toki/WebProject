<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문서 작성</title>
<script>
	//Radio버튼이 On, Off를 판단해서 select리스트를 출력 할지를 검사
	function Rradio_OnOff(id) {
		//인자값으로 Radio_On 혹은 Radio_Off를 받아옴 으로서 값을 판별한다.
		
		var menu = document.getElementById("side_menu");
		//Select리스트를 출력해 주기 위한 div테그의 id값
		if (id == "Radio_On") {
			//버튼의 value값이 Radio_On인 경우 side_menu에 출력시킴
			menu.innerHTML = "<select name='drink'>"
					+ "<option value='콜라'>콜라 1500원 </option>"
					+ "<option value='스프라이트'>스프라이트 2000원 </option>"
					+ "</select>";
		} else {
			menu.innerHTML = "";
		}
	}

	function check_information() {
		food = document.fastfood;
		if (food.name.value == "" || food.pwd.value == ""
				|| food.addr.value == "" || food.phone.value == "") {
			//한 가지라도 입력이 안되있는경우
			if(food.name.value==""){
				//ID가 비어있는 경우
				alert("이름을 입력해 주세요");
				return false;
			}
			else if(food.pwd.value==""){
				//Password가 비어있는 경우
				alert("비밀번호를 입력해 주세요");
				return false;
			}
			else if(food.addr.value==""){
				//주소가 비어있는경우
				alert("주소를 입력해 주세요");
				return false;
			}
			else if(food.phone.value==""){
				//전화번호가 비어있는 경우
				alert("전화 번호를 입력해 주세요");
				return false;
			}
		}

		else {
			var isMenuChk = false;
			//체크 박스가 비어있는 경우 false그대로 가게 됨
			for (var i = 0; i < food.menu.length; i++) {
				//체크 박스가 비어있는지 확인
				if (food.menu[i].checked == true) {
					isMenuChk = true;
					break;
				}
			}
			if (!isMenuChk) {
				//isMenuChk가 false인 경우
				alert("메인 메뉴를 하나라도 선택해 주세요.");
				return false;
			} else {
				//true인 경우
				var answer = confirm("주문 하시겠습니까?");
				if (answer == true)
					return true;
				else {
					//confirm이 false인 경우
					alert("주문을 취소합니다.");
					return false;
				}
			}
		}
	}
</script>
<link href="style.css" type="text/css" rel="stylesheet">
</head>
<body>
	<div id="container">
		<form action="lab5_1_result.jsp" name="fastfood" method="post"
			onsubmit="return check_information();">
			<h1>주문하기</h1>
			<table>
				<tr>
					<td align=right>이름 :</td>
					<td><input type="text" name="name" id="name" style="width:100%;"></td>
				</tr>

				<tr>
					<td align=right>비밀번호 :</td>
					<td><input type="password" name="pwd" id="pwd" style="width:100%;"></td>
				</tr>

				<tr>
					<td align=right>배달 주소 :</td>
					<td><input type="text" name="addr" id="addr" style="width:100%;"></td>
				</tr>

				<tr>
					<td align=right>전화번호 :</td>
					<td><input type="text" name="phone" id="phone"
						placeholder="-빼고 입력해 주세요." style="width:100%;"></td>
				</tr>
			</table>
			<!-- 인적사항 칸을 테이블로 생성 -->
			<hr>

			<h2>메인 메뉴</h2>
			<table>
				<tr>
					<td><input type="checkbox" name="menu" id="menu" value="불고기버거"></td>
					<td>불고기버거 4,000원</td>
					<td><input type="checkbox" name="menu" id="menu" value="앙념치킨"></td>
					<td>앙념치킨 16,500원</td>
				</tr>

				<tr>
					<td><input type="checkbox" name="menu" id="menu" value="후라이드치킨"></td>
					<td>후라이드치킨 16,000원</td>
					<td><input type="checkbox" name="menu" id="menu" value="반반치킨"></td>
					<td>반반치킨 17,500원</td>
				</tr>
			</table>
			<!-- 메뉴 항목을 테이블로 변경 -->

			<h2>사이드메뉴</h2><br> 
			선택 <input type="radio" name="sidemenu" id="sidemenu" value="ok" onchange="Rradio_OnOff('Radio_On')">
			선택 안함 <input type="radio" name="sidemenu" id="sidemenu" value="no"onchange="Rradio_OnOff('Radio_Off')" checked>
			<!-- 버튼 입력에 따라서 해당 버튼의 인자값을 보내준다. Radio_On/Radio_Off -->
			
			<p>
			<div id="side_menu"></div><br> 
			<input type="submit" value="주문"> 
			<input type="reset" value="취소">
		</form>
	</div>
</body>
</html>