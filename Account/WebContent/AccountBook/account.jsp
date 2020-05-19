<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ include file="lib/header.jsp" %>
<%
	Calendar cal1= Calendar.getInstance();
	Calendar cal2= Calendar.getInstance();
	cal1.setTime(new Date());
	cal2.setTime(new Date());
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	cal2.add(Calendar.MONTH, -1);
%>
<div align="center" class="accountDiv">
   	<table class="accountTable">
   		<tr class="title"><td colspan="3"> 가계부 </td></tr>
   		<tr>
   			<td colspan="2" class="date">
   				<input type="date" name="date1"/>
   				~
   				<input type="date" name="date2"/>
   				<input type="button" value="조회" onclick=""/>
   			</td>
   			<td class="button"><input type="button" value="+" onclick=""/></td>
   		</tr>
   		<tr>
   			<th class="th1"> Category </th>
   			<th class="th2"> Content </th>
   			<th class="th3"> Date </th> 
		</tr>
		<% 
		request.setCharacterEncoding("UTF-8");
		String userID=request.getParameter("userID");
		String date1=request.getParameter("date1");
		String date2=request.getParameter("date2");
		if(userID.equals("")){
			out.print("<script>alert('로그인 해주세요')</script>");
			out.print("<script>location.href('index.jsp')</script>");
		}
		else{
			if(date1.equals("")) date1 = df.format(cal1.getTime());
			if(date2.equals("")) date2 = df.format(cal2.getTime());
			
			/*String strSQL = "Select category,content,date From jspdb.tb_user where id='"+userID+" ";
			strSQL+="between '"+date1+"' and '"+date2+"' order by decs";
			
			Connection conn = new DBConnection().getConnection();
			Statement stmt = null;
			ResultSet rs = null;
			if(conn!=null){
				stmt = conn.createStatement();
				rs = stmt.executeQuery(strSQL);
				if(rs.next()){ 
		%>
		<tr>
			<td><%=rs.getString("category") %></td>
			<td><%=rs.getString("content") %></td>
			<td><%=rs.getString("date") %></td>
		</tr>
		<%
				}
			}
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();*/
		}
		%>
   	</table>
</div>
<%@ include file="lib/footer.jsp" %>