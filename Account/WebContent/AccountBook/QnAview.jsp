<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="lib/header.jsp" %>

<div align="center" class='accountDiv'>
<%
request.setCharacterEncoding("UTF-8");
String num = request.getParameter("inData");
if(!num.equals("")){
	String name = "";
	String subject = "";
	String password = "";
	String content = "";
	String regdate = "";
	
	String strSQL = "Select subject, content, id, date from jspdb.account_qna where num = '"+num+"';";
	Connection conn = new DBConnection().getConnection();
	Statement stmt = null;
	ResultSet rs = null;
	if(conn!=null){	
		stmt = conn.createStatement();
		rs = stmt.executeQuery(strSQL);
		
		if(rs.next()){
			name = rs.getString("id");
			subject = rs.getString("subject");
			content = rs.getString("content").replace("<br />","\r\n"); 
			regdate = rs.getString("date");
		}
	}
	%>
<table class="QnATable">
	<tr class="viewTr">
		<th class="viewTh1"><span><%=subject%></span></th>
		<th class="viewTh2"><%=name%></th>
		<th class="viewTh3"><%=regdate%></th>
	</tr>
	<tr valign="top">
		<td colspan="4" class="viewContentTd"><xmp><%=content%></xmp></td>
	</tr>
	<tr class="viewTrButton">
		<td colspan="4">
			<input type="button" value="목록" class="goButton" onClick="goList();"/>
			<!-- 후에 session을 통해 얻은 ID가 글쓴이(name)와 일치할 시에 보여주도록 코드 수정 필요 -->
			<% if(userID.equals(name)){%>
			<input type="button" value="수정" class="goButton" onClick="goWrite(<%=num%>)"/>
			<%	if(userID.equals(name)) {%>
			<input type="button" value="삭제" class="goButton" onClick="goDelete(<%=num%>)"/>
			<%		}
				}
			}
			%>
		</td>
	</tr>
</table>
</div>
<%@ include file="lib/footer.jsp" %>