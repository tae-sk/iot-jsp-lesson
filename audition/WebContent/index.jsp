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
	case "sale_registration":
		%> <%@ include file="page/audition_submit.jsp" %><%
		break;
	case "audition_player_list":
		%> <%@ include file="page/audition_player_list.jsp" %><%
		break;
	case "audition_mento_number":
		%> <%@ include file="page/audition_mento_number.jsp" %><%
		break;
	case "audition_player_number":
	%> <%@ include file="page/audition_player_number.jsp" %><%
	break;
	default:
		%> <%@ include file="static/index.jsp" %><%
	}
	%>
	<%@ include file="static/footer.jsp" %>
</body>
</html>