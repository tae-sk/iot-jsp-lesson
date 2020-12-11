<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
int saleno = Integer.parseInt(request.getParameter("saleno"));
String pcode = request.getParameter("pcode");
String date = request.getParameter("date");
String scode = request.getParameter("scode");
int amount = Integer.parseInt(request.getParameter("amount"));
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost/xe", "taeseok", "1234");
	
	String query = "INSERT INTO TBL_SALELIST_01(SALENO, PCODE, SALEDATE, SCODE, AMOUNT) VALUES(?, ?, ?, ?, ?)";
	PreparedStatement stmt = conn.prepareStatement(query);
	
	stmt.setInt(1, saleno);
	stmt.setString(1, pcode);
	stmt.setString(1, date);
	stmt.setString(1, scode);
	stmt.setInt(1, amount);
	
	ResultSet rs = stmt.executeQuery(String.format(query, saleno, pcode, date, scode, amount));
	stmt.close();
	conn.close();
} catch (Exception e) {
	e.printStackTrace();
}
response.sendRedirect("../index.jsp?section=insert_sales");
%>