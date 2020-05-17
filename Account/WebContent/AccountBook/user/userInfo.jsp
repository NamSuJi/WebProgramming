<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../lib/DBConnection.jsp" %>
<%@ include file="../lib/userheader.jsp" %>
<form method="post" name='f'>
	<div class='wrap'>
		<div class='wrapbox'>
			<div class='boxtop'>
				<a href='../index.jsp'>Money</a>
			</div>
			<%
			String userID = "guest";
			if(session.getAttribute("userID") != null){
				userID = (String) session.getAttribute("userID");
			}
			
			String strSQL = "Select id,email From jspdb.tb_user where id='"+userID+"';";
			
			Connection conn = new DBConnection().getConnection();
			Statement stmt = null;
			ResultSet rs = null;
			if(conn!=null){
				stmt = conn.createStatement();
				rs = stmt.executeQuery(strSQL);
				if(rs.next()){
			%>
			<div class='login'>
				<div class='loginbox'>
					<input type='text' value='<%=rs.getString("id")%>' class='logininput' readonly />
				</div>
				<div class='loginbox'>
					<input type='email' value='<%=rs.getString("email")%>' class='logininput' readonly />
				</div>
				<div class='loginbox'>
					<input type='password' name='txtPwd' class='logininput' placeholder='PASSWORD' />
				</div>
				<div class='loginbox'>
					<input type='button' class='loginbutton' value='Update' onclick='goUserInfoUpdate();' />
				</div>
				<div class='loginbox'>
					<div class='joinbox'>
					<input type='hidden' name='inData' />
					<input type='button' class='joininput' value='회원탈퇴' onclick="goUserInfoDelete('<%=userID%>');" />
					</div>
				</div>
			</div>
			<%
				}
			}
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
			%>
		</div>
	</div>
</form>
<%@ include file="../lib/userfooter.jsp" %>
