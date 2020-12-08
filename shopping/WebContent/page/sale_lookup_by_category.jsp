<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<h3>카테고리별 매출현황 조회</h3>
<table border="1">
<tr>
	<td>카테고리 이름</td>
	<td>총 판매 금액</td>
	<td>판매 개수</td>
	</tr>
<%
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection
	("jdbc:oracle:thin:@//localhost:1521/xe", "taeseok", "1234");
	
	Statement stmt = conn.createStatement();
	String query = "SELECT " +
	               "category.name, sub(SALE.SALE_NAME) " +
	               "FROM " +
	           	   "	SALE, " +
	               "	PRODUCT, " +
	           	   " 	category " +
	               "WHERE " +
	           	   "	SALE.PRODUCT_ID = PRODUCT.PRODUCT_ID and " +
	               "  	category.CATEGORY_ID = PRODUCT.CATEGORY_ID " +
	           	   "group by " +
	               "	category.CATEGORY_ID, category.name ";
	ResultSet rs = stmt.executeQuery(query);
	
	while(rs.next()){
		%>
		<tr>
			<td><%=rs.getInt(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getInt(4) %></td>
			<td><%=rs.getInt(5) %></td>
		</tr>
		<% 
	}
	
	stmt.close();
	conn.close();
	}
	catch(Exception e){
	e.printStackTrace();
}
%>
</table>