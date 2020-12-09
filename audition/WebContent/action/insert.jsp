<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
int artist_id = Integer.parseInt(request.getParameter("artist_id"));
int amount = Integer.parseInt(request.getParameter("amount"));
String date = request.getParameter("purchase_date");

try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection
	("jdbc:oracle:thin:@//localhost:1521/xe", "taeseok", "1234");
	
	Statement stmt = conn.createStatement();
	String query="SELECT PRICE FROM PRODUCT WHERE ARTIST_ID = " + artist_id;
	ResultSet rs = stmt.executeQuery(query);
	rs.next();
	int price = rs.getInt(4);
	rs.close();
	
	String insert_query = "INSERT INTO (SALE_ID, PRODUCT_ID, PURCHASE_DATE, SALE_PRICE, AMOUNT) "+
						  "VALUES(SEQ_SALE.NEXTVAL, %d, '%s', %d, %d)";
	

	stmt.executeQuery(String.format(insert_query,artist_id, date, price * amount, amount));
	
	out.println(price);
	
	stmt.close();
	conn.close();
	}
	catch(Exception e){
	e.printStackTrace();
}

response.sendRedirect("../index.jsp?section=sale_lookup");
%>