<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="static/header.jsp" %>
	<%@ include file="static/nav.jsp" %>
	<%
	String section = request.getParameter("section") != null ? request.getParameter("section") : "";
		
	switch(section){
	case "sale_insert":
		%> <%@ include file="page/sale_insert.jsp" %><%
		break;
	case "sale_select":
		%> <%@ include file="page/sale_select.jsp" %><%
		break;
	case "shop_select":
		%> <%@ include file="page/shop_select.jsp" %><%
		break;
	case "thing_select":
	%> <%@ include file="page/thing_select.jsp" %><%
	break;
	default:
		%> <%@ include file="static/index.jsp" %><%
	}
	%>
	<%@ include file="static/footer.jsp" %>
</body>
</html>