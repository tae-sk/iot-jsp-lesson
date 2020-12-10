<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3 style="text-align: center; ">매출전표등록</h3>

<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//localhost:1521/xe", "taeseok", "1234");
		
		Statement stmt = conn.createStatement();
		String query = "SELECT '[' || PCODE || ']' || PNAME FROM TBL_PIZZA_01";
		ResultSet rs = stmt.executeQuery(query);
%>
<script>
function submit_form() {
	if (document.input_form.scode.value === "") {
		alert("지점코드가 입력되지 않았습니다!");
		return;
	}
	if (document.input_form.sale_date.value === "") {
		alert("판매일자가 입력되지 않았습니다!");
		return;
	}
	if (document.input_form.pcode.value === "") {
		alert("피자코드가 입력되지 않았습니다!");
		return;
	}
	if (document.input_form.amount.value === "") {
		alert("판매수량이 입력되지 않았습니다!");
		return;
	}
	alert("매출전표가 정상적으로 등록되었습니다!");
	document.input_form.submit();
}
function reset_form() {
	alert("정보를 지우고 처음부터 다시 입력합니다.");
	document.input_form.reset();
}
</script>
<h3>매출전표등록</h3>
<form action="action/insert.jsp" method="post" name="input_form">
	<table border="1">
		<tr>
			<td>매출전표번호</td>
			<td><input type="text" name="saleno"></td>
		</tr>
		<tr>
			<td>지점코드</td>
			<td><input type="text" name="scode"></td>
		</tr>
		<tr>
			<td>판매일자</td>
			<td><input type="date" name="sale_date"></td>
		</tr>
		<tr>
			<td>피자코드</td>
			<td>
				<select name="pcode">
				<% 
				int i = 1;
				while (rs.next()) { %>
					<option value=<%= "AA0"+i %>><%= rs.getString(1) %></option>
				<% 
				i++;
				} %>
				</select>
			</td>
		</tr>
		<tr>
			<td>판매수량</td>
			<td><input type="number" name="amount"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="전표등록" onclick="submit_form()">
				<input type="button" value="다시쓰기" onclick="reset_form()">
			</td>
		</tr>
	</table>
</form>
<%
		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>