<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="lib/DBConnection.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String num = request.getParameter("inData");
String url = "QnA.jsp";
String strSQL = "Delete from jspdb.account_qna where num = "+num+";";

Connection conn = new DBConnection().getConnection();
Statement stmt = null;
if(conn!=null){
	stmt = conn.createStatement();
	if(stmt.executeUpdate(strSQL)>0){
		response.sendRedirect(url);
	}
	else{
		out.print("fail");
	}
}
if(stmt!=null) stmt.close();
if(conn!=null) conn.close();
%>
