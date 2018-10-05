<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tlds/ConnectionTag.tld"%>
<h1>스크립트 변수 생성하기</h1>
<tag:db id="db" />
+---------------------------------------------------------+<br />
<%
	Connection conn = db.getConnection();
	PreparedStatement pstmt = conn.prepareStatement("select * from member3");
	ResultSet rs = pstmt.executeQuery();
	while (rs.next()) {
%>
&nbsp;|당신의 이름은? :
<%=rs.getString("mem_name")%><br />
&nbsp;|당신의 아이디는? :
<%=rs.getString("mem_id")%><br />
+---------------------------------------------------------+<br />
<%
	}
	rs.close();
	pstmt.close();
	conn.close();
%>