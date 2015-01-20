<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*" import="com.shinowt.entity.UserInfo" 
    pageEncoding="utf-8"%>
<%@page import="com.shinowt.bbs.imp.ListSession" %>    
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<% List<HttpSession> current_online_user=ListSession.xxx;
 for(int i=0;i<current_online_user.size();i++){
	HttpSession  current_session=current_online_user.get(i);
	 out.print("............");
	UserInfo userinfo=(UserInfo)current_session.getAttribute("current_login_info");
	out.print("username="+userinfo.getUser_name());
 }

%>
</body>
</html>