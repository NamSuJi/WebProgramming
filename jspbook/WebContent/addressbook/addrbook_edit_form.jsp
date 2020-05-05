<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp" import="jspbook.addrbook.*" %>
    <jsp:useBean id="gb" scope="request" class="jspbook.addrbook.AddrBook" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="addrbook.css" type="text/css" media="screen" />

<meta charset="UTF-8">
<title>주소록:수정화면</title>
</head>
<body>
<div align="center">
<h2>주소록:작성화면</h2>
<hr>
<a href="addrbook_list.jsp">목록</a>
<form name="form1" method="post" action="addrbook_control.jsp">
<input type="hidden" name="action" value="update">
<input type="hidden" name="ab_id" value="<%=gb.getAb_id() %>">
<input type="hidden" name="action" value="update" >
<table border="1">
<tr> 
	<th>이름</th>
	<td><input type="text" name="ab_name" maxlength="15" value="<%=gb.getAb_name()%>"></td>
</tr>
<tr> 
	<th>email</th>
	<td><input type="text" name="ab_email" maxlength="50" value="<%=gb.getAb_email()%>"></td>
</tr>
<tr> 
	<th>전화번호</th>
	<td><input type="text" name="ab_tel" maxlength="20" value="<%=gb.getAb_tel()%>"></td>
</tr>
<tr> 
	<th>생일</th>
	<td><input type="date" name="ab_birth" value="<%=gb.getAb_birth()%>"></td>
</tr>
<tr> 
	<th>회사</th>
	<td><input type="text" name="ab_comdept" maxlength="20" value="<%=gb.getAb_comdept()%>"></td>
</tr>
<tr> 
	<th>메모</th>
	<td><input type="text" name="ab_memo" value="<%=gb.getAb_memo()%>"></td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="저장">
		<input type="reset" value="취소">
		<input type="button" value="삭제" onClick="delcheck()">
	</td>
</tr>
</table>
</form>
</div>
</body>
</html>
<script language="JavaScript">
 function delcheck(){
	 result=confirm("정말로 삭제하시겠습니까?");
	 
	 if(result){
		 document.form1.action.value="delete";
		 document.form1.submit();
	 }
	 else
		 return ;
 }
</script>