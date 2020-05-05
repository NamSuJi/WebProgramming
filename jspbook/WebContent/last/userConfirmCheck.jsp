<%@ include file="lib/DBConnection.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = "guest";
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	String pwd = request.getParameter("pwd");
	boolean result = false;
	String msg = "회원확인에 실패하였습니다.";
	String url = "userInfo.jsp";
	
	String strSQL = "Select id from jspdb.tb_user where id='"+userID+"' and pwd='"+pwd+"';";
	//out.print(strSQL);
	
	Connection conn = new DBConnection().getConnection();
	Statement stmt = null;
	ResultSet rs = null;
	if(conn!=null){
		stmt = conn.createStatement();
		rs = stmt.executeQuery(strSQL);
		
		if(rs.next())	result = true;
		
		if(result){
			msg = "회원확인에 성공하였습니다.";
		}
		else{ url = "index.jsp"; }
	}
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close(); 
%>
<script> 
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>
