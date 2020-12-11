<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	function submit_form() {
		if (document.input_form.saleno.value === "") {
			alert("비번호를 입력해주세요");
			return;
		}
		if (document.input_form.pcode.value === "") {
			alert("상품코드를 입력해주세요");
			return;
		}
		if (document.input_form.date.value === "") {
			alert("판매날짜를 선택해주세요");
			return;
		}
		if (document.input_form.scode.value === "") {
			alert("매장코드를 입력해주세요");
			return;
		}
		alert("정상적으로 처리되었습니다.");
		document.input_form.submit();
	}
	function reset_form() {
		alert("정보를 지우고 처음부터 다시 입력합니다.");
		document.input_form.reset();
	}
	function reset_form() {
		document.input_form.reset();
	}
</script>
<h3>판매등록</h3>
<form action="action/insert_sales_action.jsp" method="post" name="input_form">
	<table border="1">
		<tr>
			<td>비번호</td>
			<td><input type="number" name="saleno"></td>
		</tr>
		<tr>
			<td>상품코드</td>
			<td><input type="text" name="pcode"></td>
		</tr>
		<tr>
			<td>판매날짜</td>
			<td><input type="date" name="date"></td>
		</tr>
		<tr>
			<td>매장코드</td>
			<td><input type="text" name="scode"></td>
		</tr>
		<tr>
			<td>판매수량</td>
			<td><input type="number" name="amount"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="등록하기" onclick="submit_form()">
				<input type="button" value="다시쓰기" onclick="reset_form()">
			</td>
		</tr>
	</table>
</form>