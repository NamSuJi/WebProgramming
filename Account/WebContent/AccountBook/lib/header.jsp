<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Money</title>
    <link rel="stylesheet" type="text/css" href="lib/css/header.css?v=<%=System.currentTimeMillis() %>">
  	<script type="text/javascript" src=".js/jquery-3.1.0.min.js"></script>
  	<script type="text/javascript" src="lib/js/header.js?v=<%=System.currentTimeMillis() %>"></script>
  	
  </head>
  <body>
   	<!-- head -->
   	<div class="headerDiv">
	   	<div id="mySidenav" class="sidenav">
	   		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	   		<a href="user/login.jsp"> 로그인 </a>
	   		<a href="account.jsp"> 가계부 </a>
	   		<a href="statistics.jsp"> 통계 </a>
	   		<a href="QnA.jsp"> QnA </a>
	   	</div>
	   	<span style="font-size:30px;curosr:pointer" onclick="openNav()">&#9776; Menu</span>
   		<div class="centerLogo"><a href="index.jsp">Money</a></div>
   	</div>