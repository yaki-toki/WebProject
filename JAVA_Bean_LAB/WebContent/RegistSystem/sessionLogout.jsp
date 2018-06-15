<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<%
	session.invalidate();
%>
<script>
	alert("로그아웃 되었습니다.");
	location.href = "loginForm.jsp";
</script>