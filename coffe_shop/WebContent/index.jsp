<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
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
	case "sale_registration":
		%> <%@ include file="page/sale_registration.jsp" %><%
		break;
	case "sale_lookup":
		%> <%@ include file="page/sale_lookup.jsp" %><%
		break;
	case "sale_lookup_by_shop":
		%> <%@ include file="page/sale_lookup_by_shop.jsp" %><%
		break;
	case "product_sale":
		%> <%@ include file="page/product_sale.jsp" %><%
		break;
	default:
		%> <%@ include file="static/index.jsp" %><%
	}
		%>
		<%@ include file="static/footer.jsp" %>
</body>
</html>