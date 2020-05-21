function goView(num){
	f.inData.value = num; 
	f.target = '_self';
	f.action = 'QnAview.jsp';
	f.submit();
}
function goWrite(num){
	if(num==null) f.inData.value="";
	else f.inData.value = num;
	f.target = "_self";
	f.action = "QnAwrite.jsp";
	f.submit();
}
function goSave(userID, num){
	if(num==null){
		f.inData.value = "";
		if(f.txtSubject.value == ''&&f.txtContent.value == ''){
			alert('제목, 내용 입력 안함');
			return;
		}
	}else{
		f.inData.value = num;
	}
	f.userID.value = userID;
	f.target = "_self";
	f.action = "QnAsave.jsp";
	f.submit();
}
function goList(){
	f.target = '_self';
	f.action = "QnA.jsp";
	f.submit();
}
function goDelete(num){
	if(!confirm('삭제 하시겠습니까?')){
		return;
	}
	f.inData.value = num;
	f.target = "_self";
	f.action = "QnAdelete.jsp";
	f.submit();
}
