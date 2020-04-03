<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scriptlet1.jsp</title>
</head>
<body>
<div align="center">
<h2>스크립트릿 테스트1:1~10까지 출력</h2>
<hr>
<%
	for(int i = 1; i < 11; i++) out.println(i+"<br>");
%>
</div>
</body>
</html>
