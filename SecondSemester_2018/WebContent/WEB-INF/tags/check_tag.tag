<%@ tag body-content="empty" pageEncoding="euc-kr"%>
<%@ tag trimDirectiveWhitespaces="true"%>
<%@ tag dynamic-attributes="optionMap"%>
<%@ attribute name="name" required="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${optionMap}" var="option">
	<input type="checkbox" name="${name}" value="${option.value}">${option.value}</option>
</c:forEach>
