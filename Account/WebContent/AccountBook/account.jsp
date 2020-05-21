<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="lib/header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	Calendar cal1= Calendar.getInstance();
	Calendar cal2= Calendar.getInstance();
	cal1.setTime(new Date());//지난 달
	cal2.setTime(new Date());//현재 달
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	cal1.add(Calendar.MONTH, -1);

	String date1=request.getParameter("inDate1");
	String date2=request.getParameter("inDate2");
	if(date1==null||date1.length()==0) date1 = df.format(cal1.getTime());
	if(date2==null||date2.length()==0) date2 = df.format(cal2.getTime());
	
	if(!userID.equals("guest")){
%>
<div align="center" class="accountDiv">
   	<table class="accountTable">
   		<tr class="title"><td colspan="3"> 가계부 </td></tr>
   		<tr>
   			<td colspan="4" class="date">
   				<input type="date" name="date1" value="<%=date1%>"/>
   				~
   				<input type="date" name="date2" value="<%=date2%>"/>
   				<input type="button" class="accountButton" value="조회" onclick="javascript:reaccount();"/>
   				<input type="button" class="accountButton" value="추가" onclick="javascript:goAccountList('');"/>
   			</td>
   		</tr>
   		<tr>
   			<th class="th1"> Money </th>
   			<th class="th2"> Category </th>
   			<th class="th3"> Content </th>
   			<th class="th4"> Price </th>
   			<th class="th5"> Date </th> 
		</tr>
	<%
		String strSQL = "Select num,money,category,subject,date,price From jspdb.account where id='"+userID+"' ";
		strSQL+="and date between '"+date1+"' and '"+date2+"' order by date desc,num desc";
		//out.print(strSQL);
		String money = "";
		String moneytr = "";
		String moneytd = "";
		String toprice = "";
		int price = 0;
		
		Connection conn = new DBConnection().getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		if(conn!=null){
			stmt = conn.createStatement();
			rs = stmt.executeQuery(strSQL);
			while(rs.next()){ 
				money = rs.getString("money");
				toprice = rs.getString("price");
				price = Integer.parseInt(toprice);
		%>
		<% 
			if(money.equals("입금")){ moneytr="inTr"; moneytd="inTd"; }
			else if(money.equals("지출")){ moneytr="outTr"; moneytd="outTd"; }
		%>
		<tr class="<%=moneytr%>" onclick="javascript:goAccountList('<%=rs.getString("num")%>')">
			<td class="<%=moneytd%>"><%=rs.getString("money") %></td>
			<td><%=rs.getString("category") %></td>
			<td><%=rs.getString("subject") %></td>
			<td><%=formatter.format(price) %></td>
			<td><%=rs.getString("date") %></td>
		</tr>
		<%
				}
			}
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}
		
		else{
			out.print("<script>alert('로그인 해주세요');</script>");
			//out.print("<script>location.href='index.jsp';</script>");
			out.print("<script>location.replace('index.jsp');</script>");
		}	
		%>
   	</table>
</div>
<%@ include file="lib/footer.jsp" %>