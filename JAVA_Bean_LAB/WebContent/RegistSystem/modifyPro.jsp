<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="testjsp.LogonDBBean"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%-- 7~9라인: 수정된 정보를 가지고 데이터저장빈객체를 생성--%>
<jsp:useBean id="member" class="testjsp.LogonDataBean">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>
<%
	LogonDBBean manager = LogonDBBean.getInstance();
	//회원정보 수정 처리 메소드 호출 후 수정 상황값 반환
	int check = manager.updateMember(member);
	if (check == 1) {
%>
<script type="text/javascript">
	alert("정보를 수정 하였습니다.");
	location.href = "loginForm.jsp";
</script>
<%
	} else {
%>
<script type="text/javascript">
	alert("정보수정에 실패 하였습니다.");
	history.back();
</script>
<%
	}
%>