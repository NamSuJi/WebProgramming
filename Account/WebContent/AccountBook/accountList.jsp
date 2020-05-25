<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="lib/header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String num = request.getParameter("inData");
	
	String money = "";
	String category = "";
	String subject = "";
	String toprice = "";
	//int price = 0;
	String memo = "";
	String date = "";

	if(num!=null){		
		String strSQL = "Select money,category,subject,price,memo,date from jspdb.account where num='"+num+"';";
		Connection conn = new DBConnection().getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		if(conn!=null){	
			stmt = conn.createStatement();
			rs = stmt.executeQuery(strSQL);
			
			if(rs.next()){
				money = rs.getString("money");
				category = rs.getString("category");
				subject = rs.getString("subject");
				toprice = rs.getString("price");
				//price = Integer.parseInt(toprice);
				memo = rs.getString("memo");
				memo = memo.replace("<br />","\r\n");
				date = rs.getString("date");
			}
		}
		if(rs!=null) rs.close();
		if(stmt!=null) stmt.close();
		if(conn!=null) conn.close();
	}
%>
<div align="center" class="accountDiv">
   	<table class="accountTable">
   		<tr class="subtitle"><td colspan="3"> 내역 추가 </td></tr>
   		<tr class="doLeft">
   			<td colspan="2">
				<input type="button" class="accountButton" value="목록" onclick="goAccount()"/>
	   			<input type="button" class="accountButton" value="추가" onclick="goAccountSave('<%=num%>')"/>
				<input type="button" class="accountButton" value="삭제" onclick="goAccountDelete('<%=num%>')"/>
			</td>
		</tr>
   		<tr>
   			<td>목록</td>
   			<td class="doLeft">
   			<select class="accountSelect" name="txtmoney" onchange="categoryChange(this);">
   				<option>선택</option>
   				<option value="입금" <%if(money.equals("입금")){%>selected<%} %>>입금</option>
   				<option value="지출" <%if(money.equals("지출")){%>selected<%} %>>지출</option>
   			</select>
   			<select class="accountSelect" id="txtcategory" name="txtcategory">
   				<%if(category.equals("")){ %><option>선택해주세요</option><%} 
   				else{%><option><%=category %></option><%} %>
   			</select>
   			</td>
   		<tr>
   			<td>내역</td>
   			<td class="doLeft">
   				<input type="text" class="accountText"name="txtsubject" placeholder='내역' value="<%=subject%>"/>
   			</td>
		</tr>
		<tr>
			<td>날짜</td>
			<td class="doLeft"><input type="date" name="txtdate" value="<%=date%>"/></td>
		</tr>
   		<tr>
   			<td>가격</td>
   			<td class="doLeft">
   				<input type="text" class="accountText"name="txtprice" placeholder='가격' value="<%=toprice%>"/>
   			</td>
		</tr>
		<tr>
			<td>상세내용</td>
			<td class="doLeft"><textarea class="accountTextArea" name="txtmemo" placeholder="상세 내역"><%=memo%></textarea></td>
		</tr>
   	</table>
</div>
<%@ include file="lib/footer.jsp" %>
