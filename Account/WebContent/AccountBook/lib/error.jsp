<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page isErrorPage = "true" %>
<%@ include file="header.jsp" %>
	<style>
		.errorDiv{ border:1px solid #000; position:absolute; left:37%; top:30%;  }
	</style>
	<script>
		function goback(){ history.go(-1); }
	</script>
<div align="center" class="errorDiv">
<table>
	<tr>
		<td><h3>잘못된 접근입니다.</h3><hr></td>
	</tr>
	<tr>
		<td>
			에러 타입: <%= exception.getClass().getName() %> <br>
			에러 메시지: <b><%= exception.getMessage() %></b>
		</td>
	</tr>
	<tr>
		<td align="center"><br/><input type="button" value="돌아가기" onclick="goback();"/></td>
	</tr>
</table>
</div>
<%@ include file="footer.jsp" %>