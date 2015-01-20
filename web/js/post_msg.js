function check_post_valid(){
	
	if(false==UE.getEditor('editor').hasContents()){
		alert('请输入留言内容!');
		return false;
	}
	document.getElementById("msg").value=UE.getEditor('editor').getContent();
	
	document.forms[0].submit();
}	
	function check_post_valid1(){	
	var usercontent=document.getElementById("msgreply").value;
	if((null==usercontent)||(usercontent.length<1)){
		alert('请输入留言内容!');
		document.getElementById("msgreply").focus();
		return false;
	}
	document.forms[0].submit();
	}	

