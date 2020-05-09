<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.SQLException" %> 
<%
class DBConnection{
	final static String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&characterEncoding=UTF-8";
	final static String user = "root";
	final static String password = "comeng2019";
	
	public DBConnection(){}
	
	public Connection getConnection(){
		Connection conn = null;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url,user,password);
		} 
		catch(Exception e){
			 if(e instanceof ClassNotFoundException){
				System.out.println("Driver Loading Fail: " + e.toString());
				return conn;
			}else{
				System.out.println("DB Connection Fail: " + e.toString());
				return conn;
			}
		}
		return conn;
	}
}
%>
