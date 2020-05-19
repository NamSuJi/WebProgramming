<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="DBConnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ch12:dhcp_test.jsp</title>
</head>
<body>
<h2>결과출력</h2>
<hr>
<%
	String strSQL = "Select id,email from jspdb.tb_user;";
	
	Connection conn = new DBConnection().getConnection();
	Statement stmt = null;
	ResultSet rs = null;
	if(conn!=null){
		stmt = conn.createStatement();
		rs = stmt.executeQuery(strSQL);
		
		while(rs.next()){
%>
			<div>이름:<%=rs.getString("id") %><br/>이메일:<%=rs.getString("email")%><hr></div>
<%
		}
	}
 %>
</body>
</html>