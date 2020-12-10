<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.text.DecimalFormat" %>


<!DOCTYPE html>
<html>
<body>
<h3>통합매출현황조회</h3>
<table border=1>
	<tr>
		<td>판매 ID</td>
		<td>상점명</td>
		<td>판매 일자</td>
		<td>피자 코드</td>
		<td>피자명</td>
		<td>총 판매액</td>
		<td>매출액</td>
	</tr>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//localhost:1521/xe", "taeseok", "1234");
		
		Statement stmt = conn.createStatement();
		String query = "select " + 
							"SALELIST.SALENO, SHOP.SCODE || '-' || SHOP.SNAME, SALELIST.SALEDATE, PIZZA.PCODE, PIZZA.PNAME, SALELIST.AMOUNT, PIZZA.COST * SALELIST.AMOUNT as TOTAL_COST " +
						"FROM " +
							"TBL_SALELIST_01 SALELIST, TBL_SHOP_01 SHOP, TBL_PIZZA_01 PIZZA " +
						"WHERE " +
							"SALELIST.SCODE = SHOP.SCODE AND " +
							"SALELIST.PCODE = PIZZA.PCODE "+
						"ORDER BY "+
							"SALELIST.SALENO ";
		ResultSet rs = stmt.executeQuery(query);
		%>
		<%
		DecimalFormat df = new DecimalFormat("#,###");
		while (rs.next()) {
			%>
					<tr>
						<td><%= rs.getInt(1)%></td>
						<td><%= rs.getString(2)%></td>
						<td><%= rs.getString(3)%></td>
						<td><%= rs.getString(4)%></td>
						<td><%= rs.getString(5)%></td>
						<td><%= rs.getInt(6)%></td>
						<td><%= "\\"+df.format(rs.getInt(7)) %></td>
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