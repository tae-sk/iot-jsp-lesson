<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String pageMain = request.getParameter("pageMain");
%>
	<a href="index.jsp?pageMain=A">A</a>
	<a href="index.jsp?pageMain=B">B</a>
	<a href="index.jsp?pageMain=C">C</a>
	<br>
	<br>
	<%
		if(pageMain == null){
			pageMain = "메인 페이지입니다";
		};
		switch(pageMain){
		case "A" : %> <%@ include file="page/A.jsp" %><% 
		break;
		
		case "B" : %> <%@ include file="page/B.jsp" %><% 
		break;
		
		case "C" : %> <%@ include file="page/C.jsp" %><%
		break; 
		
		};
		
		
	%>
	<% 
		int[] numbers = {1, 2, 3, 11, 12, 13, 21, 22, 23, 31, 32, 33, 41, 42, 43};
		int test = 0;
	
	%>
	 <table  border="1">
	 	<tr>
			<% 	 		
			for( int number : numbers){
				test++;
			%>
	 		<td><%=number%></td>
	 		<%
	 		if(test % 3 == 0 ){
	 			%></tr><tr><%
	 		}
			};
			%>
	 	</tr>
	 </table>
</body>
</html>