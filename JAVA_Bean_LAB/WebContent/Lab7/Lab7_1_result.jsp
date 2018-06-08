<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Timestamp"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="style_main.css" />
</head>
<body>
<!-- 201403010 김지하 -->
	<jsp:useBean id="bean" class="beans.Information">
		<jsp:setProperty name="bean" property="*" />
		<!-- beans페키지 내에 있는 Information파일을 불러온다. -->
		<!-- property의 값을 *로 선언하면 모든 변수를 가져오는 것 -->
	</jsp:useBean>
	<%
		//현재 날짜와 시간을 주문 시간으로 지정
		bean.setReg_date(new Timestamp(System.currentTimeMillis()));
	%>
	<div id="container">
		<h1> >>주문 결과<< </h1>
		<hr>
		<br>
		<table id="container2">
			<tr>
				<td>주문번호
				<td><jsp:getProperty name="bean" property="num" /> <!-- Information에서 생성된 num값을 반환 밑에 경우도 동일 -->
					<!-- property에 들어갈 값은 Information에서 생성한 변수 명과 동일해야 함 -->
			<tr>
				<td>이름 :
				<td><jsp:getProperty name="bean" property="name" />
			<tr>
				<td>커피 :
				<td><jsp:getProperty name="bean" property="menu" />
			<tr>
				<td>옵션 :
				<td><jsp:getProperty name="bean" property="temp" />
			<tr>
				<td>사이즈 :
				<td><jsp:getProperty name="bean" property="size" />
			<tr>
				<td>주문시간 :
				<td><jsp:getProperty name="bean" property="reg_date" />
		</table>
	</div>

	<%
		String name = request.getParameter("name");
		//name값을 받아오기 위한 변수 선언
		
		PreparedStatement pstmt = null;
		//값을 추가하기 위한 객체
		Connection conn = null;
		String str = "";
		try {
			String DB_URL = "jdbc:mysql://localhost:3307/school";
			String DB_USER = "root";
			String DB_PASSWORD = "****";
			Statement stmt;
			Class.forName("com.mysql.jdbc.Driver");
			//MySql드라이버 로딩
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			String sql = "insert into custom_num values (null,?)";
			pstmt = conn.prepareStatement(sql);
			//insert를 수행하는 커넥션을 수행
			pstmt.setString(1, name);
			//?로 쓰여진 자리수에 전달
			pstmt.executeUpdate();
			//insert수행
			out.println("custom_num 테이블에 새로운 레코드를 추가했습니다.");
			//수행이 완료 된 경우 출력
		} catch (Exception e) {
			e.printStackTrace();
			out.println("custom_num 테이블에 새로운 레코드를 추가에 실패했습니다");
			//수행이 않된 경우 출력
		} finally {
			//예외가 발생 하든 안하든 마지막 수행
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException sqle) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException sqle) {
				}
		}
	%>
</body>
</html>