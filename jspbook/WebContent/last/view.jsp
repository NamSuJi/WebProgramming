<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="lib/header.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
	String num = request.getParameter("num");
	int number = Integer.parseInt(num);
	UpViews upviews = new UpViews();
	
	String category = "";
	String name = "";
	String subject = "";
	String password = "";
	String content = "";
	String regdate = "";
	int views = 0;
	
	String strSQL = "Select category,userID,subject,content,regdate,views FROM jspdb.tb_board where num="+number+";";
		
	Connection conn = new DBConnection().getConnection();
	Statement stmt = null;
	ResultSet rs = null;	
	if(conn!=null){
		stmt = conn.createStatement();
		rs = stmt.executeQuery(strSQL);
		
		if(rs.next()){
			category = rs.getString("category");
			name = rs.getString("userID");
			subject = rs.getString("subject");
			content = rs.getString("content").replace("<br />","\r\n"); 
			regdate = rs.getString("regdate");
			views = rs.getInt("views");
%>
<div class='wrap1'>
<table class="viewTable">
	<tr class="viewTr">
		<th class="viewTh1"><span><%=subject%></span></th>
		<th class="viewTh2"><%=name%></th>
		<th class="viewTh3"><%=regdate%></th>
		<th class="viewTh4"><%=++views%></th>
	</tr>
	<tr valign="top">
		<td colspan="4" class="viewContentTd"><xmp><%=content%></xmp></td>
	</tr>
	<tr class="viewTrButton">
		<td colspan="4">
			<input type="button" value="List" class="goButton" onClick="goList('<%=category%>')"/>
			<!-- 후에 session을 통해 얻은 ID가 글쓴이(name)와 일치할 시에 보여주도록 코드 수정 필요 -->
			<% if(userID.equals(name)){%>
			<input type="button" value="Edit" class="goButton" onClick="goWrite('<%=category%>',<%=number%>)"/>
			<%} if(userID.equals("admin")||userID.equals(name)){ %>
			<input type="button" value="Delete" class="goButton" onClick="goDelete('<%=category%>', <%=number%>)"/>
			<%}%>
		</td>
	</tr>
</table>
</div>
<%
		}
	}
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
	upviews.updateView(number,views);
%>

<%@ include file="lib/footer.jsp" %>