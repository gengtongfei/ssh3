function check_reg_valid(){
	
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
	var userpass1=document.getElementById("userpass1").value;
	if((null==userpass1)||(userpass1.length<1)){
		alert('请再次输入密码!');
		document.getElementById("userpass1").focus();
		return false;
	}
	if(userpass1!=userpass){
		alert('两次输入密码不一致');
		document.getElementById("userpass").focus();
		return false;
	}
	var validCodevalue=document.getElementById("valid_code").value;
	if((null==validCodevalue)||(validCodevalue.length!=4)){
		alert('请输入正确的验证码!');
		document.getElementById("valid_code").focus();
		return false;
	}

	if(document.getElementById("agreement_checkbox").checked==false){
		window.alert("未经许可协议，无法注册!");
		return false;
	}
	
	document.forms[0].submit();
}
function reload_image(){
	document.getElementById("valid_image").src="validCode.jsp?r="+Math.random();
	
}