<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="testjsp.LogonDataBean"%>
<%@ page import="testjsp.LogonDBBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>정보 수정</title>
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
		String passwd = request.getParameter("passwd");
		LogonDBBean manager = LogonDBBean.getInstance();
		//아이디와 비밀번호에 해당하는 사용자의 정보를 얻어냄
		LogonDataBean m = manager.getMember(id, passwd);
		try {//얻어낸 사용자 정보를 화면에 표시
	%>
	<center>
		<form name="regFrm" method="post" action="modifyPro.jsp">
			<table border=1>
				<tr>
					<td colspan="2" align=center><b><font size=5>회원정보
								수정페이지 </font></b></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input id="id" name="id" type="text" size="20"
						maxlength="50" value="<%=id%>"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input id="passwd" name="passwd" type="password"
						size="20" maxlength="16"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input id="name" name="name" type="text" size="20"
						maxlength="10" value="<%=m.getName()%>
"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input id="address" name="address" type="text" size="30"
						maxlength="50" value="<%=m.getAddress()%>
"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input id="tel" name="tel" type="text" size="20"
						maxlength="20" value="<%=m.getTel()%>
"></td>
				</tr>
				<tr>
					<td colspan="2" align=center><input type="submit"
						value="수정
"> <inputtype
							="button" onclick="javascript:location.href='loginForm.jsp;"
							value="취소"></td>
				</tr>
			</table>
		</form>
	</center>
	<%
		} catch (Exception e) {
		}
	%>
</body>
</html>