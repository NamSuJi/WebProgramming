<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="lib/header.jsp" %>

<div align="center" class="accountDiv">
<table class="accountTable">
<tr class="title"><td>QnA</td></tr>
<%
	String strSQL = "Select num,userID,subject,regdate FROM jspdb.tb_board where category='account'";
	strSQL += "order by num desc;";
	//out.print(strSQL);
	
	Connection conn = new DBConnection().getConnection();
	Statement stmt = null;
	ResultSet rs = null;
	if(conn!=null){
		stmt = conn.createStatement();
		rs = stmt.executeQuery(strSQL);
		
		while(rs.next()){
			int num = rs.getInt("num");
			String id = rs.getString("userID");
			String subject = rs.getString("subject");
			String regdate = rs.getString("regdate");
%>
		<tr class="trhover" onclick="javascript:goView('<%=num%>')">
			<td class="ListTd1">&nbsp;<%=subject%></td>
			<td class="ListTd2"><%=id%></td>
			<td class="ListTd2"><%=regdate%></td>
		</tr>
<%		
		}
	}
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
	
	if(!userID.equals("guest")){
%>
	<tr>
		<td class="doRight">
			<input type="button" value="쓰기" class="button1" onclick="javascript:goWrite()"/>
		</td>
	</tr>
<%	}%>
</table>
</div>
<%@ include file="lib/footer.jsp" %>