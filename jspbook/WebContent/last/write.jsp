<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="lib/header.jsp" %>

<div class='wrap1'>
<%
request.setCharacterEncoding("UTF-8");
String num = request.getParameter("num");
String category = request.getParameter("inData");
if(!num.equals("")){
	String subject;
	String content;
	String strSQL = "Select subject, content from jspdb.tb_board where num = "+num+";";
	Connection conn = new DBConnection().getConnection();
	Statement stmt = null;
	ResultSet rs = null;
	if(conn!=null){	
		stmt = conn.createStatement();
		rs = stmt.executeQuery(strSQL);
		
		if(rs.next()){
			subject = rs.getString("subject");
			content = rs.getString("content");
			content = content.replace("<br />","\r\n");
	%>
	<table class="writeTable">
		<tr class="writeSubject">
			<td class="writeSubject1">제목</td>
			<td class="writeSubject2"><input class="textArea" type="textarea" name="txtSubject" value="<%=subject%>"/></td>
		</tr>
		<tr class="writeContent">
			<td class="writeContent1">내용</td>
			<td class="writeContent2"><textarea class="textArea" name="txtContent"><%=content%></textarea></td>
		</tr>
		<tr class="writeButton">
			<td colspan="2">
				<div align="right">
					<input type="button" value="List" class="goButton" onclick="goList('<%=category%>')"/>
					<input type="button" value="Upload" class="goButton" onclick="javascript:goSave('<%=category%>', '<%=userID%>', <%=Integer.parseInt(num)%>)"/>
				</div>
			</td>
		</tr>
	</table>
	<%
		}
	}
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
}
else{
%>
	<table class="writeTable">
		<tr class='writeSubject'>
			<td class="writeSubject1">제목</td>
			<td class="writeSubject2">
				<input type="text" class="textArea" name="txtSubject" />
			</td>
		</tr>
		<tr class='writeContent'>
			<td class="writeContent1">내용</td>
			<td class="writeContent2">
				<textarea class="textArea" name="txtContent"></textarea>
			</td>
		</tr>
		<tr class='writeButton'>
			<td colspan="2" class="writeButton">				
				<div align="right">
					<input type="button" class="goButton" onclick="goList('<%=category%>')" value="List" />
					<input type="button" class="goButton" value="Upload" onclick="javascript:goSave('<%=category%>', '<%=userID%>')" />
				</div>
			</td>
		</tr>
	</table>
<%
}
%>
</div>
<%@ include file="lib/footer.jsp" %>