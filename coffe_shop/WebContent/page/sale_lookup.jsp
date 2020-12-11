<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.text.DecimalFormat" %>
<h3>판매현황</h3>
<table border="1">
  <tr>
    <th>비번호</th>
    <th>상품코드</th>
    <th>판매날짜</th>
    <th>매장코드</th>
    <th>상품명</th>
    <th>판매수량</th>
    <th>총판매액</th>
  </tr>

<%
	
	DecimalFormat delete_section = new DecimalFormat("###,###");
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
				("jdbc:oracle:thin:@//localhost/xe", "taeseok", "1234");
		Statement stmt = conn.createStatement();
		String query = "select salelist.saleno, salelist.pcode, salelist.saledate, salelist.scode, product.name, salelist.amount, salelist.amount * product.cost from "+ 
				"tbl_product_01 PRODUCT, tbl_shop_01 SHOP, tbl_salelist_01 SALELIST "+
				"WHERE salelist.pcode = product.pcode "+
				"AND shop.scode = salelist.scode";
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
            %>
                    <tr>
                        <td><%= rs.getInt(1)%></td>
                        <td><%= rs.getString(2)%></td>
                        <td><%= rs.getString(3)%></td>
                        <td><%= rs.getString(4)%></td>
                        <td><%= rs.getString(5)%></td>
                        <td><%= rs.getInt(6)%></td>
                        <td><%= delete_section.format(rs.getInt(7)) %></td>
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