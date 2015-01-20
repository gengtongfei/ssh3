function check_login_valid(){
	
	var username=document.getElementById("username").value;
	if((null==username)||(username.length<1)){
		alert('请输入登录名称!');
		document.getElementById("username").focus();
		return false;
	}
	var userpass=document.getElementById("userpass").value;
	if((null==userpass)||(userpass.length<1)){
		alert('请输入登录密码!');
		document.getElementById("userpass").focus();
		return false;
	}

	var validCodevalue=document.getElementById("valid_code").value;
	if((null==validCodevalue)||(validCodevalue.length!=4)){
		alert('请输入正确的验证码!');
		document.getElementById("valid_code").focus();
		return false;
	}

	
	document.forms[0].submit();
}
function reload_valid_image(){
	document.getElementById("valid_image").src="validCode.jsp";
	
}