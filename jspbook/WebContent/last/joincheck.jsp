<%@ include file="lib/DBConnection.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("txtId");
	String email = request.getParameter("txtEmail");
	String pwd = request.getParameter("txtPwd");
	boolean result = false;
	String msg = "가입에 실패하였습니다.";
	String url = "login.jsp";
	
	String strSQL = "Insert Into jspdb.tb_user(id,email,pwd)";
	strSQL += " values('"+id+"','"+email+"','"+pwd+"');";
	
	//out.print(strSQL);
	
	Connection conn = new DBConnection().getConnection();
	Statement stmt = null;
	ResultSet rs = null;
	if(conn!=null){
		stmt = conn.createStatement();
		if(stmt.executeUpdate(strSQL)>0){
			result = true;
		}
		
		if(result){
			msg = "가입에 성공하였습니다.";
		}
		else{ url = "join.jsp"; }
	}
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close(); 
	
%>
<script> 
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>
