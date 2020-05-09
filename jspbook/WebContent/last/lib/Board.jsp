<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="DBConnection.jsp" %>
<%@ page import="java.sql.*" %>
<%
	class Paging extends DBConnection{
		//전체 게시물 수를 구하는 함수
		public int getTotal(){
			int countTotal=0;
			
			String strSQL = "Select count(*) countTotal from jspdb.tb_board";
			
			Connection conn = new DBConnection().getConnection();
			Statement stmt = null;
			ResultSet rs = null;
			try{
				if(conn!=null){
					stmt = conn.createStatement();
					rs = stmt.executeQuery(strSQL);
					
					if(rs.next()){
						countTotal = rs.getInt("countTotal");
					}
				}
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e){ e.printStackTrace(); }
			return countTotal;
		}
	}
	class UpViews extends DBConnection{
		public int updateView(int num,int views){
			String strSQL = "Update jspdb.tb_board SET views="+views+" where num="+num+";";
			Connection conn = new DBConnection().getConnection();
			Statement stmt = null;
			ResultSet rs = null;
			try{
				if(conn!=null){
					stmt = conn.createStatement();
					if(stmt.executeUpdate(strSQL)>0){
					
					}
				}
					if(rs!=null) rs.close();
					if(stmt!=null) stmt.close();
					if(conn!=null) conn.close();
			}
			catch(Exception e){ e.printStackTrace(); }
			return views;
		}
	}
%>
