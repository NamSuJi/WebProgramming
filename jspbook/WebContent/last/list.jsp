<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="lib/header.jsp" %>
<%
	Paging paging = new Paging();
	int currentPage = 1; //현재 페이지 번호
	String currentPage_temp = request.getParameter("currentPage");
	int totalCount = paging.getTotal();;//전체 게시물 수
	int countList = 10;//한 페이지에 보여줄 게시물 수
	int countPage = 5; // 한 페이지에 보이는 페이징 블럭 범위
	int totalPage = totalCount/countList;//나타나는 총 페이지 수
	int startPage = 0;
	int endPage = 0; 
	int startRow = 0;
	
	//현재 페이지 번호가 바뀌면 currentPage에 적용시켜줌
	if(currentPage_temp!= null){
		currentPage = Integer.parseInt(currentPage_temp);
	}
	
	if((totalCount%countList) > 0){
		totalPage++;
	}
	
	if(totalPage<currentPage){
		currentPage = totalPage;
	}
	
	startPage = (countPage*((currentPage-1)/countPage))+1;
	endPage = startPage + countPage - 1;
	startRow = (currentPage -1)*countList;
	
	if(endPage>totalPage){
		endPage = totalPage;
	}
%>
<!-- 쓰기는 로그인 되어 있을 시에 보여주도록 수정 필요 -->
<div class='wrap1'>
<table class="ListTable">
<%
	String category = request.getParameter("inData");
	//out.print(category);
	String strSQL = "Select num,userID,subject,regdate,views FROM jspdb.tb_board where category='"+category+"' ";
	strSQL += "order by num desc LIMIT "+startRow+","+countList+";";
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
			int views = rs.getInt("views");
%>
		<tr class="trhover" onclick="javascript:goView('<%=num%>')">
			<td class="ListTd1">[<%=category%>]&nbsp;<%=subject%></td>
			<td class="ListTd2"><%=id%></td>
			<td class="ListTd2"><%=regdate%></td>
			<td class="ListTd2"><%=views%></td>
		</tr>
<%		
		}
	}
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
%>
	
<%
	
%>
</table>

<table class="ListTable">
	<tr>
		<td class="ListPagingTd">
		<%
			if(currentPage>countPage){
		%>
		<!--<a href="list.jsp?currentPage=1">◁◁</a>-->
		<a href="list.jsp?currentPage=<%=startPage-1%>">◀</a>
		<%
			}
		%>
		<%
			for(int i=startPage;i<=endPage;i++){
				if(currentPage==i){	
					if(totalCount>countList){
		%>
				<a class="PagingButton"><%=i%></a>
		<%
					}
				}
				else{
		%>
				<a class="ListPagingButton" href="list.jsp?currentPage=<%=i%>"><%=i%></a>
		<%
				}
			}
		%>
		
		<%
			if(endPage<totalPage){
		%>
			<a href="list.jsp?currentPage=<%=endPage+1%>"> ▶ </a>
			<!--<a href="list.jsp?currentPage=<%=totalPage%>"> ▷▷ </a>-->
		<%
			}
		%>
		</td>
	</tr>
	<%
		if(!userID.equals("guest")){
	%>
	<tr>
		<td>
			<div class='buttondiv'>
				<input type="button" value="쓰기" class="button1" onclick="javascript:goWrite('<%=category%>')"/>
			</div>
		
		</td>
	</tr>
	<%}%>
</table>
</div>
<%@ include file="lib/footer.jsp" %>