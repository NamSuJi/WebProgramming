<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.removeAttribute("userID");
	
	session.invalidate();
	response.sendRedirect("../index.jsp"); 
%>

<script>
	alert('로그아웃 되셨습니다.');
</script>
