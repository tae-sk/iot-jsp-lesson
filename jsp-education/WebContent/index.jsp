<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이정훈</title>
</head>
<%
String section = request.getParameter("section") != null ? request.getParameter("section") : "";
%>
<body>
	<%@ include file="static/header.jsp" %>
	<%@ include file="static/nav.jsp" %>
	<%@ include file="static/footer.jsp" %>
	
	<%
	switch(section){
	case "insert":
		%><%@include file="page/insert.jsp" %><%
		break;
	case "select":
		%><%@include file="page/select.jsp" %><%
		break;
	default:
		%><%@include file="static/index.jsp" %><%
	}
	%>
</body>
</html>