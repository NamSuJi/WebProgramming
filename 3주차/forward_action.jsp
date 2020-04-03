<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forward_action.jsp</title>
</head>
<body>
<h2>forward_action.jsp에서 footer.jsp 호출</h2>
<hr>
forward_action.jsp에서 호출한 메시지입니다.<br>
<jsp:forward page = "footer.jsp">
<jsp:param name="email" value="test2@test.net"/>
<jsp:param name="tel" value="010-111-1111"/>
</jsp:forward>
</body>
</html>
