<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
	String id = "";
	try {
		id = (String) session.getAttribute("id");
		if (id == null || id.equals("")) {
%>
<html>
<head>
<title>ȸ������ �ý��� �α��� ������</title>
</head>
<body>
	<form name="loginform" action="loginPro.jsp" method="post">
		<table border=1>
			<tr>
				<td colspan="2" align=center><b><font size=5>�α��� ������</font></b></td>
			</tr>
			<tr>
				<td>���̵� :</td>
				<td><input type="text" name="id" /></td>
			</tr>
			<tr>
				<td>��й�ȣ :</td>
				<td><input type="password" name="pass" /></td>
			</tr>
			<tr>
				<td colspan="2" align=center><a
					href="javascript:loginform.submit()">�α���</a>&nbsp;&nbsp; <a
					href="joinForm.jsp">ȸ������</a></td>
			</tr>
		</table>
	</form>
	<%
		} else {
	%>
	<b><%=id%></b>���� �α��� �ϼ̽��ϴ�.
	<form method="post" action="sessionLogout.jsp">
		<input type="submit" value="�α׾ƿ�">
	</form>
	<%
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>