<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<body>
<div align="center">
<h2>주소록 에러</h2>
<hr>
<table cellpadding="5" width="400">
	<tr width=100% bgcolor="pink">
		<td>주소록을 처리 중 에러가 발생 했습니다.<BR>
		관리자에게 문의해주세요<br>
		빠른 시일 내에 복구하겠습니다.
		<hr>
		에러 내용:<%=exception%>
		<hr>
		</td>
	</tr>
</table>
</div>
</body>
</html>