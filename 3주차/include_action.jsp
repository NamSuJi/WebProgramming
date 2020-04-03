<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include_action.jsp</title>
</head>
<body>
<h2>include_jsp 에서 footer.jsp 호출</h2>
<hr>
include_action.jsp 에서 호출한 메시지입니다.<br>
<jsp:include page="footer.jsp">
	<jsp:param name="email" value="test@test.net"/>
	<jsp:param name="tel" value="000-0000-0000" />
</jsp:include>
</body>
</html>
