<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Board.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Money</title>
    <link rel="stylesheet" type="text/css" href="lib/css/header.css?v=<%=System.currentTimeMillis() %>">
  	<link rel="stylesheet" type="text/css" href="lib/css/total.css?v=<%=System.currentTimeMillis() %>">
  	<link rel="stylesheet" type="text/css" href="lib/css/board.css?v=<%=System.currentTimeMillis() %>">
  	<script type="text/javascript" src=".js/jquery-3.1.0.min.js"></script>
  	<script type="text/javascript" src="lib/js/header.js?v=<%=System.currentTimeMillis() %>"></script>
  	<script type="text/javascript" src="lib/js/account.js?v=<%=System.currentTimeMillis() %>"></script>
  	<script type="text/javascript" src="lib/js/local.js?v=<%=System.currentTimeMillis() %>"></script>
  </head>
  <%
		String userID = "guest";
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
  %>
  <body>
	<form method="post" name='f'>
	<input type="hidden" name="inDate1" />
	<input type="hidden" name="inDate2" />
	<input type="hidden" name="inData" />
   	<!-- head -->
   	<div class="headerDiv">
	   	<div id="mySidenav" class="sidenav">
	   		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	   		<%
	   			if(userID=="guest"){
	   		%>
	   		<a href="user/login.jsp"> 로그인 </a>
	   		<% }else{ %>
	   		<a href='user/userConfirm.jsp'><%=userID%> 님!</a>
			<a href='user/logout.jsp'>로그아웃</a>
			<% } %>
	   		<a href="account.jsp"> 가계부 </a>
	   		<a href="statistics.jsp"> 통계 </a>
	   		<a href="QnA.jsp"> QnA </a>
	   	</div>
	   	<span style="font-size:30px;curosr:pointer" onclick="openNav()">&#9776; Menu</span>
   		<div class="centerLogo"><a href="index.jsp">Money</a></div>
   	</div>