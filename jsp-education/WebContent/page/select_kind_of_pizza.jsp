<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<h3>SELECT</h3>
<body>
<table border="1">
	<tr>
		<td>피자명</td>
		<td>판매금액</td>
	</tr>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//122.128.169.32:1521/xe", "sdh_6", "1234");
		if (conn != null) {
			out.println("Database Connected!");
		}
		else {
			out.println("Database Connect Fail!");
		}
		Statement stmt = conn.createStatement();
		String query = "SELECT " +
			    "pizza.pname, " +
			    "SUM(pizza.cost * salelist.amount) AS total_cost " +
			"FROM " +
			    "tbl_salelist_01   salelist, " +
			    "tbl_pizza_01      pizza " +
			"WHERE " +
			    "salelist.pcode = pizza.pcode " +
			"GROUP BY " +
			    "pizza.pname, " +
			    "pizza.pcode " +
			"ORDER BY " +
			    "total_cost DESC ";
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
			%>
			<tr>
				<td><%= rs.getString(1) %></td>
				<td><%= rs.getInt(2) %></td>
			</tr>
			<%
		}
		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>
</table>
</body>
</html>
