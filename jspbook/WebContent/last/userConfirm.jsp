<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Code</title>
<meta charset = "UTF-8">
<link rel="stylesheet" href="lib/css/other.css">
<script src="lib/js/user.js?v=<%=System.currentTimeMillis() %>"></script>
</head>
<body>
<form method="post" name='f'>
	<div class='wrap'>
		<div class='wrapbox'>
			<div class='boxtop'>
				<a href='index.jsp'>Code</a>
			</div>
			<div class='login'>
				<div class='loginbox'>
					<input type='password' name='pwd' class='logininput' placeholder='Password' />
				</div>
				<div class='loginbox'>
					<input type='button' class='loginbutton' value='Confirm' onclick='goUserCheck();' />
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>
