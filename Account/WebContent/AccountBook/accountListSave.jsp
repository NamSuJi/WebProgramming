<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="lib/DBConnection.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String strSQL = "";
String userID = (String) session.getAttribute("userID");
String num = request.getParameter("inData");
String money = request.getParameter("txtmoney");
String category = request.getParameter("txtcategory");
String subject = request.getParameter("txtsubject");
String memo = request.getParameter("txtmemo");
memo = memo.replace("\r\n","<br />").replace("<", "/");
String date = request.getParameter("txtdate");
String url = "";

if(num.equals("")){
	strSQL = "insert into jspdb.account(money,category,id,subject,memo,date) ";
	strSQL += "values('"+money+"','"+category+"','"+userID+"','"+subject+"','"+memo+"','"+date+"');";
	
	url ="account.jsp";
}
else{
	strSQL = "Update jspdb.account SET money='"+money+"',category='"+category+"',subject='"+subject+"', memo='"+memo+"', date='"+date+"' where num = "+num+";";
	
	url = "accountList.jsp?inData="+num;
}
out.print(strSQL);

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