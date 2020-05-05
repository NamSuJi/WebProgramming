<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="lib/DBConnection.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String msg = "회원탈퇴에 성공하였습니다.";
String url = "index.jsp";
String userID = request.getParameter("inData");
String strSQL = "Delete from jspdb.tb_user where id = '"+userID+"';";
//out.print(strSQL);
Connection conn = new DBConnection().getConnection();
Statement stmt = null;
if(conn!=null){
	stmt = conn.createStatement();
	if(stmt.executeUpdate(strSQL)>0){
		//세션에 저장된 userID 제거	
		session.removeAttribute("userID");
		//현재 세션을 서버에서 제거
		session.invalidate();
	}
	else{
		msg = "회원탈퇴에 실패하였습니다.<br />관리자에게 문의 바랍니다.";
		url = "userInfo.jsp";
	}
}
if(stmt!=null) stmt.close();
if(conn!=null) conn.close();
%>
<script> 
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>