<%@ include file="lib/header.jsp" %>

	<div class='divcenter'>
		<div class='centerin'>
			<div class='centerbox'>
				<div class='centerboxsort'>For Developer</div>
			</div>
		</div>
	</div>
	<div class='divfooter'>
		<div class='footerin'>
		<table class='content'>
			<tr class='contenttr'>
			<%
			String strSQL = "Select num,category,content from jspdb.tb_board where featured='y';";
			
			Connection conn = new DBConnection().getConnection();
			Statement stmt = null;
			ResultSet rs = null;
			if(conn!=null){
				stmt = conn.createStatement();
				rs = stmt.executeQuery(strSQL);
				
				while(rs.next()){
			%>
				<td class='contenttd' onclick="javascript:goView(<%=rs.getInt("num")%>)">
					<div class='contentwrap'>
						<div class='contentdiv1'> <%=rs.getString("category")%> </div>
						<div class='contentdiv2'> <%=rs.getString("content")%> </div>
					</div>
				</td>
			<%		
				}
			}
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			%>
			</tr>
		</table>
		</div>
	</div>

<%@ include file="lib/footer.jsp" %>
