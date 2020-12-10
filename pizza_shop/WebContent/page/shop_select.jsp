<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.text.DecimalFormat" %>


<!DOCTYPE html>
<html>
<body>
<h3>지점별 매출 현황</h3>
<table border=1>
	<tr>
		<td>피자 코드</td>
		<td>피자 명</td>
		<td>총매출액</td>
	</tr>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//localhost:1521/xe", "taeseok", "1234");
		
		Statement stmt = conn.createStatement();
		String query = "SELECT PIZZA.PCODE, PIZZA.PNAME, SUM(SALE.AMOUNT * PIZZA.COST) total "+
					   "FROM TBL_SHOP_01 SHOP, tbl_salelist_01 SALE, TBL_PIZZA_01 PIZZA "+
					   "WHERE SALE.SCODE = SHOP.SCODE AND SALE.PCODE = PIZZA.PCODE "+
					   "GROUP BY PIZZA.PCODE, PIZZA.PNAME "+
					   "ORDER BY total DESC";
		ResultSet rs = stmt.executeQuery(query);
		%>
		<%
		DecimalFormat df2 = new DecimalFormat("#,###");
		while (rs.next()) {
			%>
					<tr>
						<td><%= rs.getString(1)%></td>
						<td><%= rs.getString(2)%></td>
						<td><%= "\\"+df2.format(rs.getInt(3)) %></td>
					</tr>
			<%
		}
		%>
		<%
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