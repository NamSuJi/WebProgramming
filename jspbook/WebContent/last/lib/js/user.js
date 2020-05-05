/**
 * 
 */
function goLoginCheck(){
	if(f.id.value == ''){ alert("아이디를 입력해 주세요.");  return;}
	if(f.pwd.value == ''){ alert("비밀번호를 입력해 주세요.");  return;}
	
	f.target = '_self';
	f.action = 'logincheck.jsp';
	f.submit();
}
function goJoinCheck(){
    var regId = /^[a-z0-9]{4,20}$/; 
	var regEmail = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
	var regPwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;

	if(f.txtId.value == ''){ alert("아이디를 입력해 주세요.");  return;}
	if(!f.txtId.value.match(regId)){ alert("아이디는 영 소문자, 숫자 4~20 자리로 입력해주세요."); return;}
	
	if(f.txtEmail.value == ''){ alert("이메일을 입력해 주세요.");  return;}
	if(!f.txtEmail.value.match(regEmail)){ alert("이메일 형식에 맞지 않습니다."); return;}
	
	if(f.txtPwd.value == ''){ alert("비밀번호를 입력해 주세요.");  return;}
	if(!f.txtPwd.value.match(regPwd)){ alert("'비밀번호 형식을 확인하세요.(영문,숫자를 혼합하여 6~20자 이내)"); return;}
	
	f.target = '_self';
	f.action = 'joincheck.jsp';
	f.submit();
}
function goUserCheck(){
	if(f.pwd.value == ''){ alert("비밀번호를 입력해 주세요.");  return;}
	
	f.target = '_self';
	f.action = 'userConfirmCheck.jsp';
	f.submit();
}
function goUserInfoUpdate(){
	var regPwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;

	if(f.txtPwd.value == ''){ alert("비밀번호를 입력해 주세요.");  return;}
	if(!f.txtPwd.value.match(regPwd)){ alert("'비밀번호 형식을 확인하세요.(영문,숫자를 혼합하여 6~20자 이내)"); return;}
	
	f.target = '_self';
	f.action = 'userInfoUpdate.jsp';
	f.submit();
}
function goUserInfoDelete(userId){
	if(!confirm('탈퇴 하시겠습니까?')){
		return;
	}
	f.inData.value = userId;
	f.target = "_self";
	f.action = "userInfoDelete.jsp";
	f.submit();
}
