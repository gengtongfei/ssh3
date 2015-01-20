function gotopage(max_page_number){
	
	var page_num_value=document.getElementById("pageNum").value;
	if((null==page_num_value)||(page_num_value.length<1)){
		alert('请输入跳转页数!');
		document.getElementById("pageNum").focus();
		return false;
	}
	if((page_num_value>max_page_number)||(page_num_value<1)){
		alert('请输入正确的页号');
		document.getElementById("pageNum").focus();
		return false;
	}
window.location.href="index.jsp?pageNum="+page_num_value;


}
