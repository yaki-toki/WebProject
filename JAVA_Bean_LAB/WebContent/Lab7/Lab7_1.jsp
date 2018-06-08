<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>201403010_김지하_Lab7_1</title>
<script>
	function check_information() {
		var form = document.coffe;
		if (form.name.value == "" || form.passwd.value == "") {
			if (form.name.value == "")
				alert("이름을 입력해 주세요.");
			else if (form.passwd.value == "")
				alert("비밀번호를 입력해 주세요.");
			return false;
			//이름과 비밀번호가 하나라도 비어있는 경우
		} else {
			//메뉴를 선택하지 않은 경우 처리
			var menu_check = false;
			var i = 0;
			for (i = 0; i < form.menu.length; ++i) {
				if (form.menu[i].checked == true) {
					menu_check = true;
					//하나라도 체크가 되어 있으면 바로 menu_check를 true로 변환
					break;
				}
			}

			if (menu_check == false) {
				alert("메뉴를 하나라도 선택해 주세요.");
				return false;
			} 
			
			//menu_check == true인 경우
			else {
				//옵션을 하나도 선택하지 않은 경우 처리
				var temp_check = false;
				var i = 0;
				for (i = 0; i < form.temp.length; ++i) {
					if (form.temp[i].checked == true) {
						temp_check = true;
						break;
					}
				}
				
				if (temp_check == false) {
					alert("Hot / Ice 중 하나를 선택해 주세요.");
					return false;
				} 
				
				else {
					
					var select = document.getElementById("size");
					//select태그를 불러온다
					var option_value = select.options[select.selectedIndex].value;
					//select태그 안에 있는 옵션의 값을 가져온다

					if (option_value == "") {
						//value의 값이 공백인 경우
						alert("사이즈를 선택하세요");
						return false;
					} else {
						
						//size를 선택한 경우
						return true;
					}
				}
			}
		}
	}
	function chk_cancle(){
		var answer = confirm("취소 하시겠습니까?");
		//reset버튼 취소 여부 선택
		if(answer == true)
			return true;
			//reset ㄱㄱ
		else
			return false;
			//reset ㄴㄴ
	}
</script>
<link href="style.css" type="text/css" rel="stylesheet">
</head>
<body>
<!-- 201403010 김지하 -->
	<div id="container">
		<form action="Lab7_1_result.jsp" name="coffe" method="post"
			onsubmit="return check_information();">
			<!-- check_information의 값을 return받아 submit수행 여부 판별 -->
			<h1>주문하기</h1>
			<table>
				<tr>
					<td align=right>이름 :</td>
					<td><input type="text" name="name" id="name"
						style="width: 100%;"></td>
				</tr>

				<tr>
					<td align=right>비밀번호 :</td>
					<td><input type="password" name="passwd" id="passwd"
						style="width: 100%;"></td>
				</tr>
			</table>
			<!-- 인적사항 칸을 테이블로 생성 -->
			<hr>

			<br>
			<h4>커피 종류</h4>
			<input type="radio" name="menu" id="menu" value="아메리카노">아메리카노
			<input type="radio" name="menu" id="menu" value="카페라떼">카페라떼
			<input type="radio" name="menu" id="menu" value="카페모카">카페모카 <br>
				
			<h4>옵션</h4>
			<input type="radio" name="temp" id="temp" value="hot">HOT 
			<input type="radio" name="temp" id="temp" value="ice">ICE <br>
			
			<h4>사이즈</h4>
			<select name="size" id="size">
				<option value="">선택해주세요</option>
				<!-- 초기값으로 선언시켜서 value를 공백으로 설정 => 아무것도 선택하지 않은 상황 -->
				<option value="Toll">Toll</option>
				<option value="Vent">Vent</option>
				<option value="Grande">Grande</option>
			</select><br><br> 
			<input type="submit" value="제출">
			<input type="reset" value="취소" onclick="return chk_cancle();">
		</form>
	</div>
</body>
</html>