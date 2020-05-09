function goView(num){
	f.num.value = num; 
	f.target = '_self';
	f.action = 'view.jsp';
	f.submit();
}
function goWrite(category, num){
	if(num==null) f.num.value=="";
	else f.num.value = num;
	f.inData.value = category;
	f.target = "_self";
	f.action = "write.jsp";
	f.submit();
}
function goSave(category, userID, num){
	if(num==null){
		f.num.value = "";
		if(f.txtSubject.value == ''&&f.txtContent.value == ''){
			alert('제목, 내용 입력 안함');
			return;
		}
	}else{
		f.num.value = num;
	}
	f.userID.value = userID;
	f.inData.value = category;
	f.target = "_self";
	f.action = "save.jsp";
	f.submit();
}
function goList(category){
	var url = "list.jsp?inData="+category;
	f.target = '_self';
	f.action = url;
	f.submit();
}
function goDelete(category, num){
	if(!confirm('삭제 하시겠습니까?')){
		return;
	}
	f.inData.value = category;
	f.num.value = num;
	f.target = "_self";
	f.action = "delete.jsp";
	f.submit();
}
