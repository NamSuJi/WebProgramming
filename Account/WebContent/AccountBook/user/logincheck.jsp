<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../lib/DBConnection.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	boolean result = false;
	String msg = "로그인에 실패하였습니다.";
	String url = "../index.jsp";
	
	String strSQL = "Select id from jspdb.tb_user where id='"+id+"' and pwd='"+pwd+"';";
	//out.print(strSQL);
	
	Connection conn = new DBConnection().getConnection();
	Statement stmt = null;
	ResultSet rs = null;
	if(conn!=null){
		stmt = conn.createStatement();
		rs = stmt.executeQuery(strSQL);
		
		if(rs.next())	result = true;
		
		if(result){
			msg = "로그인에 성공하였습니다.";
			session.setAttribute("userID", id);
		}
		else{ url = "login.jsp"; }
	}
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close(); 
%>
<script> 
	alert("<%=msg%>");
	location.href= "<%=url%>";
</script>
