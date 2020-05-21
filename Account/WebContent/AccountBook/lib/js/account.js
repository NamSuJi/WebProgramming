function reaccount(){
	f.inDate1.value = f.date1.value;//지난 달
	f.inDate2.value = f.date2.value;//현재 달
	//alert(f.date1.value+"/"+f.date2.value);
	f.target = "_self";
	f.action = "account.jsp";
	f.submit();
}
function goAccount(){
	f.target = "_self";
	f.action = "account.jsp";
	f.submit();
}
function goAccountList(num){
	if(f.inData.value==null) f.inData.value = "";
	else f.inData.value = num;
	f.target = "_self";
	f.action = "accountList.jsp";
	f.submit();
}
function goAccountSave(num){
	if(num==null){ 
		f.inData.value = "";
		if(f.txtSubject.value == ''&&f.txtContent.value == ''){
			alert('제목, 내용 입력 안함');
			return;
		}
	}else{
		f.inData.value = num;
	}
	f.target = "_self";
	f.action = "accountListSave.jsp";
	f.submit();
}
function goAccountDelete(num){
	if(!confirm('삭제 하시겠습니까?')){
		return;
	}
	f.inData.value = num;
	f.target = "_self";
	f.action = "accountListDelete.jsp";
	f.submit();
}
function categoryChange(e){
	var category_i = ["용돈", "월급", "기타"];
	var category_o = ["생활", "교육", "음주", "기타"];
	var target = document.getElementById("txtcategory");
	 
	if(e.value == "입금") var d = category_i;
	else if(e.value == "지출") var d = category_o;
	 
	target.options.length = 0;
	 
	for (x in d) {
	  var opt = document.createElement("option");
	  opt.value = d[x];
	  opt.innerHTML = d[x];
	  target.appendChild(opt);
	} 
}