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
					<input type='text' name='id' class='logininput' placeholder='ID' />
				</div>
				<div class='loginbox'>
					<input type='text' name='pwd' class='logininput' placeholder='PASSWORD' />
				</div>
				<div class='loginbox'>
					<input type='button' class='loginbutton' value='로그인' onclick='goLoginCheck();' onkeypress="if(event.keyCode == 13){ goLoginCheck(); return; }" />
				</div>
				<div class='loginbox'>
					<div class='joinbox'>
					<input type='button' class='joininput' value='회원가입' onclick="javascript:location.href='join.jsp'" />
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<%@ include file="../lib/userfooter.jsp" %>
