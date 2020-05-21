<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="lib/DBConnection.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String num = request.getParameter("inData");
String url = "";
String strSQL = "Delete from jspdb.account where num = "+num+";";

Connection conn = new DBConnection().getConnection();
Statement stmt = null;
if(conn!=null){
	stmt = conn.createStatement();
	if(stmt.executeUpdate(strSQL)>0){
		url = "account.jsp";
		out.print("<script>alert('"+"삭제되었습니다.');</sciprt>");
		response.sendRedirect(url);
	}
	else{
		out.print("fail");
	}
}
if(stmt!=null) stmt.close();
if(conn!=null) conn.close();
%>
