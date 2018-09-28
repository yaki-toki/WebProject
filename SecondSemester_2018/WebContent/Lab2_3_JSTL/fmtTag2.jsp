<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Formatting Tags2</title>
</head>
<body>
<h2>Formatting Tags2</h2>
<c:set var="num" value="123456789"/>
숫자 : <fmt:formatNumber value="${ num }" type="number"/><br/>
퍼센트 : <fmt:formatNumber value="${num }" type="percent" groupingUsed="true"/><br/>
<!-- groupingUsed를 false로 변경하면 ,가 출력되지 않는다. -->
달러 : <fmt:formatNumber value="${num }" type="currency" currencySymbol="$"/><br/>
패턴 : <fmt:formatNumber value="${num }" pattern="0.0000" groupingUsed="false"/><p/>
<fmt:parseNumber var = "i" integerOnly="true" value="123.456"></fmt:parseNumber>
실수를 제외한 정수 : <c:out value="${i }"/>
</body>
</html>