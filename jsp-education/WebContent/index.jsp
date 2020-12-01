<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이정훈</title>
</head>
<body>
<%
	int[] arr = new int[100];
	arr[0] = 1;
	arr[1] = 1;
	
	for(int i = 2; i < 12; i++){
		arr[i] = arr[i-1] + arr[i-2];
	}
	
	for(int i = 0; i < 12; i++){
		out.print(arr[i]+"</br>");
	}
%>

	<table border = "1">
	<%
		int num = 1;
		for(int i = 0; i < 4; i++){
			out.print("<tr>");
			for(int j = 0; j < 3; j++){
				out.print("<td>"+num+++"</td>");
			}
			out.print("</tr>");
		}
	%>
	</table>
	
	<table border = "1">
		<tr>
			<td>1</td>
			<td>2</td>
		</tr>
		<tr>
			<td>3</td>
			<td>4</td>
		</tr>
		<tr>
			<td>5</td>
			<td>6</td>
		</tr>
	</table>
</body>
</html>