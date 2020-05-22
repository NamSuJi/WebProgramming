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
					<input type='text' name='txtId' class='logininput' placeholder='Enter ID'/>
				</div>
				<div class='loginbox'>
					<input type='email' id='email' name='txtEmail' class='logininput' placeholder='Enter Email'/>
				</div>
				<div class='loginbox'>
					<input type='password' name='txtPwd' class='logininput' placeholder='Enter Password'/>
				</div>
				<div class='loginbox'>
					<input type='button' class='loginbutton' value='회원가입' onclick='goJoinCheck();' onkeypress="if(event.keyCode == 13){ goJoinCheck(); return; }"/>
				</div>
			</div>
		</div>
	</div>
</form>
<%@ include file="../lib/userfooter.jsp" %>