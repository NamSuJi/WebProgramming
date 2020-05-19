<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="DBConnection.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	// 데이터베이스 연결관련 변수 선언
	Connection conn = new DBConnection().getConnection();
	Statement stmt = null;
	String strSQL = "";
	if(request.getParameter("id")!=null){
		strSQL = "Insert Into jspdb.tb_user(id,email,pwd)";
		strSQL += " values('"+request.getParameter("id")+"','"+request.getParameter("email")+"','123');";

		if(conn!=null){
			stmt = conn.createStatement();
			if(stmt.executeUpdate(strSQL)>0){
				out.print("<script>alert('success'"+");</script>");
			}
		}
	}
	if(stmt!=null) stmt.close();
%>
<HTML>
<HEAD><TITLE>ch12 : JDBC 테스트 </TITLE></HEAD>
<BODY>
<center>
<H2>ch12:jdbctest_dbcp.jsp</H2>
<HR>

<form name=form1 method=post action=jdbctest_dbcp.jsp>
등록이름 : <input type=text name=id>
email주소 : <input type=text name=email size=20>
<input type=submit value="등록">
</form>
<HR>
</center>
# 등록 목록<P>
<%
	// select 문장을 문자열 형태로 구성한다.
	String sql = "select id, email from jspdb.tb_user;";

	// select 를 수행하면 데이터정보가 ResultSet 클래스의 인스턴스로 리턴됨.
	ResultSet rs = null;
	int i=1;
	if(conn!=null){
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		// 마지막 데이터까지 반복함.
		while(rs.next()) {
			out.println(i+" : "+rs.getString(1)+" , "+rs.getString("email")+"<BR>");
			i++;
		}
	}
%>
</BODY>
</HTML>