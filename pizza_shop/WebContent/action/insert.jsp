<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
int saleno = Integer.parseInt(request.getParameter("saleno"));
String scode = request.getParameter("scode");
String saledate = request.getParameter("sale_date");
String pcode = request.getParameter("pcode");
int amount = Integer.parseInt(request.getParameter("amount"));
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost/xe", "taeseok", "1234");
	
	Statement stmt = conn.createStatement();
	
	String query = "insert into TBL_SALELIST_01 values (%d,'%s','%s','%s',%d)";
	
	ResultSet rs = stmt.executeQuery(String.format(query,saleno,scode,saledate,pcode,amount));
	
	conn.commit();
	stmt.close();
	
	conn.close();
} catch (Exception e) {
	e.printStackTrace();
}
response.sendRedirect("../index.jsp");
%>