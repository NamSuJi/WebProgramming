<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="lib/DBConnection.jsp" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");
String strSQL = "";
/* 날짜 형식을 YY-mm-dd로 받기 위해 선언 및 사용 */
LocalDateTime current = LocalDateTime.now();
DateTimeFormatter formatter = DateTimeFormatter.ISO_DATE;
String regdate = current.format(formatter);
String userID = request.getParameter("userID");
String num = request.getParameter("inData");
String subject = request.getParameter("txtSubject");
String content = request.getParameter("txtContent");
content = content.replace("\r\n","<br />").replace("<", "/");
String url="";

if(num.equals("")){
	strSQL = "insert into jspdb.tb_board(category,userID,subject,regdate,content) ";
	strSQL += "values('account','"+userID+"','"+subject+"','"+regdate+"','"+content+"');";
	
	url ="QnA.jsp";
}
else{
	strSQL = "Update jspdb.tb_board SET subject='"+subject+"', content='"+content+"' where num = "+num+";";
	
	url = "QnAview.jsp?inData="+num;
}
//out.print(strSQL);

Connection conn = new DBConnection().getConnection();
Statement stmt = null;
if(conn!=null){
	stmt = conn.createStatement();
	if(stmt.executeUpdate(strSQL)>0){
		response.sendRedirect(url);
	}
	else{
		out.print("fail");
	}
}
if(stmt!=null) stmt.close();
if(conn!=null) conn.close();

%>
