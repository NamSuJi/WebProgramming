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
String category = request.getParameter("inData");
String num = request.getParameter("num");
String subject = request.getParameter("txtSubject");
String content = request.getParameter("txtContent");
content = content.replace("\r\n","<br />").replace("<", "/");
int views = 0;
String viewURL="";
String listURL="";

if(num.equals("")){
	strSQL = "insert into jspdb.tb_board(category,userID,subject,regdate,views,content) ";
	strSQL += "values('"+category+"','"+userID+"','"+subject+"','"+regdate+"','"+views+"','"+content+"');";
	
	listURL ="list.jsp?inData="+category;
}
else{
	strSQL = "Update jspdb.tb_board SET subject='"+subject+"', content='"+content+"' where num = "+num+";";
	
	viewURL = "view.jsp?num="+num;
}
//out.print(strSQL);

Connection conn = new DBConnection().getConnection();
Statement stmt = null;
if(conn!=null){
	stmt = conn.createStatement();
	if(stmt.executeUpdate(strSQL)>0){
		if(num == "") response.sendRedirect(listURL);
		else response.sendRedirect(viewURL);
	}
	else{
		out.print("fail");
	}
}
if(stmt!=null) stmt.close();
if(conn!=null) conn.close();

%>
