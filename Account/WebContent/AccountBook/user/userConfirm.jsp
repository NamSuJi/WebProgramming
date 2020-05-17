<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../lib/userheader.jsp" %>
<form method="post" name='f'>
	<div class='wrap'>
		<div class='wrapbox'>
			<div class='boxtop'>
				<a href='../index.jsp'>Money</a>
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
<%@ include file="../lib/userfooter.jsp" %>