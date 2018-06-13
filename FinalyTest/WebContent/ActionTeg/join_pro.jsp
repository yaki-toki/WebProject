<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="bean" class="user.User">
		<jsp:setProperty name="bean" property="*" />
	</jsp:useBean>

	ID : <jsp:getProperty property="id" name="bean" /><br> 
	비밀번호 : <jsp:getProperty property="pwd" name="bean" /><br> 
	이름 : <jsp:getProperty property="name" name="bean" /><br> 
	성별 : <jsp:getProperty property="gender" name="bean" /><br> 
	E-mail : <jsp:getProperty property="email" name="bean" /><br> 
	전화번호 : <jsp:getProperty property="phone" name="bean" /><br>

	<%
		UserDAO dao = new UserDAO();
		if(dao.IDChk(bean.getUserID())==1){
			out.print("사용 가능한 ID");
		}
		else if(dao.IDChk(bean.getUserID())==0){
			out.print("이미 존재하는 회원");
		}
		else{
			out.print("DB오류");
		}
	%>
</body>
</html>